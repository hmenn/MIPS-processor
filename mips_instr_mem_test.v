module mips_instr_mem_test();

wire [31:0] inst;
reg [31:0] pc;

mips_instr_mem test(inst,pc);

initial begin
pc=32'b00000000000000000000000000000000;
#20;
pc=32'b00000000000000000000000000000100;
#20;
pc=32'b00000000000000000000000000001000;
#20;
pc=32'b00000000000000000000000000001100;
end

initial begin
$monitor("time=%2d,PC=%32b,inst=%32b",$time,pc,inst);
end


endmodule
