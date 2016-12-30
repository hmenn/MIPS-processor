`include "mips_data_mem.v"

module mips_data_mem_test();

  wire [31:0] read_data;
  reg [31:0] mem_address;
  reg [31:0] write_data;
  reg sig_mem_read;
  reg sig_mem_write;

  mips_data_mem memTest(read_data,mem_address,write_data,sig_mem_read,sig_mem_write);

  initial begin
    $display("Data Memory Test");
    $monitor("\nTime:%3d|-->mem_address:%32b sigRead:%1b, sigWrite:%1b\n\t|-->write_data :%32b\n\t|-->read_data  :%32b"
        ,$time,mem_address,sig_mem_read,sig_mem_write,write_data,read_data);
    sig_mem_read=0;
    sig_mem_write=0;
    mem_address=0;
    write_data=0;
    #20;
    sig_mem_read=1;
    sig_mem_write=0;
    mem_address=0;
    write_data=0;
    #20;
    sig_mem_read=1;
    sig_mem_write=0;
    mem_address=4;
    write_data=0;
    #20;
    sig_mem_read=0;
    sig_mem_write=1;
    mem_address=4;
    write_data=12;
    #20;
    sig_mem_read=1;
    sig_mem_write=0;
    mem_address=4;
    write_data=0;
    #20;
    sig_mem_read=1;
    sig_mem_write=0;
    mem_address=8;
    write_data=0;
    #20;
    sig_mem_read=0;
    sig_mem_write=1;
    mem_address=12;
    write_data=955;
    #20;
    sig_mem_read=1;
    sig_mem_write=0;
    mem_address=12;
    write_data=0;
    #20;
  end



endmodule
