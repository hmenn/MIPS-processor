module control_unit_test();

wire [1:0] ALUOp;
reg [5:0] ins;
wire RegDst, Branch, MemRead,MemtoReg, MemWrite,ALUSrc,RegWrite;
wire [31:0] result;


control_unit cnt(ins,RegDst, Branch, MemRead,MemtoReg, ALUOp, MemWrite,ALUSrc,RegWrite);

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
  $monitor("time=%2d, ins:%6b, RegDst:%1b, RegWrite:%1b",$time,ins,RegDst,RegWrite);
end


endmodule
