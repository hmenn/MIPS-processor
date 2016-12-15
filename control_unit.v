module control_unit(ins,RegDst, Branch, MemRead,MemtoReg, ALUOp, MemWrite,ALUSrc,RegWrite);
  input [5:0] ins;
  output RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
  output [1:0] ALUOp;

  wire Rtype;
  wire lw;
  wire sw;
  wire beq;

  // Rtype op=000000
  and andRtype(Rtype,~ins[5],~ins[4],~ins[3],~ins[2],~ins[1],~ins[0]);
  // lw op=100011
  and andlw(lw,ins[5],~ins[4],~ins[3],~ins[2],ins[1],ins[0]);
  // sw op=101011
  and andsw(sw,ins[5],~ins[4],ins[3],~ins[2],ins[1],ins[0]);
  // beq op=000100
  and andbeq(beq,~ins[5],~ins[4],~ins[3],ins[2],~ins[1],~ins[0]);

  // RegDst
  assign RegDst = Rtype;

  // Branch

  // MemRead

  // MemtoReg

  // ALUOP

  // MemWrite

  // ALUSrc

  // RegWrite
  or orregw(RegWrite,Rtype,lw);









endmodule
