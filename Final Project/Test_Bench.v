module Test_Bench;
reg CLK;
wire [31:0] result;
processor uut(.clock(CLK), .Result(result));
initial
begin
	CLK = 1;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
	#5 CLK = ~ CLK;
end
endmodule