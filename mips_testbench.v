module mips_testbench ();
reg clock;
reg reset;

mips_core core_tb(clock,reset);

initial begin
  clock=0;
  reset=1;

  #5 reset=0;
  //$monitor("Time:%2d, clock:%1b, reset:%1b",$time,clock,reset);
  #20 $finish;
end

always begin
  #10;
  clock=~clock;
end
endmodule
