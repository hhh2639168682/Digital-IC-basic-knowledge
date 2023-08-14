
`timescale 1ns/1ns

module pulse_detect(
	input 				clk_fast	, 
	input 				clk_slow	,   
	input 				rst_n		,
	input				data_in		,

	output  		 	dataout
);
reg in_rs;
reg in_r0;
reg in_r1;
reg out_rs;
reg out_r0;
reg out_r1;

/////
always @(posedge clk_fast or negedge rst_n )
begin
	if(!rst_n)
	in_rs <= 'b0;
	//  else if(in_r1) 
	//  begin
	//  	in_rs <= 'b0;
	//  end
	else if(data_in)
	in_rs <= ~in_rs;
	else
	in_rs <= in_rs;
end
////
always @(posedge clk_slow or negedge rst_n )
begin
	if(!rst_n)
	out_rs <='b0;
	else
	out_rs <= in_rs;
end
////
always @(posedge clk_slow or negedge rst_n )
begin
	if(!rst_n)
	begin
	out_r0<='b0;
	out_r1<='b0;
	end
	else
	begin
	out_r0 <= out_rs;
	out_r1 <= out_r0;
	end
end
//////



/////
// always @(posedge clk_fast or negedge rst_n )
// begin
// 	if(!rst_n)begin
// 	in_r0 <= 'b0;
// 	in_r1 <= 'b0;
// 	end
// 	else
// 	begin
// 	in_r0 <= out_r1;
// 	in_r1 <= in_r0;
// 	end
// end 

assign dataout = out_r0 ^ out_r1 ;
///
endmodule
