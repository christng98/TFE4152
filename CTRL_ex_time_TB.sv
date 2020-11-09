`timescale 1ms/1ps

module CTRL_ex_time_TB();
	logic clk;
	logic reset;
	logic Exp_inc;
	logic Exp_dec;
	logic Erase;
	reg [4:0] EX_time;
	
	CTRL_ex_time dut(
		.clk(clk),
		.reset(reset),
		.Exp_inc(Exp_inc),
		.Exp_dec(Exp_dec),
		.Erase(Erase),
		.EX_time(EX_time)
	);
	
	always begin
		clk = ~clk; #0.5;
	end
	
	initial begin
		clk=0; reset=1'b1; Erase=1'b1; #1; reset=1'b0; #1;
		Exp_inc=1'b1; Exp_dec=1'b0; #30.5; Exp_inc=1'b0; #5;
		Exp_dec=1'b1; #25; Erase=1'b0; #2 Erase=1'b1; #5;
		
		
		
		$finish();
	end
endmodule	