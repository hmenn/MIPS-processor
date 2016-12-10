module alu_4bit_test();

	reg b,a;
	wire cout;
  wire result;
  reg cin;
	reg lessi;
  reg [2:0]op;

	alu_1bit alu1(result,cout,a,b,op,cin,lessi);

	initial begin
	a= 1'b1; b=1'b1; cin=1'b0; op=3'b000; //add test
	#20;
	a= 1'b0; b=1'b0; cin=1'b1; op=3'b010;
	#20;
	a= 1'b1; b=1'b0; cin=1'b0; op=3'b010;
	#20;
	a= 1'b1; b=1'b1; cin=1'b0; op=3'b010;
	#20;
	a= 1'b1; b=1'b1; cin=1'b1; op=3'b010;
	end

	initial begin
	$monitor("time=%2d,a=%1b,b=%1b,cin=%1b,op=%3b,res=%1b,cout=%1b",
        $time,a,b,cin,op,result,cout);
	end

endmodule
