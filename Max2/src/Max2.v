module Max2(
	a,
	b,
	sel,
	out
);

//sel = 0;out = a
//sel = 1;out = b

	input a;
	input b;
	input sel;
	output out;
	
	assign out = (sel == 0)?a:b;	// 

endmodule