module mips_core(clock,reset,pc_curr,pc_new,instruction);
input clock;
input reset; // ilk instruction icin pc resetlenmeli


output wire [31:0] pc_curr;
output wire [31:0] pc_new;

output wire [31:0] instruction;

// PC_IN = PC_OUT yapar
// PC_OUT +4 lenmis deger gibi dusun
program_counter pcu(pc_curr,clock,reset,pc_new);
mips_instr_mem mim(instruction,pc_curr);

/*always @ ( * ) begin
  $display("Time:%2d, clock:%1b, reset:%1b, pc_in:%32b, pc_out:%32b",
        $time,clock,reset,pc_in,pc_out);
end*/

//assign pc_in ={32{1'b1}};
assign pc_new = pc_curr+4;

endmodule
