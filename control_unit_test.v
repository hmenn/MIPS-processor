`include "control_unit.v"

module control_unit_test();

parameter num_signals=7;
wire [2:0] ALUOp;
reg [5:0] ins;
wire [num_signals-1:0] signals;

localparam R_TYPE = 6'b000000;
localparam J_TYPE = 6'b00001x;
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
localparam JR = 6'b000000;
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

control_unit cnt(ins,signals,ALUOp);

initial begin
  ins =R_TYPE; // Rtype
  #20;
  ins =LW; // lw
  #20;
  ins =SW; // sw
  #20;
  ins =BEQ; // beq
  #20;
  ins =NOR; // nor
  #20;
  ins =ANDI; // andi
  #20;
  ins =ORI; // ori
  #20;
  ins =SLTI; // slti
  #20;
  ins =SLTIU; // sltiu
  #20;
  ins =ADDI;
  #20;
  ins =LUI;
  #20;
  ins =J;
  #20;
  ins =JR;
  #20;
end

initial begin
  $monitor("Time=%2d, OPCODE:%6b, ALUOp:%3b RegDst:%1b,Branch:%1b,MemRead:%1b,MemtoReg:%1b,MemWrite:%1b,ALUSrc:%1b,RegWrite:%1b",
        $time,ins,ALUOp,signals[0],signals[1],signals[2],signals[3],signals[4],signals[5],signals[6]);
end


endmodule
