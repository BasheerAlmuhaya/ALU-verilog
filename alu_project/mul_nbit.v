module mul_nbit( clk, rst, r, x, y );

 parameter n = 8;
 parameter m = 3;

 input wire clk;
 input wire rst;

 output reg [2*n-1:0] r;
 input wire [ n-1:0] x;
 input wire [ n-1:0] y;

/*
 wire [15:0] s0;
 wire [15:0] s1;
 wire [15:0] s2;
 wire [15:0] s3;
 wire [15:0] s4;
 wire [15:0] s5;
*/
 reg [2*n-1:0] r0;
 reg [ n-1:0] r1;
 reg [ m-1:0] r2;
 reg r3;

 wire [ m-1:0] w0;
 wire w1;
 wire [2*n-1:0] w2 = { r0[2*n-2:0], 1'b0 };
 wire [2*n-1:0] w3;

 add_nbit t0(.ci(1'b0),.r(w0),.x(r2),.y( 1));
 equ_nbit t1( .r(w1),.x(r2),.y( n-1));
 add_nbit t2(.ci(1'b0),.r(w3),.x(w2),.y({ {n{1'b0}}, x }));

 defparam t0.n = m;
 defparam t1.n = m;
 defparam t2.n = 2*n;

 always @ ( posedge rst )
 begin
 r0 = 0;
 r1 = y;
 r2 = 0;
 r3 = 0;
 end
 always @ ( posedge clk )
 begin
 if( r1[n-1] )
 r0 = w3;
 else
 r0 = w2;

 r1 = { r1[n-2:0], 1'b0 };

 if( !r3 )
 begin
 r2 = w0;

 if( w1 )
 begin
 r = r0;
 r3 = 1;
 end
 end
 end

 endmodule
