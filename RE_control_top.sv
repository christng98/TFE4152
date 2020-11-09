`timescale 1ms/1ps

module RE_control_top(
	input wire clk, reset, Init, Exp_inc, Exp_dec,
	output reg NRE_1, NRE_2, ADC, Expose, Erase);

	reg [4:0] EX_time;
	wire Start;
	wire Ovf5;
	
	CTRL_ex_time a(clk, reset, Erase, Exp_inc, Exp_dec, EX_time);	
	
	Timer_counter b(clk, reset, Start, EX_time, Ovf5);	  
	
	FSM_ex_control c(clk, reset, Init, Ovf5, NRE_1, NRE_2, ADC, Expose, Erase, Start, Ovf4);	  
endmodule