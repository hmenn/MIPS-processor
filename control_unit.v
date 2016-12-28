// output signals
// 0. RegDst
// 1. Branch
// 2. MemRead
// 3. MemtoReg
// 4. MemWrite
// 5. ALUSrc
// 6. RegWrite
module control_unit(ins,out_signals,ALUOp);

  input [5:0] ins;

  parameter num_signals=7;
  output [num_signals-1:0] out_signals;
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

  // initialize output signals
  //assign out_signals = {num_signals-1{1'b0}};

  // RegDst
  assign out_signals[0] = Rtype;

  // Branch
  assign out_signals[1] = beq;

  // MemRead
  assign out_signals[2] = lw;

  // MemtoReg
  assign out_signals[3] = lw;

  // ALUOP
  //TODO: ALU CONTROL HERE
  // MemWrite
  assign out_signals[4]=sw;

  // ALUSrc
  assign out_signals[5]= sw | lw;


  // RegWrite
  or orregw(out_signals[6],Rtype,lw);









endmodule
