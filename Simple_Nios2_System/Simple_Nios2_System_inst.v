	Simple_Nios2_System u0 (
		.clk_clk              (<connected-to-clk_clk>),              //           clk.clk
		.reset_reset_n        (<connected-to-reset_reset_n>),        //         reset.reset_n
		.sdram_clk_clk        (<connected-to-sdram_clk_clk>),        //     sdram_clk.clk
		.sdram_addr           (<connected-to-sdram_addr>),           //         sdram.addr
		.sdram_ba             (<connected-to-sdram_ba>),             //              .ba
		.sdram_cas_n          (<connected-to-sdram_cas_n>),          //              .cas_n
		.sdram_cke            (<connected-to-sdram_cke>),            //              .cke
		.sdram_cs_n           (<connected-to-sdram_cs_n>),           //              .cs_n
		.sdram_dq             (<connected-to-sdram_dq>),             //              .dq
		.sdram_dqm            (<connected-to-sdram_dqm>),            //              .dqm
		.sdram_ras_n          (<connected-to-sdram_ras_n>),          //              .ras_n
		.sdram_we_n           (<connected-to-sdram_we_n>),           //              .we_n
		.pi_buttons_export    (<connected-to-pi_buttons_export>),    //    pi_buttons.export
		.pi_switch_num_export (<connected-to-pi_switch_num_export>), // pi_switch_num.export
		.pi_switch_sel_export (<connected-to-pi_switch_sel_export>), // pi_switch_sel.export
		.po_pwm_export        (<connected-to-po_pwm_export>),        //        po_pwm.export
		.po_bcd_export        (<connected-to-po_bcd_export>)         //        po_bcd.export
	);

