module mux_2_1_test();

wire [31:0] out;
reg [31:0] in1,in2;
reg sig;

mux_2_1 mux21(out,in1,in2,sig);


initial begin
  in1={32{1'b1}};
  in2=0;
  sig=1'b0;
#5;
  sig=1;
end

initial begin
  $monitor("Time:%2d in1:%32b, in2:%32b, sig:%1b, out:%32b",$time,in1,in2,sig,out);
end


endmodule
