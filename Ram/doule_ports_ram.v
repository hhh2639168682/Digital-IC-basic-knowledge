`timescale 1ns/1ns
module ram_mod(
	input clk,
	input rst_n,
	
	input write_en,
	input [7:0]write_addr,
	input [3:0]write_data,
	
	input read_en,
	input [7:0]read_addr,
	output reg [3:0]read_data
);
///write enable
reg [3:0] mem [7:0];
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
	mem [write_addr] <= 'b0;
	else if (write_en) 
	mem [write_addr] <= write_data;
end

always @(posedge clk or negedge rst_n)
begin
if(!rst_n)begin
	mem [read_addr] <= 'b0;
	read_data <= 'b0;
end
	else if (read_en) 
	read_data <= mem[read_addr] ;
	else
	read_data <= read_data;
end
endmodule
