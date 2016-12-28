module program_counter_test();

  reg reset;
  reg [31:0] pc_in;
  wire [31:0] pc_out;

  program_counter pcTest(pc_out,reset,pc_in);

  initial begin
    reset=0;
    pc_in=32'b11111111111111111111111111111111;
    $monitor("Time:%2d, Reset:%1b, pc_in:%32b, pc_out:%32b",$time,reset,pc_in,pc_out);
    #20 $finish;
  end

  always begin
    #5
    reset=~reset;

  end

endmodule
