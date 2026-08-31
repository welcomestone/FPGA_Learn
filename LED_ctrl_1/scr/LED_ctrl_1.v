module LED_ctrl_1(
	Clk,
	Reset_n,
	LED
);

	input Clk,Reset_n;
	output wire [7:0]LED;

	reg [24:0]counter;
	reg [2:0]counter2;
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
			counter2 <= 0;
		else if(counter == MCNT)
			counter2 <= counter2 + 1'd1;
			
	decoder_3_8 decoder_3_8_inst0(

	.A0(counter2[0]),
	.A1(counter2[1]),
	.A2(counter2[2]),
	.Y0(LED[0]),
	.Y1(LED[1]),
	.Y2(LED[2]),
	.Y3(LED[3]),
	.Y4(LED[4]),
	.Y5(LED[5]),
	.Y6(LED[6]),
	.Y7(LED[7])	

);		
	
		
//	always@(posedge Clk or negedge Reset_n)
//		if(!Reset_n)
//			LED <= 8'b0000_0001;
//		else if(counter == MCNT) begin
//		
//		//#1
////			if((LED == 8'b1000_0000) || (LED == 8'b0000_0000))
////				LED <= 8'b0000_0001;
////			else
////				LED <= LED<<1'd1;
//		//#2
//
//			LED <= {LED[6:0],LED[7]};
//		end

endmodule