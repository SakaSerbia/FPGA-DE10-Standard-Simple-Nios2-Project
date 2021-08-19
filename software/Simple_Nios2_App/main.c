/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <altera_avalon_pio_regs.h>
#include <altera_avalon_timer_regs.h>
#include <sys/alt_irq.h>
#include <system.h>

#define MAX_LED_PERIOD_SEC 10

#define BTN_INC_LED_PERIOD_MSK 0x1
#define BTN_DEC_LED_PERIOD_MSK 0x2
#define BTN_INC_PWM_MAX_COUNT_MSK 0x4
#define BTN_DEC_PWM_MAX_COUNT_MSK 0x8
#define BTN_ALL_MSK (BTN_INC_LED_PERIOD_MSK + \
                     BTN_DEC_LED_PERIOD_MSK + \
                     BTN_INC_PWM_MAX_COUNT_MSK + \
                     BTN_DEC_PWM_MAX_COUNT_MSK)

#define COUNT_STEP 5
#define MAX_PWM_COUNT 255

/*Structure of PWM parameters for communication with timer ISR*/

typedef enum {PWM_COUNT_UP, PWM_COUNT_DOWN} pwm_direction_t;

typedef struct {
  unsigned int count;
  unsigned int max_count;
  pwm_direction_t direction;
} pwm_params_t;

static int bin2bcd(int a)
{
  a = ((a/100)<<8) +
	  (((a - (a/100)*100)/10)<<4) +
	  (a - (a/10)*10);
  return a;
}

void handle_timer_interrupts(void *context)
{
	pwm_params_t *pwm_params = (pwm_params_t*) context;

	/* Acknowledge interrupt by clearing status register */
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_BASE, 0x0);

	pwm_params->count = (pwm_params->direction == PWM_COUNT_UP)? pwm_params->count+1 : pwm_params->count-1;
	if ((pwm_params->count == 0) || (pwm_params->count >= pwm_params->max_count))
	{
		if (pwm_params->count > pwm_params->max_count) pwm_params->count = pwm_params->max_count;
		if (pwm_params->count < 0) pwm_params->count = 0;

		pwm_params->direction = (pwm_params->direction == PWM_COUNT_UP) ? PWM_COUNT_DOWN : PWM_COUNT_UP;
	}
}

void handle_button_interrupts(void *context)
{
	unsigned int *button_action = (unsigned int*) context;

	*button_action =  IORD_ALTERA_AVALON_PIO_EDGE_CAP(PI_BUTTONS_BASE);

	/* Acknowledge interrupt by clearing edge capture register */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PI_BUTTONS_BASE, *button_action);
}

int main()
{
  int a = 0, b = 0, sel = 0, c = 0;

  volatile pwm_params_t pwm_params = {0, MAX_PWM_COUNT, PWM_COUNT_UP};
  unsigned int led_period_sec = MAX_LED_PERIOD_SEC;
  unsigned int timer_period = (led_period_sec*TIMER_FREQ)/(2*pwm_params.max_count + 1);
  volatile unsigned int button_action = 0;

  printf("Hello from Nios II!\n");

  /* Set initial timer period */
  IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_BASE, timer_period);
  IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_BASE, timer_period >> 16);

  /* Configure and start the timer */
  IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_BASE, ALTERA_AVALON_TIMER_CONTROL_ITO_MSK +
  											   ALTERA_AVALON_TIMER_CONTROL_CONT_MSK +
  											   ALTERA_AVALON_TIMER_CONTROL_START_MSK);

  /* Register timer ISR */
  alt_ic_isr_register(TIMER_IRQ_INTERRUPT_CONTROLLER_ID,
					  TIMER_IRQ,
					  handle_timer_interrupts,
					  (void*)&pwm_params,
					  0x0);

  /* Reset button edge capture register for all buttons */
  IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PI_BUTTONS_BASE, BTN_ALL_MSK);

  /* Enable interrupts for all buttons */
  IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PI_BUTTONS_BASE, BTN_ALL_MSK);

  /* Register buttons ISR */
  alt_ic_isr_register(PI_BUTTONS_IRQ_INTERRUPT_CONTROLLER_ID,
					  PI_BUTTONS_IRQ,
					  handle_button_interrupts,
					  (void*)&button_action,
					  0x0);

  while (1)
  {
	  IOWR_ALTERA_AVALON_PIO_DATA(PO_PWM_BASE, pwm_params.count);

	  sel = IORD_ALTERA_AVALON_PIO_DATA(PI_SWITCH_SEL_BASE);

	  if (sel == 1)
	  {
		  a = IORD_ALTERA_AVALON_PIO_DATA(PI_SWITCH_NUM_BASE);
	  }
	  else
	  {
		  b = IORD_ALTERA_AVALON_PIO_DATA(PI_SWITCH_NUM_BASE);
	  }

	  c = bin2bcd(a + b);

	  IOWR_ALTERA_AVALON_PIO_DATA(PO_BCD_BASE, c);

	  if (button_action)
	  {
		  if (button_action & BTN_INC_LED_PERIOD_MSK)
		  {
			  led_period_sec = (led_period_sec == MAX_LED_PERIOD_SEC) ? MAX_LED_PERIOD_SEC : led_period_sec + 1;
			  printf("LED period changed to: %d sec\n", led_period_sec);
		  }

		  if (button_action & BTN_DEC_LED_PERIOD_MSK)
		  {
			  led_period_sec = (led_period_sec == 0) ? 0 : led_period_sec - 1;
			  printf("LED period changed to: %d sec\n", led_period_sec);
		  }

		  if (button_action & BTN_INC_PWM_MAX_COUNT_MSK)
		  {
			  pwm_params.max_count = (pwm_params.max_count > (MAX_PWM_COUNT - COUNT_STEP)) ? MAX_PWM_COUNT : pwm_params.max_count + COUNT_STEP;
			  printf("PWM max count changed to: %d\n", pwm_params.max_count);
		  }

		  if (button_action & BTN_DEC_PWM_MAX_COUNT_MSK)
		  {
			  pwm_params.max_count = (pwm_params.max_count < COUNT_STEP) ? 0 : pwm_params.max_count - COUNT_STEP;
			  printf("PWM max count changed to: %d\n", pwm_params.max_count);
		  }

		  /* Re-calculate timer period */
		  timer_period = (led_period_sec*TIMER_FREQ)/(2*pwm_params.max_count + 1);

		  /* Update timer period */
		  IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_BASE, timer_period);
		  IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_BASE, timer_period >> 16);

		  /* Restart timer */
		  IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_BASE, ALTERA_AVALON_TIMER_CONTROL_ITO_MSK +
		  											   ALTERA_AVALON_TIMER_CONTROL_CONT_MSK +
		  											   ALTERA_AVALON_TIMER_CONTROL_START_MSK);

		  button_action = 0;
	  }
  }

  return 0;
}



