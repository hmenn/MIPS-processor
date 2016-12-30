module mips_registers_test();

wire [31:0] read_data_1, read_data_2;
reg [31:0] write_data;
reg [4:0] read_reg_1, read_reg_2, write_reg;
reg signal_reg_write, clk;

mips_registers mr(read_data_1,read_data_2,write_data,read_reg_1,read_reg_2,write_reg,signal_reg_write,clk);


initial begin
  clk=0;
  read_reg_1=0;
  read_reg_2=0;
  write_data=0;
  write_reg=0;
  signal_reg_write=0;

  $monitor("Time:%g\t clk=%1b sig:%1b\n\treadreg1:%5b\treadreg2:%5b\twritereg:%5b\n\twritedata:%32b\n\treaddata1:%32b\n\treaddata2:%32b",
            $time,clk,signal_reg_write,read_reg_1,read_reg_2,write_reg,
            write_data,read_data_1,read_data_2);
  #50 $finish;
end


always begin
  #10
  write_data<=write_data+1;
  signal_reg_write=~signal_reg_write;
  clk=~clk;
  //read_reg_1+=1;
  read_reg_2<=read_reg_2+1;

end


endmodule
