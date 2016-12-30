`include "alu_control_unit.v"
module alu_control_unit_test();

  wire [3:0] ALUCtl;
  reg [2:0] ALUOp;
  reg [5:0] func;

  localparam ANDFunc =6'b100100;
  localparam ANDIFunc =6'b001100;

  alu_control_unit alucu(ALUCtl,ALUOp,func);


  initial begin
    ALUOp=3'b010; // Rtype
    func =ANDFunc;
    #20;
    ALUOp=3'b100; // andi
    #20;
  end

  initial begin
    $monitor("Time:%2d AluOP:%3b Func:%6b ALUCtl:%4b",$time,ALUOp,func,ALUCtl);
  end

endmodule
