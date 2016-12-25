module mips_instr_mem_test();

wire [31:0] inst;
reg [7:0] pc;

mips_instr_mem test(inst,pc);

initial begin
pc=8'b00000000;
#20;
pc=8'b00000001;
#20;
pc=8'b00000010;
#20;
pc=8'b00000011;
end

initial begin
$monitor("time=%2d,PC=%8b,inst=%32b",$time,pc,inst);
end


endmodule