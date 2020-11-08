`timescale 1ns/1ps

module CTRL_ex_time(
	input wire clk, reset, Exp_inc, Exp_dec, Erase,
	output reg [4:0] EX_time);	 
	
	integer i;
	reg [4:0] counter = 5'b00010;
	
	always_ff @(posedge clk) begin
		if(Exp_inc && Erase && counter <= 5'b11110)	begin
			counter <= counter + 1;
			EX_time <= counter;
		end
		else if (Exp_dec && Erase && counter >= 5'b00010) begin
			counter <= counter - 1;
			EX_time <= counter;
		end
	end	
	
endmodule