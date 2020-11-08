`timescale 1ns/1ps 

module FSM_ex_control(
	input wire clk, reset, Init, Ovf5,
	output reg NRE_1, NRE_2, ADC, Expose, Erase, Start);
	
	typedef enum logic [1:0] { Idle, Exposure, Readout } State;
	
	State currentState, nextState;
	
	reg Ovf4 = 1'b0;
	
	always_ff @(posedge clk) begin
	
		if(reset)	currentState <= Idle;
		else 		currentState <= nextState;
	end
	
	always @(posedge clk) begin
		
		case(currentState)
			Idle: begin 
				if(Init) begin
					Erase      <= 1'b0;
					Expose     <= 1'b1;
					Start      <= 1'b1;
					nextState  <= Exposure;		
				end
				else begin
				  	Erase      <= 1'b1;
					Expose     <= 1'b0;
					Start      <= 1'b0;
					NRE_1      <= 1'b1;
					NRE_2      <= 1'b1;
					ADC        <= 1'b0;
					Ovf4       <= 1'b0;
					nextState  <= Idle;
				end
			end
			Exposure: begin
				if(Ovf5) begin
					Expose    <= 1'b0; 
					nextState <= Readout; 
				end
				else begin
					Start     <= 1'b0;
					Expose    <= 1'b1;
					Erase     <= 1'b0;
					NRE_1     <= 1'b1;
					NRE_2     <= 1'b1;
					nextState <= Exposure;
				end
			end
			Readout: begin
				if(Ovf4) begin		   
					nextState <= Idle; 
				end
				else begin
					NRE_1     <= 1'b0;
					#1;
					ADC       <= 1'b1;
					#1;
					ADC       <= 1'b0;
					#1;
					NRE_1     <= 1'b1;
					#1;
					NRE_2     <= 1'b0;
					#1;
					ADC       <= 1'b1;
					#1;
					ADC       <= 1'b0;
					#1;
					NRE_2     <= 1'b1;
					Ovf4      <= 1'b1;
					nextState <= Readout;
				end
			end
			
			default:	nextState <= Idle;
					  
		endcase		
		/*
		assign NRE_1, NRE_2 = (currentState == Readout);
		assign Expose = (currentState == Exposure);
		assign Erase = (currentState == Idle);
		*/
	end
endmodule