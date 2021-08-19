
module Simple_Nios2_System (
	clk_clk,
	reset_reset_n,
	sdram_clk_clk,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	pi_buttons_export,
	pi_switch_num_export,
	pi_switch_sel_export,
	po_pwm_export,
	po_bcd_export);	

	input		clk_clk;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	input	[3:0]	pi_buttons_export;
	input	[7:0]	pi_switch_num_export;
	input		pi_switch_sel_export;
	output	[7:0]	po_pwm_export;
	output	[11:0]	po_bcd_export;
endmodule
