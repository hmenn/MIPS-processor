module mips_core(clock,reset,pc,pc_new,instruction);
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

always @ ( clock ) begin
  $display("Inst Mem. Time:%2d, clk:%1b, rst:%1b, op:%6b, rs:%5b, rt:%5b, rd:%5b, shmt:%5b, funcode:%6b, imm:%15b",
        $time,clock,reset,opcode,rs,rt,rd,shmt,funcode,immediate);
end

// CONTROL UNIT

control_unit conU(opcode,signals,ALUOp);
always @ ( clock ) begin
  $display("Control U. Time:%2d clk:%1b, opcode:%6b signals:%6b ALUOp:%3b",
        $time,clock,opcode,signals,ALUOp);
end


// REGISTER UNIT

// TODO : WRITE DATA, wrıte reg DUZENLENECEK

mips_registers regU(read_data_1,read_data_2,32'b11111111111111111111111111111111,rs,rt,5'b00000,signals[6],clock);
always @ ( clock ) begin
  $display("++Reg U. Time:%2d, clk:%1b read_data_1:%32b, read_data_2:%32b\n\twrite_data:%32b, rs:%5b, rt:%5b, write_reg:%5b, sig_write:%1b",
        $time,clock,read_data_1,read_data_2,32'b11111111111111111111111111111111,rs,rt,5'b00000,signals[6]);
end

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
always @ ( clock ) begin
  $display("ALUMUX. Time:%2d ALUSrc:%1b , In1(EXT):%32b In2(read2):%32b out:%32b",
            $time,signals[5],immEx,read_data_2,aluIn2);
end

//TODO: ALU OP 000 veriildi, control sinyaline gore degismeli
assign ALUOp=3'b010;
alu_32bit ALU32(zero,aluRes,read_data_1,aluIn2,ALUOp);
always @ ( clock ) begin
  $display("ALU. Time:%2d Op:%3b, In1:%32b, In2:%32b, Zero:%1b , Res:%32b",
            $time,ALUOp,read_data_1,aluIn2,zero,aluRes);
end


//assign pc_in ={32{1'b1}};
assign pc_new = pc+4;

endmodule
