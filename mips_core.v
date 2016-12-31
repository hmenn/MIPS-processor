`include "mux_2_1.v"
`include "extender_32bit.v"
`include "mips_registers.v"
`include "alu_32bit.v"
`include "control_unit.v"
`include "mips_instr_mem.v"
`include "program_counter.v"
`include "alu_control_unit.v"
`include "mips_data_mem.v"

module mips_core(clock,reset);
input clock;
input reset; // ilk instruction icin pc resetlenmeli

wire [31:0] pc;
wire [31:0] pc_new;

// instrucion unit members
wire [31:0] instruction;

wire [5:0] opcode,funcode;
wire [4:0] rs,rt,rd,shmt;
wire [15:0] immediate;

// control unit members
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
localparam  SIGNAL_NUM = 9;
wire [0:SIGNAL_NUM-1] signals;
wire [2:0] ALUOp;

// register unit members
wire [31:0] read_data_1;
wire [31:0] read_data_2;
wire [31:0] write_data;
wire [4:0] write_reg;

// ilk basta reset gelecegi icin pc=0 olur
// PC_IN = PC_NEW yapar
// PC_NEW +4 lenmis deger gibi dusun
program_counter pcu(pc,clock,reset,pc_new);


// INSTRUCION MEMORY - ANALYZE
mips_instr_mem mim(instruction,pc);

assign opcode = instruction[31:26];
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign rd = instruction[15:11];
assign shmt = instruction[10:6];
assign funcode = instruction[5:0];
assign immediate = instruction[15:0];

// CONTROL UNIT
control_unit conU(opcode,signals,ALUOp);

// REGISTER UNIT

wire [31:0] write_data_reg;
assign write_reg = signals[0] ? rd : rt;
mips_registers regU(read_data_1,read_data_2,write_data_reg,rs,rt,write_reg,signals[6],clock);

// EXTENDER
wire [31:0]immEx;
extender_32bit extender(immEx,immediate,signals[7]);

// ALU Control
wire [3:0]ALUCtl;
alu_control_unit alucu(ALUCtl,ALUOp,funcode);

// ALU
// alu 2.source girisi
wire [31:0]aluIn2;
wire [31:0]aluRes;
wire zero;

mux_2_1 aluMux(aluIn2,immEx,read_data_2,signals[5]);
alu_32bit ALU32(zero,aluRes,read_data_1,aluIn2,ALUCtl,shmt);

// Data Memory
wire [31:0] read_data_mem;
mips_data_mem dmU(read_data_mem,aluRes,read_data_2,signals[2],signals[4],clock);


// memToReg sinyali varsa memden yoksa aludan al yaz
assign write_data_reg = signals[3] ? read_data_mem : aluRes;

// Brach Jum operations
wire branchChoice;

// beq ve zero=1 ise yada bne ve zero=0 ise brach et
assign branchChoice = ((signals[1]==1'b1)&&(zero==1'b1))||((signals[8]==1'b1)&&(zero==1'b0))
                   ? 1'b1 : 1'b0;

wire [31:0]pc4;
assign pc4=pc+4;
wire [31:0] brachMuxRes;
assign brachMuxRes = branchChoice? (pc4+(immEx<<2)):pc4;


always @ ( clock ) begin
  $display("\nTime:%2d, CLK:%1b, RST:%1b, PC:%32b\n\t|-->Instruction:%32b\n\t|-->op:%6b, rs:%5b, rt:%5b, rd:%5b, shmt:%5b, funcode:%6b, imm:%15b",
    $time,clock,reset,pc,instruction,opcode,rs,rt,rd,shmt,funcode,immediate);
  $display(" |-->Control U. SIGNALS FOR INS:%8b ALUOp:%3b\t",signals,ALUOp);
  $display(" |-->Reg U. read_data_1:%32b\n\t|-->read_data_2:%32b\n\t|-->write_data :%32b write_reg:%5b, sig_write_reg:%1b",
        read_data_1,read_data_2,write_data_reg,write_reg,signals[6]);
  $display(" |-->ALUMUX. ALUSrc:%1b\n\t|-->In1(EXT)  :%32b\n\t|-->In2(read2):%32b\n\t|-->out       :%32b",
                  signals[5],immEx,read_data_2,aluIn2);
  $display(" |-->ALU. Op:%3b\n\t|-->In1:%32b\n\t|-->In2:%32b\n\t|-->Res:%32b Zero:%1b",
            ALUOp,read_data_1,aluIn2,aluRes,zero);
  $display(" |-->Data Mem memRead:%1b memWrite:%1b\n\t|-->Address:%32b\n\t|-->ReadData:%32b\n\t|-->WriteData:%32b"
          ,signals[2],signals[4],aluRes,read_data_mem,read_data_2);
  $display(" |-->MemToRegmux in1:%32b\n\t|-->in0:%32b\n\t|-->out:%32b MemToRegSignal:%1b"
          ,read_data_mem,aluRes,write_data_reg,signals[3]);
  $display(" |-->Branch beq:%1b bne:%1b zero:%1b  branchChoice:%1b\n\t|-->In0:%32b\n\t|-->In1:%32b\n\t|-->res:%32b",
          signals[1],signals[8],zero,branchChoice,pc4,(pc4+(immEx<<2)),brachMuxRes);
end


assign pc_new = pc+4;


endmodule
