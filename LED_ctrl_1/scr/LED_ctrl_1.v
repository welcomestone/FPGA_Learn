module LED_ctrl_1(
	Clk,
	Reset_n,
	LED
);

	input Clk,Reset_n;
	output reg [7:0]LED;

	reg [24:0]counter;
	parameter MCNT = 25_000_000-1;
	
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			counter <= 0;
		else if(counter == MCNT)
			counter <=0;
		else
			counter <= counter + 1'd1;
		
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			LED <= 8'b0000_0001;
		else if(counter == MCNT) begin
		
		//#1
//			if((LED == 8'b1000_0000) || (LED == 8'b0000_0000))
//				LED <= 8'b0000_0001;
//			else
//				LED <= LED<<1'd1;
		//#2

			LED <= {LED[6:0],LED[7]};
		end

endmodule