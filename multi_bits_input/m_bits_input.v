`timescale 1ns/1ns

module mux(
	input 				clk_a	, 
	input 				clk_b	,   
	input 				arstn	,
	input				brstn   ,
	input		[3:0]	data_in	,
	input               data_en ,

	output reg  [3:0] 	dataout
);
reg [3:0]data_r0;
reg en_r0;
reg en_r1;
reg en_r2;

always @(posedge clk_a or negedge arstn)
begin
if(!arstn)begin
    data_r0 <= 'b0;
    en_r0 <= 'b0;
end
else
begin
    data_r0 <= data_in;
    en_r0 <= data_en;
end
end

always @(posedge clk_b or negedge arstn)
begin
if(!brstn)begin
    en_r1 <= 'b0;
    en_r2 <= 'b0;
end
else
begin
    en_r1 <= en_r0;
    en_r2 <= en_r1;
end
end

always @(posedge clk_b or negedge arstn)
begin
if(!brstn)begin
    dataout <= 'b0;
end
else if (en_r2) begin
    dataout <= data_r0;
end
else
    dataout <= dataout;
end

endmodule
