//`include "mips_core.v"
module mips_testbench ();
reg clock;
reg reset;
/*
TEST ICIN KULLANDIGIM INS.
add
and
or
sub..
set less than cevabı 1
set less than cevabı 0
beq
bnq
jump
(bunların hepsi bir sonraki ins. atlıyor)
loadword
store word
addImm
AndImm
orImm
setLess than Imm
Add Imm Unsigned
setless than Imm Unsigned cevap 1
set less than Imm Unsigned cavap 0
sonuncusu da nor
*/
mips_core core_tb(clock,reset);

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
  #200 $finish;
end

always begin
  #5;
  clock=~clock;
  //$display("\nTime:%2d, clock:%1b pc:%32b,pc_next:%32b,ins:%32b",$time,clock,pc,pc_next,instruction);

end


endmodule
