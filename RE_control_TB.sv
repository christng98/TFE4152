`timescale 1ms/1ps

module RE_control_TB();
	logic clk, reset, Init, Exp_increase, Exp_decrease; //inputs
	logic NRE_1, NRE_2, ADC, Expose, Erase; //outputs
	logic Ovf5, Start; //internal
	reg [4:0] EX_time; //internal
	
	FSM_ex_control dut_FSM(
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
	
	Timer_counter dut_Timer(
		.clk(clk),
		.reset(reset),
		.Start(Start),
		.Initial(EX_time),
		.Ovf5(Ovf5)
	);
	
	CTRL_ex_time dut_CTRL(
		.clk(clk),
		.reset(reset),
		.Exp_inc(Exp_increase),
		.Exp_dec(Exp_decrease),
		.Erase(Erase),
		.EX_time(EX_time)
	);
	
	always begin
		clk = ~clk;	#0.5;
	end
	
	initial begin
		#0.5;clk=0;reset=1'b1;Init=1'b0;Exp_increase=1'b0;Exp_decrease=1'b0;#5;
		#0.5;reset=1'b0;Exp_increase=1'b1;#5;Exp_increase=1'b0;Init=1'b1;#1;Init=1'b0;#20;
		Exp_decrease=1'b1;#5;Exp_decrease=1'b0;Init=1'b1;#1;Init=1'b0;#20;
		$finish();
	end

	
endmodule
	