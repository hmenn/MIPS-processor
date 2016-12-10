module msb_1bit(r,cout,a,b,op,cin,lessi,v,setz);
  output r,cout; // r= result , cout= carry out
  output v,setz; // v=1 if overflow, setz=1 if r=0
  input a,b;  // a+b, a-b ...
  input [2:0] op; // operators
  // 000:and - 001:or - 010:add - 110:sub - 111:slt
  input cin; // carry in
  input lessi; // less i for slt

  wire w1,w2,w3,w3n,w4,w5,w5n,w6,w7;

  // bi ve aluop2 xor
  xor xor1(w1,op[2],b);

  or or1(w2,w1,a);

  and and1(w3,w1,a);

  not not1(w3n,w3);

  and and2(w4,w3n,w2);

  and and3(w5,w4,cin);

  or or2(cout,w5,w3);

  not not2(w5n,w5);

  or or3(w6,w4,cin);

  and and4(w7,w6,w5n);

  mux_4x1 mux0(r,w3,w2,w7,lessi,op[1],op[0]);

  xor xor2(v,cin,cout);
  xor xor3(setz,v,w7);

endmodule
