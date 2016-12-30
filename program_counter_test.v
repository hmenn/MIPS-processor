module program_counter_test();

  reg clock;
  reg reset;
  reg [31:0] pc_in;
  wire [31:0] pc_out;

  program_counter pcTest(pc_out,clock,reset,pc_in);

  initial begin
    clock=0;
    reset=1;
    #2
    reset=0;
    pc_in=32'b11111111111111111111111111111111;
    #20 $finish;
  end

  always begin
    $monitor("PCTime:%2d, Clk:%1b Rst:%1b, pc_in:%32b, pc_out:%32b",$time,clock,reset,pc_in,pc_out);
    #5 clock=~clock;
    pc_in<=pc_in-1;
  end

endmodule
