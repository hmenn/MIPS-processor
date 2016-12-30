`include "alu_control_unit.v"
module alu_control_unit_test();

  wire [3:0] ALUCtl;
  reg [2:0] ALUOp;
  reg [5:0] func;

  localparam ANDFunc =6'b100100;
  localparam ADDFunc =6'b100000;
  localparam ADDUFunc =6'b100001;
  localparam ORFunc =6'b100101;
  localparam NORFunc =6'b100111;
  localparam SUBFunc =6'b100010;
  localparam SUBUFunc =6'b100011;
  localparam SLTFunc =6'b101010;
  localparam SLTUFunc =6'b101001;
  localparam SLLFunc = 6'b000000;
  localparam SRLFunc = 6'b000010;

  alu_control_unit alucu(ALUCtl,ALUOp,func);


  initial begin
    $display("\nALU CONTROL UNIT TEST RESULTS");
    $display("\nADDI/ADDIU/LBU/LHU/LUI/LW/SW/SB/SH");
    ALUOp=3'b000; // addi, addiu,lbu,lhu,lui,lw,sw,sb,sh
    func =6'b000000;
    #20;
    $display("\nAND - ANDI");
    ALUOp=3'b010; // and
    func =ANDFunc;
    #20;
    ALUOp=3'b100; // andi
    func =6'bxxxxxx;
    #20;
    $display("\nADD - ADDU");
    ALUOp=3'b010; // add
    func =ADDFunc;
    #20;
    ALUOp=3'b010; // addu
    func =ADDUFunc;
    #20;
    $display("\nOR - ORI");
    ALUOp=3'b010; // OR
    func =ORFunc;
    #20;
    ALUOp=3'b101; // ori
    func =6'bxxxxxx;
    #20;
    $display("\nNOR");
    ALUOp=3'b010; // nor
    func =NORFunc;
    #20;
    $display("\nSUB - SUBU - BEQ/BNE");
    ALUOp=3'b010; // sub
    func =SUBFunc;
    #20;
    ALUOp=3'b010; // subu
    func =SUBUFunc;
    #20;
    ALUOp=3'b001; // beq, bne
    func =6'bxxxxxx;
    #20;
    $display("\nSLTI/SLTIU - SLT - SLTU");
    ALUOp=3'b110; // slti, sltiu
    func =6'bxxxxxx;
    #20;
    ALUOp=3'b010; // slt
    func =SLTFunc;
    #20;
    ALUOp=3'b010; // sltu
    func =SLTUFunc;
    #20;
    $display("\nSLL");
    ALUOp=3'b010; // sll
    func =SLLFunc;
    #20;
    $display("\nSRL");
    ALUOp=3'b010; // nor
    func =SRLFunc;
    #20;

  end

  initial begin
    $monitor("Time:%2d AluOP:%3b Func:%6b ALUCtl:%4b",$time,ALUOp,func,ALUCtl);
  end

endmodule
