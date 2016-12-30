`include "mux_4_1.v"
`include "msb_1bit.v"
`include "alu_1bit.v"

module alu_32bit(output zero,output [31:0]result,input[31:0]first,input[31:0]second,input[2:0]op);
  /*input [31:0] first,second;
  input [2:0] op; // alu control operation
  output [31:0] result;
  output zero; // is zero*/

  wire c[32:1]; // carry bits

  wire v; // v for overflow

  wire set;

  alu_1bit alu0(result[0],c[1],first[0],second[0],op,op[2],set);
  alu_1bit alu1(result[1],c[2],first[1],second[1],op,c[1],1'b0);
  alu_1bit alu2(result[2],c[3],first[2],second[2],op,c[2],1'b0);
  alu_1bit alu3(result[3],c[4],first[3],second[3],op,c[3],1'b0);
  alu_1bit alu4(result[4],c[5],first[4],second[4],op,c[4],1'b0);
  alu_1bit alu5(result[5],c[6],first[5],second[5],op,c[5],1'b0);
  alu_1bit alu6(result[6],c[7],first[6],second[6],op,c[6],1'b0);
  alu_1bit alu7(result[7],c[8],first[7],second[7],op,c[7],1'b0);
  alu_1bit alu8(result[8],c[9],first[8],second[8],op,c[8],1'b0);
  alu_1bit alu9(result[9],c[10],first[9],second[9],op,c[9],1'b0);
  alu_1bit alu10(result[10],c[11],first[10],second[10],op,c[10],1'b0);
  alu_1bit alu11(result[11],c[12],first[11],second[11],op,c[11],1'b0);
  alu_1bit alu12(result[12],c[13],first[12],second[12],op,c[12],1'b0);
  alu_1bit alu13(result[13],c[14],first[13],second[13],op,c[13],1'b0);
  alu_1bit alu14(result[14],c[15],first[14],second[14],op,c[14],1'b0);
  alu_1bit alu15(result[15],c[16],first[15],second[15],op,c[15],1'b0);
  alu_1bit alu16(result[16],c[17],first[16],second[16],op,c[16],1'b0);
  alu_1bit alu17(result[17],c[18],first[17],second[17],op,c[17],1'b0);
  alu_1bit alu18(result[18],c[19],first[18],second[18],op,c[18],1'b0);
  alu_1bit alu19(result[19],c[20],first[19],second[19],op,c[19],1'b0);
  alu_1bit alu20(result[20],c[21],first[20],second[20],op,c[20],1'b0);
  alu_1bit alu21(result[21],c[22],first[21],second[21],op,c[21],1'b0);
  alu_1bit alu22(result[22],c[23],first[22],second[22],op,c[22],1'b0);
  alu_1bit alu23(result[23],c[24],first[23],second[23],op,c[23],1'b0);
  alu_1bit alu24(result[24],c[25],first[24],second[24],op,c[24],1'b0);
  alu_1bit alu25(result[25],c[26],first[25],second[25],op,c[25],1'b0);
  alu_1bit alu26(result[26],c[27],first[26],second[26],op,c[26],1'b0);
  alu_1bit alu27(result[27],c[28],first[27],second[27],op,c[27],1'b0);
  alu_1bit alu28(result[28],c[29],first[28],second[28],op,c[28],1'b0);
  alu_1bit alu29(result[29],c[30],first[29],second[29],op,c[29],1'b0);
  alu_1bit alu30(result[30],c[31],first[30],second[30],op,c[30],1'b0);
  msb_1bit msb1(result[31],c[32],first[31],second[31],op,c[31],1'b0,v,set);

  nor nor1(zero,result);


endmodule
