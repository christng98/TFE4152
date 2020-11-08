`timescale 1ns/1ps	

module FSM_ex_control_TB();
	logic clk;
	logic reset;
	logic Init;	
	logic Ovf5;
	logic NRE_1;
	logic NRE_2;
	logic ADC;
	logic Expose;
	logic Erase;
	logic Start;
	logic Ovf4;
	
	FSM_ex_control dut (
		.clk(clk), 
		.reset(reset), 
		.Init(Init),
		.Ovf5(Ovf5),
		.NRE_1(NRE_1),
		.NRE_2(NRE_2),
		.ADC(ADC), 
		.Expose(Expose),
		.Erase(Erase),
		.Start(Start),
		.Ovf4(Ovf4)
	);
	
	always begin
		clk = ~clk; #0.5;
	end
	
	initial begin
		reset=1'b1; clk=0; Init=1'b0; Ovf5=1'b0; #1;
		reset=1'b0; #1.5; Init=1'b1; #1; Init=1'b0; #5; Ovf5=1'b1; #1; Ovf5=1'b0; #50;
		$finish();
	end

endmodule