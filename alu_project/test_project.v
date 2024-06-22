module test_project();
 reg Clock;
 reg rst;
 reg [ 5:0] oper;
 reg [31:0] src0;
 reg [31:0] src1;
 
 wire [31:0] dst_lo;
 wire [31:0] dst_hi;

//Module to be tested
alu_exe alu1( Clock , rst , oper , src0 , src1 , dst_lo , dst_hi );

 //Clock Setup
initial 
begin
	Clock = 0;
	rst = 0;
	src0 = 5 ;
	src1 = -2 ;
	//#350 oper = alu1.FUNCT_ADD ;
	//#350 oper = alu1.FUNCT_SUB ;
	//#350 oper = alu1.FUNCT_AND ;
	//#350 oper = alu1.FUNCT_OR ;
	//#350 oper = alu1.FUNCT_XOR ;
	//#350 oper = alu1.FUNCT_NOR ;
	//#350 oper = alu1.FUNCT_SLLV ;
	//#350 oper = alu1.FUNCT_SRLV ;
	#10 oper = alu1.FUNCT_MUL ;
	//#350 oper = alu1.FUNCT_MULT ;
	#1000; //Wait a little more
	$finish ;
end

always 
begin 
	#5 Clock = ~Clock;
end
//End Clock Setup

//Actual Testing
always @ (dst_lo)
begin
	$display(" first number %d \n second number %d \n result %d ", src0 , src1 ,{dst_hi,dst_lo} );
end
//End of Testing
endmodule

