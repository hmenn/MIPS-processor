module mips_testbench ();
reg clock;
reg reset;

wire [31:0] pc_in,pc_out,instruction;

mips_core core_tb(clock,reset,pc_in,pc_out,instruction);

initial begin
  clock=0;
  reset=1;
  $monitor("MipsCoreTest Time:%2d, clk:%1b, rst:%1b, pc_curr:%32b, pc_new:%32b, int:%32b",
            $time,clock,reset,pc_in,pc_out,instruction);
  #5 reset=0;
  #20 $finish;
end

always begin
  #10;
  clock=~clock;
end
endmodule
