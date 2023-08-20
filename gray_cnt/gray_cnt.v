`timescale 1ns/1ns

module gray_counter(
   input   clk,
   input   rst_n,

   output  reg [3:0] gray_out
);
reg [4:0]cnt;
    always@(posedge clk or negedge rst_n) begin
        if(~rst_n)
            cnt <= 'b0;
        else
          cnt <= cnt + 1; 
    end
    always@(*)begin
        if(~rst_n)
            gray_out = 0;
        else
       gray_out =  cnt[4:1]^(cnt[4:1]>>1);
    end
endmodule
