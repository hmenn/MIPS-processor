`include "mux_2_1.v"
`include "extender_32bit.v"
`include "mips_registers.v"
`include "alu_32bit.v"
`include "control_unit.v"
`include "mips_instr_mem.v"
`include "program_counter.v"

module mips_core(clock,reset);
input clock;
input reset; // ilk instruction icin pc resetlenmeli


output wire [31:0] pc;
output wire [31:0] pc_new;

// instrucion unit members
output wire [31:0] instruction;

wire [5:0] opcode,funcode;
wire [4:0] rs,rt,rd,shmt;
wire [15:0] immediate;

// control unit members
// output signals
// 0. RegDst
// 1. Branch
// 2. MemRead
// 3. MemtoReg
// 4. MemWrite
// 5. ALUSrc
// 6. RegWrite
wire [6:0] signals;
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

// TODO : WRITE DATA, wrıte reg DUZENLENECEK
mips_registers regU(read_data_1,read_data_2,32'b11111111111111111111111111111111,rs,rt,5'b00000,signals[6],clock);

// EXTENDER
wire [31:0]immEx;
// TODO: simdilik sign extend var, diger inst icin 1 olarak yer control biti olacak
extender_32bit extender(immEx,immediate,1'b0);

// ALU
// alu 2.source girisi
wire [31:0]aluIn2;
wire [31:0]aluRes;
wire zero;

mux_2_1 mux2_0(aluIn2,immEx,read_data_2,signals[5]);

//TODO: ALU OP 000 veriildi, control sinyaline gore degismeli
assign ALUOp=3'b010;
alu_32bit ALU32(zero,aluRes,read_data_1,aluIn2,ALUOp);
always @ ( clock ) begin
  $display("\nTime:%2d, CLK:%1b, RST:%1b, PC:%32b\n\t|-->Instruction:%32b\n\t|-->op:%6b, rs:%5b, rt:%5b, rd:%5b, shmt:%5b, funcode:%6b, imm:%15b",
    $time,clock,reset,pc,instruction,opcode,rs,rt,rd,shmt,funcode,immediate);
  $display(" |-->Control U. SIGNALS FOR INS:%6b ALUOp:%3b",opcode,signals,ALUOp);
  $display(" |-->Reg U. read_data_1:%32b\n\t|-->read_data_2:%32b\n\t|-->write_data :%32b write_reg:%5b, sig_write:%1b",
        read_data_1,read_data_2,32'b11111111111111111111111111111111,5'b00000,signals[6]);
  $display(" |-->ALUMUX. ALUSrc:%1b\n\t|-->In1(EXT)  :%32b\n\t|-->In2(read2):%32b\n\t|-->out       :%32b",
                  signals[5],immEx,read_data_2,aluIn2);
  $display(" |-->ALU. Op:%3b\n\t|-->In1:%32b\n\t|-->In2:%32b\n\t|-->Res:%32b Zero:%1b",
            ALUOp,read_data_1,aluIn2,aluRes,zero);
end


//assign pc_in ={32{1'b1}};
assign pc_new = pc+4;


endmodule
