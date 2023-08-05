`timescale 1ns/1ns

module pulse_detect_tb();

reg clk_fast;
reg clk_slow;
reg rst_n;
reg data_in;
wire dataout;

pulse_detect dut(
.clk_fast(clk_fast),
.clk_slow(clk_slow),
.rst_n(rst_n),
.data_in(data_in),
.dataout(dataout)
);

initial begin
clk_fast = 0;
clk_slow = 0;
rst_n = 0;
data_in = 0;

#10 rst_n = 1;
end
// generate clock
always 
begin
#5 clk_fast = ~clk_fast;
end
always begin
#50 clk_slow = ~clk_slow;
end
// apply input pulses
initial begin
#60 data_in = 1;
#10 data_in = 0;
#300;
end





always @(posedge clk_slow) begin
$monitor("data_in = %b, dataout = %b", data_in, dataout);
end

endmodule
