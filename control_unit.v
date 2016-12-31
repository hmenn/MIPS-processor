// output signals
// 0. RegDst
// 1. BranchEqual
// 2. MemRead
// 3. MemtoReg
// 4. MemWrite
// 5. ALUSrc
// 6. RegWrite
// 7. ExtendType
// 8. BranchNotEqual

//iverilog mips_core.v mips_testbench.v program_counter.v mips_instr_mem.v control_unit.v mips_registers.v extender_32bit.v mux_2_1.v alu_32bit.v alu_1bit.v msb_1bit.v mux_4_1.v

module control_unit(ins,out_signals,ALUOp);

  input [5:0] ins;

  parameter num_signals=9;
  output [0:num_signals-1] out_signals;
  output [2:0] ALUOp;

  localparam R_TYPE = 6'b000000;
  //localparam J_TYPE = 6'b00001x;
  localparam ADD = 6'b100000;
  localparam ADDI = 6'b001000;
  localparam ADDIU = 6'b001001;
  localparam ADDU = 6'b100001;
  localparam AND = 6'b100100;
  localparam ANDI = 6'b001100;
  localparam BEQ = 6'b000100;
  localparam BNE = 6'b000101;
  localparam J = 6'b000010;
  localparam JAL = 6'b000011;
  localparam JR = 6'b001000;
  localparam LBU = 6'b100100;
  localparam LHU = 6'b100101;
  localparam LUI = 6'b001111;
  localparam LW = 6'b100011;
  localparam NOR = 6'b100111;
  localparam OR = 6'b100101;
  localparam ORI = 6'b001101;
  localparam SLT = 6'b101010;
  localparam SLTI = 6'b001010;
  localparam SLTIU = 6'b001011;
  localparam SLTU = 6'b101011;
  localparam SLL = 6'b000000;
  localparam SRL = 6'b000010;
  localparam SB = 6'b101000;
  localparam SH = 6'b101001;
  localparam SW = 6'b101011;
  localparam SUB = 6'b100010;
  localparam SUBU = 6'b100011;

  //assign out_signals = {num_signals-1{1'b0}};

  // RegDst
  assign out_signals[0] = (ins== R_TYPE)? 1'b1: 1'b0;

  // BranchEqual
  assign out_signals[1] = (ins== BEQ)? 1'b1: 1'b0;

  // MemRead
  assign out_signals[2] = (ins== LW)? 1'b1: 1'b0;

  // MemtoReg
  assign out_signals[3] = (ins== LW)? 1'b1: 1'b0;

  // MemWrite
  assign out_signals[4]= (ins== SW)? 1'b1: 1'b0;

  // ALUSrc
  assign out_signals[5]= ((ins== SW)||(ins==LW))? 1'b1: 1'b0;

  // RegWrite
  // completed!
  assign out_signals[6] = (
                  (ins == R_TYPE)||
                  (ins == ADDI)||
                  (ins == ADDIU)||
                  (ins == ANDI)||
                  (ins == JAL)||
                  (ins == LBU)||
                  (ins == LHU)||
                  (ins == LUI)||
                  (ins == LW)||
                  (ins == ORI)||
                  (ins == SLTI)||
                  (ins == SLTIU)
                  )? 1'b1: 1'b0;

  // ExtendType , sigextedn or unsigned exted
  assign out_signals[7]= ((ins==ADDIU)||(ins==LBU)||(ins==LHU)||(ins==SLTIU))
                        ? 1'b0: 1'b1;


  // Branch Not Eqaul
  assign out_signals[8] = (ins == BNE)? 1'b1 : 1'b0;

  // ALUOP
  assign ALUOp = (ins == R_TYPE) ? 3'b010 :
                ((ins == BEQ)? 3'b001:
                (((ins == LW)||(ins==SW)||(ins==ADDI)
                  ||(ins==ADDIU)||(ins==LBU)||(ins==LHU)
                  ||(ins==LUI)||(ins==SB)||(ins==SH))? 3'b000:
                ((ins==ANDI)? 3'b100:
                ((ins==ORI)? 3'b101:
                ((((ins==SLTI)||(ins==SLTIU))?3'b110: 3'b000))))));



endmodule
