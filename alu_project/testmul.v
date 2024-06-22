// Code your testbench here
// or browse Examples
module testmul();
 reg Clock;
 reg rst;
 reg [31:0] src0;
 reg [31:0] src1;
 
 wire [31:0] dst_lo;
 wire [31:0] dst_hi;

//Module to be tested
  mul_nbit m1(Clock , rst , {dst_hi,dst_lo}, src0 , src1 );
  defparam m1.n=32;
  defparam m1.m=5;
 //Clock Setup
initial 
begin
	Clock = 0;
	rst = 0 ;
	src0 = 5 ;
	src1 = 2 ;
	#10 rst = 1;
	#10 rst = 0;
end

always 
begin
	#5 Clock = ~Clock;
end
//End Clock Setup

//Actual Testing
initial 
begin
	#400; //Wait a long time
	$display(" first number %d \n second number %d \n result %d ", src0 , src1 , {dst_hi,dst_lo} );
	#100; //Wait a little more
$finish ;
end
//End of Testing


endmodule

