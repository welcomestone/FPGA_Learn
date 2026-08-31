`timescale 1ns/1ns

module LED_ctrl_2_tb();

reg Clk, Reset_n;
wire [3:0]Led;


LED_ctrl_2 LED_ctrl_2(
	.Clk(Clk),
	.Reset_n(Reset_n),
	.Led(Led)
);

initial Clk = 1;
always # 10 Clk = ~Clk;

initial begin
	Reset_n = 0;
	#201;
	Reset_n = 1;
	#2_000_000_000;
	$stop;

end


endmodule