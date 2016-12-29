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
  output [2:0] ALUOp;

  localparam R_TYPE = 6'b000000;
  localparam ADDI = 6'b001000;
  localparam ADDIU = 6'b001001;
  localparam ADDU = 6'b100001;
  localparam ANDI = 6'b001100;
  localparam BEQ = 6'b000100;
  localparam BNE = 6'b000101;
  localparam J = 6'b000010;
  localparam JAL = 6'b000011;
  localparam LBU = 6'b100100;
  localparam LHU = 6'b100101;
  localparam LUI = 6'b001111;
  localparam LW = 6'b100011;
  localparam ORI = 6'b001101;
  localparam SLTI = 6'b001010;
  localparam SLTIU = 6'b001011;
  localparam SB = 6'b101000;
  localparam SH = 6'b101001;
  localparam SW = 6'b101011;

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
  assign out_signals[0] = (ins== R_TYPE)? 1'b1: 1'b0;

  // Branch
  assign out_signals[1] = (ins== BEQ)? 1'b1: 1'b0;

  // MemRead
  assign out_signals[2] = (ins== LW)? 1'b1: 1'b0;

  // MemtoReg
  assign out_signals[3] = (ins== LW)? 1'b1: 1'b0;

  // ALUOP
  //TODO: ALU CONTROL HERE
  // MemWrite
  assign out_signals[4]= (ins== SW)? 1'b1: 1'b0;

  // ALUSrc
  assign out_signals[5]= ((ins== SW)||(ins==LW))? 1'b1: 1'b0;

  // RegWrite
  assign out_signals[6] = ((ins== R_TYPE)||(ins==LW))? 1'b1: 1'b0;









endmodule
