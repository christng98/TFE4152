`timescale 1ns/1ps 

module FSM_ex_control(
	input wire clk, reset, Init, Ovf5,
	output reg NRE_1, NRE_2, ADC, Expose, Erase, Start, Ovf4);
	
	typedef enum logic [1:0] { Idle, Exposure, Readout} State;
	
	State currentState, nextState;
	
	
	always_ff @(posedge clk) begin
	
		if(reset)	currentState <= Idle;
		else 	begin	currentState <= nextState;	$display(nextState); end
	end
	
	always @(*) begin
		
		case(currentState)
			Idle: begin
						$display("Idle");
						Start  		 <= 1'b0;
						Expose 		 <= 1'b0;
						Erase 		 <= 1'b1;
						NRE_1		 <= 1'b1;
						NRE_2		 <= 1'b1;
						ADC			 <= 1'b0;
						Ovf4			 <= 1'b0;
						
						if(Init) nextState <= Exposure;		
						else 	nextState <= Idle;
				  end	
			Exposure: begin
						$display("Exposure");
						Start		 <= 1'b1;
						Expose		 <= 1'b1;
						Erase 		 <= 1'b0;	
						
						if(Ovf5) nextState <= Readout;
						else 	nextState <= Exposure;
					 end
			Readout:	begin
						$display("Readout");
						Start 		 <= 1'b0;
						Expose  		 <= 1'b0;
						#1;
						NRE_1 		 <= 1'b0;
						#1;
						ADC 			 <= 1'b1;
						#1;
						ADC 			 <= 1'b0;
						#1;
						NRE_1		 <= 1'b1;
						#1;
						NRE_2		 <= 1'b0;
						#1;
						ADC 			 <= 1'b1;
						#1;
						ADC		 	 <= 1'b0;
						#1;
						NRE_2		  = 1'b1;
						Ovf4			  = 1'b1;
						$display(Ovf4);
						if(Ovf4) begin	
							$display("We here");
							nextState <= Idle;
						end
						else 	nextState <= Readout;
					end
			
			default:	nextState <= Idle;
					  
		endcase		
	end
endmodule