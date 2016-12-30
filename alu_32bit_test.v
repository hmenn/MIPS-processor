`include "alu_32bit.v"
module alu_32bit_test();

  reg [3:0] op;
  reg [31:0] first, second;
  reg [4:0] shamt;
  wire [31:0] result;
  wire zero;

  alu_32bit alu32(zero,result,first,second,op,shamt);

  initial begin
    $display("\nAND TESTS");
    first=32'd97;
    second=32'd97;
    op=4'b0000; // and
    shamt=5'bxxxxx;
    #10;
    first=32'd35;
    second=32'd16;
    op=4'b0000; // and
    #10;
    $display("\nOR TESTS");
    first=32'd42;
    second=32'd33;
    op=4'b0001; // or
    #10;
    first=32'd888;
    second=32'd888;
    op=4'b0001; // or
    #10;
    $display("\nADD TESTS");
    first=32'd5;
    second=32'd17;
    op=4'b0010; // add
    #10;
    first=32'd48;
    second=32'd987;
    op=4'b0010; // add
    #10;
    $display("\nSUB TESTS");
    first=32'd33;
    second=32'd12;
    op=4'b0110; // sub
    #10;
    first=32'd95;
    second=32'd450;
    op=4'b0110; // sub
    #10;
    $display("\nSLT TESTS");
    first=32'd15;
    second=32'd16;
    op=4'b0111; // slt
    #10;
    first=32'd95;
    second=32'd65;
    op=4'b0111; // slt
    #10;
    $display("\nNOR TESTS");
    first=32'd85;
    second=32'd67;
    op=4'b1100; // nor
    #10;
    first=32'd657;
    second=32'd657;
    op=4'b1100; // nor
    #10;
    $display("\nSLL TESTS");
    first=32'd85;
    second=32'dx;
    shamt=32'd3;
    op=4'b1101; // sll
    #10;
    first=32'd657;
    second=32'd657;
    shamt=32'd8;
    op=4'b1101; // sll
    #10;
    $display("\nSRL TESTS");
    first=32'd85;
    second=32'dx;
    shamt=32'd3;
    op=4'b1110; // sll
    #10;
    first=32'd657;
    second=32'd657;
    shamt=32'd8;
    op=4'b1110; // sll
    #10;
  end

  initial begin
  	$monitor("Time:%2d, op:%4b, shamt:%5b\n\t|-->first :%32b\n\t|-->second:%32b\n\t|-->result:%32b isZero:%1b" ,
                  $time,op,shamt,first,second,result,zero);
	end

endmodule
