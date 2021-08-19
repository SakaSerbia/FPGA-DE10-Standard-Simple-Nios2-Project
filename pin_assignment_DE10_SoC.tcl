###############################################################################
# pin_assignment_DE10_SoC.tcl
# ==========================
#
# BOARD : DE10-Standard
# Author : Stefan TESANOVIC
# Revision : 1.0
# Last updated : 2021-08-17 21:05:39 UTC
#
# Syntax Rule : GROUP_NAME_N[bit]
#
# GROUP  : specify a particular interface (ex: SDR_)
# NAME   : signal name (ex: CONFIG, D, ...)
# bit    : signal index
# _N     : to specify an active-low signal
#
# You can run this script from Quartus by observing the following steps:
# 1. Place this TCL script in your project directory
# 2. Open your project in Quartus
# 3. Go to the View > Utility Windows -> Tcl Console
# 4. In the Tcl Console type:
#        source pin_assignment_DE10_SoC.tcl
#
# 5. The script will assign pins and return an "assignment made" message.
###############################################################################


#============================================================
# Build by Terasic System Builder
#============================================================

set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CSXFC6D6F31C6
set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
set_global_assignment -name DEVICE_FILTER_PIN_COUNT 896
set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6

#============================================================
# CLOCK
#============================================================

set_location_assignment PIN_AF14 -to clk_50MHz
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk_50MHz

#============================================================
# SDRAM
#============================================================

set_location_assignment PIN_AK14 -to SDRAM_ADDR[0]
set_location_assignment PIN_AH14 -to SDRAM_ADDR[1]
set_location_assignment PIN_AG15 -to SDRAM_ADDR[2]
set_location_assignment PIN_AE14 -to SDRAM_ADDR[3]
set_location_assignment PIN_AB15 -to SDRAM_ADDR[4]
set_location_assignment PIN_AC14 -to SDRAM_ADDR[5]
set_location_assignment PIN_AD14 -to SDRAM_ADDR[6]
set_location_assignment PIN_AF15 -to SDRAM_ADDR[7]
set_location_assignment PIN_AH15 -to SDRAM_ADDR[8]
set_location_assignment PIN_AG13 -to SDRAM_ADDR[9]
set_location_assignment PIN_AG12 -to SDRAM_ADDR[10]
set_location_assignment PIN_AH13 -to SDRAM_ADDR[11]
set_location_assignment PIN_AJ14 -to SDRAM_ADDR[12]
set_location_assignment PIN_AF13 -to SDRAM_BA[0]
set_location_assignment PIN_AJ12 -to SDRAM_BA[1]
set_location_assignment PIN_AF11 -to SDRAM_CAS_N
set_location_assignment PIN_AK13 -to SDRAM_CKE
set_location_assignment PIN_AH12 -to SDRAM_CLK
set_location_assignment PIN_AG11 -to SDRAM_CS_N
set_location_assignment PIN_AK6  -to SDRAM_DQ[0]
set_location_assignment PIN_AJ7  -to SDRAM_DQ[1]
set_location_assignment PIN_AK7  -to SDRAM_DQ[2]
set_location_assignment PIN_AK8  -to SDRAM_DQ[3]
set_location_assignment PIN_AK9  -to SDRAM_DQ[4]
set_location_assignment PIN_AG10 -to SDRAM_DQ[5]
set_location_assignment PIN_AK11 -to SDRAM_DQ[6]
set_location_assignment PIN_AJ11 -to SDRAM_DQ[7]
set_location_assignment PIN_AH10 -to SDRAM_DQ[8]
set_location_assignment PIN_AJ10 -to SDRAM_DQ[9]
set_location_assignment PIN_AJ9  -to SDRAM_DQ[10]
set_location_assignment PIN_AH9  -to SDRAM_DQ[11]
set_location_assignment PIN_AH8  -to SDRAM_DQ[12]
set_location_assignment PIN_AH7  -to SDRAM_DQ[13]
set_location_assignment PIN_AJ6  -to SDRAM_DQ[14]
set_location_assignment PIN_AJ5  -to SDRAM_DQ[15]
set_location_assignment PIN_AB13 -to SDRAM_DQM[0] 
set_location_assignment PIN_AE13 -to SDRAM_RAS_N
set_location_assignment PIN_AK12 -to SDRAM_DQM[1] 
set_location_assignment PIN_AA13 -to SDRAM_WE_N

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_ADDR[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_BA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_BA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_CAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_CKE
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQ[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQM[0] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_RAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_DQM[1] 
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SDRAM_WE_N

#============================================================
# SEG7
#============================================================

set_location_assignment PIN_W17  -to led_digit0[0]
set_location_assignment PIN_V18  -to led_digit0[1]
set_location_assignment PIN_AG17 -to led_digit0[2]
set_location_assignment PIN_AG16 -to led_digit0[3]
set_location_assignment PIN_AH17 -to led_digit0[4]
set_location_assignment PIN_AG18 -to led_digit0[5]
set_location_assignment PIN_AH18 -to led_digit0[6]
set_location_assignment PIN_AF16 -to led_digit1[0]
set_location_assignment PIN_V16  -to led_digit1[1]
set_location_assignment PIN_AE16 -to led_digit1[2]
set_location_assignment PIN_AD17 -to led_digit1[3]
set_location_assignment PIN_AE18 -to led_digit1[4]
set_location_assignment PIN_AE17 -to led_digit1[5]
set_location_assignment PIN_V17  -to led_digit1[6]
set_location_assignment PIN_AA21 -to led_digit2[0]
set_location_assignment PIN_AB17 -to led_digit2[1]
set_location_assignment PIN_AA18 -to led_digit2[2]
set_location_assignment PIN_Y17  -to led_digit2[3]
set_location_assignment PIN_Y18  -to led_digit2[4]
set_location_assignment PIN_AF18 -to led_digit2[5]
set_location_assignment PIN_W16  -to led_digit2[6]
set_location_assignment PIN_Y19  -to led_digit3[0]
set_location_assignment PIN_W19  -to led_digit3[1]
set_location_assignment PIN_AD19 -to led_digit3[2]
set_location_assignment PIN_AA20 -to led_digit3[3]
set_location_assignment PIN_AC20 -to led_digit3[4]
set_location_assignment PIN_AA19 -to led_digit3[5]
set_location_assignment PIN_AD20 -to led_digit3[6]
#set_location_assignment PIN_AD21 -to HEX4[0]
#set_location_assignment PIN_AG22 -to HEX4[1]
#set_location_assignment PIN_AE22 -to HEX4[2]
#set_location_assignment PIN_AE23 -to HEX4[3]
#set_location_assignment PIN_AG23 -to HEX4[4]
#set_location_assignment PIN_AF23 -to HEX4[5]
#set_location_assignment PIN_AH22 -to HEX4[6]
#set_location_assignment PIN_AF21 -to HEX5[0]
#set_location_assignment PIN_AG21 -to HEX5[1]
#set_location_assignment PIN_AF20 -to HEX5[2]
#set_location_assignment PIN_AG20 -to HEX5[3]
#set_location_assignment PIN_AE19 -to HEX5[4]
#set_location_assignment PIN_AF19 -to HEX5[5]
#set_location_assignment PIN_AB21 -to HEX5[6]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit0[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit0[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit0[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit0[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit1[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit2[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit2[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit2[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit2[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit2[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit2[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit2[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit3[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit3[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit3[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit3[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit3[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit3[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led_digit3[6]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[4]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[5]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[6]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[3]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[4]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[5]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[6]

#============================================================
# KEY_N
#============================================================

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to btn_light_up_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to btn_light_dn_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to btn_speed_up_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to btn_speed_dn_n

set_location_assignment PIN_AJ4  -to btn_light_up_n
set_location_assignment PIN_AK4  -to btn_light_dn_n
set_location_assignment PIN_AA14 -to btn_speed_up_n
set_location_assignment PIN_AA15 -to btn_speed_dn_n

#============================================================
# SW
#============================================================

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_num[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_num[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_num[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_num[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_num[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_num[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_num[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_num[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sw_sel
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to reset_n

set_location_assignment PIN_AB30 -to sw_num[0]
set_location_assignment PIN_Y27  -to sw_num[1]
set_location_assignment PIN_AB28 -to sw_num[2]
set_location_assignment PIN_AC30 -to sw_num[3]
set_location_assignment PIN_W25  -to sw_num[4]
set_location_assignment PIN_V25  -to sw_num[5]
set_location_assignment PIN_AC28 -to sw_num[6]
set_location_assignment PIN_AD30 -to sw_num[7]
set_location_assignment PIN_AC29 -to sw_sel
set_location_assignment PIN_AA30 -to reset_n
