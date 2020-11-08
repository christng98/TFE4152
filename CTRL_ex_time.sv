`timescale 1ns/1ps

module CTRL_ex_time(
	input wire clk, reset, Exp_inc, Exp_dec, Erase,
	output logic EX_time);	 
	
	integer i;
	reg [4:0] counter = 5'b00010;
	
	always_ff @(posedge clk) begin
		if(Exp_inc && Erase)	begin
			for (i = 2; i < 30; i = i + 1) begin
				counter <= counter + 1;
			end	
			EX_time <= counter;
		end
		else if (Exp_dec && Erase) begin
		 	for (i = 30; i > 2; i = i - 1) begin
				 counter <= counter - 1;
			end
			EX_time <= counter;
		end
	end	
	
endmodule