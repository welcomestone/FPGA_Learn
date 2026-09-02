`timescale 1ns/1ns
module UART_tx_tb();


	reg Clk;
	reg Reset_n;
	reg [7:0] Data;
	reg send_go;
	wire uart_tx;
	wire tx_busy;
	wire tx_done;


UART_tx UART_tx(
	.Clk(Clk),
	.Reset_n(Reset_n),
	.Data(Data),
	.uart_tx(uart_tx),
	.send_go(send_go),
	.tx_busy(tx_busy),
	.tx_done(tx_done)
);

defparam UART_tx.BAUD = 115200; 

initial Clk = 1;
always #10  Clk = ~Clk;

initial begin
	Reset_n = 0;
	#201;
	Reset_n = 1;
	send_go = 1;
	Data = 8'b1010_1010;
	#3_000_00;
	send_go = 0;
	#20;
	send_go = 1;
	Data = 8'b0101_0101;
	#3_000_00;
	$stop;
	

end



endmodule