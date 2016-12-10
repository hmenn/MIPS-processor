module alu_4bit_test();

	reg number1,number2;
	wire cout;
  wire result;
  reg cin;
  reg [2:0]op;

	alu_1bit alu1(result,cout,number1,number2,op[2:0],cin,lessi);

	initial begin
	number1= 1'b0; number2=1'b0; cin=1'b0; op=3'b000;
	#20;
	number1= 1'b0; number2=1'b0; cin=1'b1; op=3'b000;
	#20;
	number1= 1'b0; number2=1'b0; cin=1'b1; op=3'b000;
	#20;
	number1= 1'b1; number2=1'b0; cin=1'b0; op=3'b001;
	#20;
	number1= 1'b1; number2=1'b0; cin=1'b0; op=3'b000;
	#20;
	number1= 1'b1; number2=1'b1; cin=1'b0; op=3'b000;
	#20;
	number1= 1'b1; number2=1'b1; cin=1'b1; op=3'b000;
	end

	initial begin
	$monitor("time=%2d,number1=%1b,number2=%1b,cin=%1b,op=%3b,res=%1b,cout=%1b",
        $time,number1,number2,cin,op,result,cout);
	end

endmodule
