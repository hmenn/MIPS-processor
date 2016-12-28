module program_counter(pc_out,reset,pc_in);
  // Ilk baslangic esnasinde pc yi resetlemek icin kullanilir
  input reset;
  input [31:0] pc_in;
  output [31:0] pc_out;

  // ilk basta 0 ata
  assign pc_out = reset ? 0:pc_in;

endmodule
