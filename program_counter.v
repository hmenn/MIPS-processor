module program_counter(pc_out,clock,reset,pc_in);
  // Ilk baslangic esnasinde pc yi resetlemek icin kullanilir
  input reset;
  input clock;
  input [31:0] pc_in;
  output reg [31:0] pc_out;

  // her + edge clock guncellensin
  always @ (posedge clock or posedge reset) begin
    pc_out = reset ? 0 : pc_in;
    /*  if(reset)
        pc_out=0;
      else
        pc_out=pc_in;*/
  end

endmodule
