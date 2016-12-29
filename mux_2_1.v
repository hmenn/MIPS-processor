module mux_2_1(output [31:0] out,input [31:0] in1, input [31:0] in2,input sig);

assign out=sig?in1:in2;

endmodule
