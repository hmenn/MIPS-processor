module mux_4x1(output out,input c0,input c1,input c2,input c3,input s1,input s0);

  wire s0n,s1n; //s0 not, s1 not
  wire w1,w2,w3,w4;

  not n1(s0n,s0);
  not n2(s1n,s1);

  and and1(w1,c0,s1n,s0n);
  and and2(w2,c1,s1n,s0);
  and and3(w3,c2,s1,s0n);
  and and4(w4,c3,s1,s0);

  or or1(out,w1,w2,w3,w4);

endmodule
