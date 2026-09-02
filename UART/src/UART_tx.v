module UART_tx(
	Clk,
	Reset_n,
	Data,
	uart_tx,
	send_go,
	tx_done,
	tx_busy
);

input Clk,Reset_n,send_go;
input [7:0]Data;
output reg uart_tx;
output reg tx_done;
output reg	 tx_busy;


parameter CLOCK_FREQ = 50_000_000;
parameter BAUD = 9600;
parameter MCNT_BIT = 10-1;
parameter MCNT_BAUD = CLOCK_FREQ / BAUD - 1;


	reg [29:0]baud_div_cnt;
	reg en_baud_cnt;
	reg [3:0]bit_cnt;
	reg [7:0]r_data;
	wire w_tx_done;
	reg send_go_d;
	
	always @(posedge Clk or negedge Reset_n)
	begin
		 if(!Reset_n)
			  send_go_d <= 0;
		 else
			  send_go_d <= send_go;
	end

	wire send_go_posedge;

	assign send_go_posedge = send_go & ~send_go_d;
	
	//波特率计数器
	// 1/9600 * 1_000_000_000 / 20 -1 = 5207.3  = 
	
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			en_baud_cnt <= 0;
		else if(!tx_busy && send_go_posedge)
			en_baud_cnt <= 1;
		else if(w_tx_done) begin
			en_baud_cnt <= 0; 
			end
	
	
	always @(posedge Clk or negedge Reset_n)
	begin
		 if(!Reset_n)
			  tx_busy <= 0;

		 else if(!tx_busy && send_go_posedge)
			  tx_busy <= 1;       // 开始发送

		 else if(w_tx_done)
			  tx_busy <= 0;       // 发送完成
	end
	
	
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			baud_div_cnt <= 0;
		else if(tx_busy) begin
			if(baud_div_cnt == MCNT_BAUD)
				baud_div_cnt <=0;
			else
				baud_div_cnt <= baud_div_cnt + 1'd1;
		end	
		else
			baud_div_cnt <= 0; 
			
		
	//位计数器
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			bit_cnt <= 0;
		else if(!tx_busy)
			bit_cnt <= 0;
		else if(baud_div_cnt == MCNT_BAUD)begin
			if(bit_cnt == MCNT_BIT)
				bit_cnt <= 0;
			else
			bit_cnt <= bit_cnt + 1'd1;
		end
		

	//位发送逻辑
	
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			r_data <=0;
		else if(!tx_busy && send_go_posedge)
			r_data <= Data;
	
	always@(posedge Clk or negedge Reset_n)
		if(!Reset_n)
			uart_tx <= 1;
		else if(!tx_busy)
			uart_tx <= 1;
		else begin
			case(bit_cnt)
				0:uart_tx <= 0;
				1:uart_tx <= r_data[0];
				2:uart_tx <= r_data[1];
				3:uart_tx <= r_data[2];
				4:uart_tx <= r_data[3];
				5:uart_tx <= r_data[4];
				6:uart_tx <= r_data[5];
				7:uart_tx <= r_data[6];
				8:uart_tx <= r_data[7];
				9:uart_tx <= 1;
				default uart_tx <= uart_tx;
			endcase
		end
	
	
	assign w_tx_done = (bit_cnt == MCNT_BIT)&& (baud_div_cnt == MCNT_BAUD);
	
	always@(posedge Clk)
		tx_done <= w_tx_done;

endmodule