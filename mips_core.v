module mips_core(clock,reset);
input clock;
input reset; // ilk instruction icin pc resetlenmeli



wire [31:0] pc_in;
wire [31:0] pc_out;

program_counter pcu(pc_out,reset,pc_in);

always @ ( * ) begin
  $display("Time:%2d, clock:%1b, reset:%1b, pc_in:%32b, pc_out:%32b",
        $time,clock,reset,pc_in,pc_out);
end


//assign pc_in ={32{1'b1}};

endmodule
