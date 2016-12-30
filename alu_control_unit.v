module alu_control_unit(ALUCtl,ALUOp,func);

  input [5:0]func;
  input [2:0]ALUOp;
  output [3:0] ALUCtl;

  wire andOP;
  wire orOp;
  wire addOp;
  wire subOp;
  wire sltOp;
  wire norOp;

  localparam ANDFunc =6'b100100;
  localparam ANDIFunc =6'b001100;


assign andOp = ((ALUOp==3'b010)&&(func==ANDFunc)) || (ALUOp==3'b100) ? 1'b1 : 1'b0;

assign ALUCtl = andOp ? 4'b0000 : 4'b1111;
endmodule
