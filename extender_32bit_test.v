module extender_32bit_test();

  reg [15:0] in;
  wire [31:0] out;
  reg extOp;

  extender_32bit test(out,in,extOp);

  initial begin
    in=16'b1111111111111111;
    extOp=1'b0;
    #20;
    in=16'b1111111111111111;
    extOp=1'b1;
    #20;
    in=16'b1111111100000000;
    extOp=1'b0;
    #20;
    in=16'b1111111100000000;
    extOp=1'b1;
    #20;
    in=16'b0000000011111111;
    extOp=1'b0;
    #20;
    in=16'b1000000011111111;
    extOp=1'b1;
    #20;
  end

  initial begin
  	$monitor("time=%2d, in=%16b,extOp=%1b,out=%32b",$time,in,extOp,out);
	end


endmodule
