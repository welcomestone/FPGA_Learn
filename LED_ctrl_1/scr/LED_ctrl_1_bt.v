`timescale 1ns/1ns
module LED_ctrl_1_bt();

	reg Clk;
	reg Reset_n;
	wire [7:0] LED;


LED_ctrl_1 
//#1
	#(
    .MCNT(25_000 - 1)
	)
LED_ctrl_1(
	.Clk(Clk),
	.Reset_n(Reset_n),
	.LED(LED)
);
//#2
//	defparam LED_ctrl_1.MCNT = 25_000 - 1;
	
	initial Clk = 1;
	always #10 Clk = ~Clk;
	
	initial begin
		Reset_n = 0;
		#201
		Reset_n = 1;
		#2_000_000_0;
		#2_000_000_0;
		$stop;
	end




endmodule