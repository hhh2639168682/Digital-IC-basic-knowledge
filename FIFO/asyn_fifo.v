`timescale 1ns/1ns

/***************************************RAM*****************************************/
module dual_port_RAM #(parameter DEPTH = 16,
					   parameter WIDTH = 8)(
	 input wclk
	,input wenc
	,input [$clog2(DEPTH)-1:0] waddr  //深度对2取对数，得到地址的位宽。
	,input [WIDTH-1:0] wdata      	//数据写入
	,input rclk
	,input renc
	,input [$clog2(DEPTH)-1:0] raddr  //深度对2取对数，得到地址的位宽。
	,output reg [WIDTH-1:0] rdata 		//数据输出
);

reg [WIDTH-1:0] RAM_MEM [0:DEPTH-1];

always @(posedge wclk) begin
	if(wenc)
		RAM_MEM[waddr] <= wdata;
end 

always @(posedge rclk) begin
	if(renc)
		rdata <= RAM_MEM[raddr];
		
end 

endmodule  

/***************************************AFIFO*****************************************/
module asyn_fifo#(
	parameter	WIDTH = 8,
	parameter 	DEPTH = 16
)(
	input 					wclk	, 
	input 					rclk	,   
	input 					wrstn	,
	input					rrstn	,
	input 					winc	,
	input 			 		rinc	,
	input 		[WIDTH-1:0]	wdata	,

	output wire				wfull	,
	output wire				rempty	,
	output wire [WIDTH-1:0]	rdata
);

reg [$clog2(DEPTH):0] raddr;
reg [$clog2(DEPTH):0] raddgr;
reg [$clog2(DEPTH):0] raddgr1;
reg [$clog2(DEPTH):0] raddgr2;
reg [$clog2(DEPTH):0] waddr; 
reg [$clog2(DEPTH):0] waddgr; 
reg [$clog2(DEPTH):0] waddgr1;
reg [$clog2(DEPTH):0] waddgr2;

always@(posedge wclk or negedge wrstn ) begin
	if(!wrstn)begin
    waddgr <= 'b0;
	end
	else
	waddgr <= waddr^(waddr>>1);
end

always@(posedge rclk or negedge rrstn ) begin
	if(!rrstn)begin
    raddgr <= 'b0;
	end
	else
	raddgr <= raddr^(raddr>>1);
end


////CDC/////
always@(posedge wclk or negedge wrstn ) begin
	if(!wrstn)begin
		raddgr1 <= 'b0;
		raddgr2 <= 'b0;
	end
	else begin
	raddgr1 <=raddgr;
	raddgr2 <=raddgr1;
	end
end
////CDC/////
always@(posedge rclk or negedge rrstn ) begin
	if(!rrstn)begin
		waddgr1 <= 'b0;
		waddgr2 <= 'b0;
	end
	else begin
	waddgr1 <=waddgr;
	waddgr2 <=waddgr1;
	end
end

////// track path
always@(posedge wclk or negedge wrstn ) begin
	if(!wrstn)
	waddr <= 'b0;
	else if(winc&&!wfull)
	waddr <= waddr + 1'b1;
	else
	waddr <= waddr;
end
////// track path
always@(posedge rclk or negedge rrstn ) begin
	if(!rrstn)
	raddr <= 'b0;
	else if(rinc&&!rempty)
	raddr <= raddr + 1'b1;
	else
	raddr <= raddr;
end

////wfull////
assign wfull= (waddgr == {~raddgr2[$clog2(DEPTH):$clog2(DEPTH)-1],raddgr2[$clog2(DEPTH)-2:0]});
assign rempty= (raddgr == waddgr2);

    // parameter ADDR_WIDTH = $clog2(DEPTH);
    wire wenc, renc;
    //wire [ADDR_WIDTH-1:0] raddr, waddr;
     
    assign wenc = winc & !wfull;
    assign renc = rinc & !rempty;
     
    //assign raddr = rptr_bin[ADDR_WIDTH-1:0];
    //assign waddr = wptr_bin[ADDR_WIDTH-1:0];
     
    dual_port_RAM #(.DEPTH(DEPTH), .WIDTH(WIDTH))
                u_dual_port_RAM (
                .wclk(wclk),
                .rclk(rclk),
                .wenc(wenc),
                .renc(renc),
                .raddr(raddr[$clog2(DEPTH)-1:0]),
                .waddr(waddr[$clog2(DEPTH)-1:0]),
                .wdata(wdata),
                .rdata(rdata)
                );
 

endmodule
