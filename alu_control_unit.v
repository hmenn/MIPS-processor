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
  localparam ADDFunc =6'b100000;
  localparam ADDUFunc =6'b100001;
  localparam ORFunc =6'b100101;
  localparam NORFunc =6'b100111;
  localparam SUBFunc =6'b100010;
  localparam SUBUFunc =6'b100011;
  localparam SLTFunc =6'b101010;
  localparam SLTUFunc =6'b101001;

  assign andOp = ((ALUOp==3'b010)&&(func==ANDFunc)) || (ALUOp==3'b100) ? 1'b1 : 1'b0;

  assign addOp = ((ALUOp==3'b010)&&((func==ADDFunc)||(func==ADDUFunc))) ||// Rtype ve add addu ise
                  (ALUOp==3'b000) // lbu,lhu,lui,lw,sb,sh,sw,addi,addiu ise
                  ? 1'b1 : 1'b0;

  assign orOp = ((ALUOp==3'b010)&&(func==ORFunc)) || (ALUOp==3'b101) ? 1'b1 : 1'b0;

  assign norOp = (ALUOp == 3'b010)&&(func==NORFunc) ? 1'b1 : 1'b0;

  assign subOp = ((ALUOp==3'b010)&&((func==SUBFunc)||(func==SUBUFunc))) ||// Rtype ve sub subu
                  (ALUOp==3'b001) // beq ve bne
                  ? 1'b1 : 1'b0;

  assign sltOp = ((ALUOp==3'b010)&&((func==SLTFunc)||(func==SLTUFunc))) ||// Rtype ve slt sltu
                  (ALUOp==3'b110) // slti, sltiu
                  ? 1'b1 : 1'b0;

  assign ALUCtl = andOp ? 4'b0000 :
                  (addOp ? 4'b0010 :
                  (orOp ? 4'b0001 :
                  (norOp ? 4'b1100 :
                  (subOp ? 4'b0110 :
                  (sltOp ? 4'b0111 : 4'b1111)))));
endmodule
