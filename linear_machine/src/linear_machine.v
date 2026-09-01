module linear_machine(
	Clk,
	Reset_n,
	sw,
	Led
);

input Clk,Reset_n;
input [7:0]sw;
output reg Led;
	
	reg [24:0]counter;
	reg [2:0]counter2;
	parameter MCNT = 12_500_000 -1;
	
always@(posedge Clk or negedge Reset_n)
	if(!Reset_n)
		counter <= 0;
	else if(counter == MCNT)
		counter <= 0;
	else
		counter <= counter + 1'd1;
		
always@(posedge Clk or negedge Reset_n)
	if(!Reset_n)
		counter2 <= 0;
	else if(counter == MCNT)begin
			counter2 <= counter2 + 1'd1;
	end


always@(posedge Clk or negedge Reset_n)
	if(!Reset_n)
		Led <= 0;
	else 
	begin
		case(counter2)
		0:Led <= sw[0];
		1:Led <= sw[1];
		2:Led <= sw[2];
		3:Led <= sw[3];
		4:Led <= sw[4];
		5:Led <= sw[5];
		6:Led <= sw[6];
		7:Led <= sw[7];
		default: Led <= Led;
		endcase
	
	end

// #task1
//parameter MCNT = 50_000_000 - 1;
//parameter MCNT2 = 12_500_000;
//reg [25:0]counter;
//
//always@(posedge Clk or negedge Reset_n)
//	if(!Reset_n)
//		counter <= 0;
//	else if(counter == MCNT)
//		counter <= 0;
//	else
//		counter <= counter + 1'd1;
//
//		
//always@(posedge Clk or negedge Reset_n)
//	if(!Reset_n)
//		Led <= 0;
//	else if(counter == 0)
//		Led <= 1;
//	else if(counter == MCNT2)
//		Led <= 0;

endmodule