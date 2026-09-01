`timescale 1ns/1ns
module linear_machine_tb();

reg Clk,Reset_n;
reg [7:0] sw;
wire Led;

linear_machine linear_machine(
	.Clk(Clk),
	.Reset_n(Reset_n),
	.sw(sw),
	.Led(Led)
);
defparam linear_machine.MCNT = 12_500-1;
//defparam linear_machine.MCNT2 = 12_500;


initial  Clk = 1;
always #10 Clk = ~Clk;

initial begin
	Reset_n = 0;
	sw = 8'b1010_1010;
	#201
	Reset_n = 1;
	#4_000_000_0;
	sw = 8'b0000_0001;
	#4_000_000_0;
	sw = 8'b1111_0000;
	$stop;
end

endmodule
