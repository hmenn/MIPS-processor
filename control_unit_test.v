module control_unit_test();

parameter num_signals=7;
wire [2:0] ALUOp;
reg [5:0] ins;
wire [num_signals-1:0] signals;


control_unit cnt(ins,signals,ALUOp);

initial begin
  ins =6'b000000; // Rtype
  #20;
  ins =6'b100011; // lw
  #20;
  ins =6'b101011; // sw
  #20;
  ins =6'b000100; // beg
  #20;
end

initial begin
  $monitor("time=%2d, ins:%6b, RegDst:%1b,Branch:%1b,MemRead:%1b,MemtoReg:%1b,MemWrite:%1b,ALUSrc:%1b,RegWrite:%1b",
        $time,ins,signals[0],signals[1],signals[2],signals[3],signals[4],signals[5],signals[6]);
end


endmodule
