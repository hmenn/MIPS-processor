module extender_32bit(output [31:0] out,input [15:0] in, input extOp );

  // expOp = 1 ise signed olarak extend et
  // 0 ise unsigned extend eder

  assign out = extOp ?
            {{16{in[15]}} ,in[15:0]} : // isaret bitine gore extend et
            {16'b0000000000000000,in[15:0]}; // basina 0 koyarak birlestir


endmodule
