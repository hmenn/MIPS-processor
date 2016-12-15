module alu_32bit_test();

  reg [2:0] op;
  reg [31:0] first, second;
  wire [31:0] result;
  wire zero;

  alu_32bit alu32(zero,result,first,second,op);

  initial begin
    first=32'b01111111111111111111111111111111;
    second=32'b00000000000000000000000000000001;
    op=3'b010;
    #20;
    first=32'b00000000000000000000000000000010;
    second=32'b00000000000000000000000000000001;
    op=3'b110;
    #20;
    first=32'b11111111111111111111111111111111;
    second=32'b11111111111111111111111111111111;
    op=3'b110;
  end

  initial begin
  	$monitor("time=%2d, first=%32b,second=%32b, op=%3b, zero=%1b, result=%32b",$time,first,second,op,zero,result);
	end

endmodule
