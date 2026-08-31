module LED_ctrl_2(
	Clk,
	Reset_n,
	Led
);
	input Clk ,Reset_n;
	output wire [3:0] Led;
	
	LED_twincle LED_twincle(
		.Clk(Clk),
		.Reset_n(Reset_n),
		.Led(Led[0])
	);

	LED_twincle
		#(
		.MCNT(12_500_000 - 1)
		)
	 LED_twincle1(
		.Clk(Clk),
		.Reset_n(Reset_n),
		.Led(Led[1])
	);

	LED_twincle LED_twincle2(
		.Clk(Clk),
		.Reset_n(Reset_n),
		.Led(Led[2])
	);
	defparam LED_twincle2.MCNT = 6_250_000 - 1;

	LED_twincle LED_twincle3(
		.Clk(Clk),
		.Reset_n(Reset_n),
		.Led(Led[3])
	);
	defparam LED_twincle3.MCNT = 2_500_000 - 1;
endmodule