module mips_data_mem (read_data, mem_address, write_data, sig_mem_read, sig_mem_write,clock);
output [31:0] read_data;
input [31:0] mem_address;
input [31:0] write_data;
input sig_mem_read;
input sig_mem_write;
input clock;

//reg [7:0] data_mem [1023:0];
reg [31:0] data_mem  [255:0];

initial begin
	$readmemb("data.mem", data_mem);
end

always @(posedge clock) begin
		if(sig_mem_write) begin
			data_mem[mem_address >> 2] = write_data;
			$display("Time:%2d MemAddress:%32b' ye Data:%32b yazildi",$time,mem_address,write_data);
		end
end

assign read_data = sig_mem_read ? data_mem[mem_address >> 2] : 32'dx;

/*
always @(mem_address or write_data or sig_mem_read or sig_mem_write) begin

	if (sig_mem_read) begin
		read_data <= data_mem[mem_address>>2];
		$display("\nTime:%2d memadd:%32b den %32b okundu",$time,mem_address,read_data);
	end

	if (sig_mem_write) begin
		data_mem[mem_address>>2] <= write_data;
			$display("Time:%2d MemAddress:%32b' ye Data:%32b yazildi %32b",$time,mem_address,write_data,data_mem[mem_address]);
	end
end
*/
endmodule
