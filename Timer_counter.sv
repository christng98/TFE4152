`timescale 1ns/1ps 

module Timer_counter(
	input wire clk, reset, Start, Initial,
	output logic Ovf5);	
	
	integer i;
	reg [4:0] counter; 
	
	always_ff @(posedge clk) begin
		if(Start) begin
			counter <= Initial;
			for (i = 0; i < counter; i = i + 1) begin
				counter <= counter - 1;
			end
			Ovf5 <= 1'b1;
		end else Ovf5 <= 1'b0;
	end

endmodule