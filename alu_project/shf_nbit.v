
module shf_nbit( clk, rst, oper, r, x, y );

 parameter n = 8;
 parameter m = 3;
 parameter SHF_R_LOGIC =3'b000 ;
 parameter SHF_R_ARITH =3'b001 ;
 parameter SHF_R_ROTATE =3'b010 ;
 parameter SHF_L_LOGIC =3'b011 ;
 parameter SHF_L_ARITH =3'b100 ;
 parameter SHF_L_ROTATE =3'b101;
 input wire clk;
 input wire rst;

 input wire [ 2:0] oper;

 output reg [n-1:0] r;
 input wire [n-1:0] x;
 input wire [n-1:0] y;
 reg [n-1:0] r0;
 reg [m-1:0] r1;
 reg r2;

 wire [m-1:0] w0;
 wire w1;

 add_nbit t0(.ci(1'b0),.r(w0),.x(r1),.y(1 ) );
 equ_nbit t1( .r(w1),.x(w0),.y(y[m-1:0]) );

 defparam t0.n = m;
 defparam t1.n = m;

 always @ ( posedge rst )
 begin
 r0 = x;
 r1 = 0;
 r2 = 0;
 end

 always @( posedge clk )
 begin
 case( oper )
 SHF_R_LOGIC : r0 = { 1'b0, r0[n-1:1] };
 SHF_R_ARITH : r0 = { r0[n-1], r0[n-1:1] };
 SHF_R_ROTATE : r0 = { r0[ 0], r0[n-1:1] };
 SHF_L_LOGIC : r0 = { r0[n-2:0], 1'b0 };
 SHF_L_ROTATE : r0 = { r0[n-2:0], r0[n-1] };
 endcase

 if( !r2 )
 begin
 r1 = w0;

 if( w1 )
 begin
 r = r0;

 r2 = 1;
 end
 end
 end

 endmodule
