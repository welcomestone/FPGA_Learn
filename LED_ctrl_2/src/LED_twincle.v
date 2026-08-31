module LED_twincle(
	Clk,
	Reset_n,
	Led
);

	input Clk ,Reset_n;
	output reg Led;
	
	parameter MCNT = 25_000_000 -1;
	
	reg [24:0] counter;
	
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			counter <= 0;
		else if(counter == MCNT)
			counter <= 0;
		else
			counter <= counter + 1'd1;
			
	
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			Led <= 0;
		else if(counter == MCNT)
			Led = !Led;
		

endmodule