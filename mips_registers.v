module mips_registers
(
	output [31:0] read_data_1, read_data_2,
	input [31:0] write_data,
	input [4:0] read_reg_1, read_reg_2, write_reg,
	input signal_reg_write, clk
);
	reg [31:0] registers [0:31];

	// simulasyon basinda registerleri bir defa oku dosyadan
	initial begin
		$readmemb("registers.mem", registers);
	end


	// pozitif sinyal atlamalarında calisir
	// reg_write gelirse registere yazar
	// TEST Bench yazilmistir
	always @ (posedge clk)
	begin
		if (signal_reg_write) begin
			registers[write_reg] <= write_data;
			$display("time:%2d registere:%5b yazildi %32b",$time,write_reg,write_data);
		end
	end

	//okuma yapar
	assign read_data_1 = registers[read_reg_1];
	assign read_data_2 = registers[read_reg_2];


endmodule
