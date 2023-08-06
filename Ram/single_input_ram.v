`timescale 1ns/1ns

module RAM_1port(
    input clk,
    input rst,
    input enb,
    input [6:0]addr,
    input [3:0]w_data,
    output wire [3:0]r_data
);
//parameter N = 7; //2^N
//*************code***********//
reg [3:0] mem [127:0];
  always@(posedge clk or negedge rst)
begin
if(!rst)begin
mem [addr] <= 'b0;
end
else if(enb) begin
mem [addr] <= w_data;
end
end
assign r_data = ~enb? 'b0 : mem[addr];
//*************code***********//
endmodule
