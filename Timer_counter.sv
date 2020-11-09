`timescale 1ns/1ps 

module Timer_counter(
	input wire clk, reset, Start, 
	input reg [4:0] Initial,
	output logic Ovf5);	
	
	always @(posedge clk) begin
		Ovf5 <= repeat (Initial-1) @(posedge clk) Start;
	end

endmodule