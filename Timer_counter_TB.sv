`timescale 1ms/1ps		 

module Timer_counter_TB();
	logic clk;
	logic reset;
	logic Start;
	reg [4:0] Initial;
	logic Ovf5;
	
	Timer_counter dut(
		.clk(clk),
		.reset(reset),
		.Start(Start),
		.Initial(Initial),
		.Ovf5(Ovf5)
	);	
	
	always begin
		clk = ~clk; #0.5;
	end
	
	initial begin
		reset=1'b1; clk=0; Initial=5'b01111; #1; Start=1'b1; #1; Start=1'b0;  /*15 units delay*/; #30;
		$finish();
	end
	
endmodule