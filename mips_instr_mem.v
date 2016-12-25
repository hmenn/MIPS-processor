module mips_instr_mem(instruction, program_counter);
input [31:0] program_counter;
output [31:0] instruction;

reg [31:0] instr_mem [255:0];

initial begin
	$readmemb("instruction.mem", instr_mem);
end

// siradaki instructionu getir
// ilk 2 bit her zaman 0dır, word addressing
assign instruction = instr_mem[program_counter[31:2]];

endmodule
