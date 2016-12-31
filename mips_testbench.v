//`include "mips_core.v"
module mips_testbench ();
reg clock;
reg reset;

mips_core core_tb(clock,reset);
/*
initial begin
		reset = 1;
		#5 reset = 0;
    $display("Time:%2d,PC reseted instruction:%32b",$time,instruction);
	end

	// Clock signal
	initial begin
		clock = 1;
		forever #5 clock = ~clock;
    $display("\nTime:%2d, clock:%1b pc_in:%32b,ins:%32b",$time,clock,pc_in,instruction);
	end

	// Run for 11 cycles
	initial begin
		#40 $finish;
	end
*/
initial begin
  reset=1;
  clock=1;
  #5
  reset=0;
  $display("\n#######Time:%2d, PC reseted #######",$time);
  /*$monitor("MipsCoreTest Time:%2d, clk:%1b, rst:%1b, pc_curr:%32b, pc_new:%32b, ins:%32b\n",
            $time,clock,reset,pc_in,pc_next,instruction);*/
  #25 $finish;
end

always begin
  #5;
  clock=~clock;
  //$display("\nTime:%2d, clock:%1b pc:%32b,pc_next:%32b,ins:%32b",$time,clock,pc,pc_next,instruction);

end


endmodule
