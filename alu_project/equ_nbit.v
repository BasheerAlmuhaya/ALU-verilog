module equ_nbit( r, x, y );

 parameter n = 8;

 output wire r;
 input wire [n-1:0] x;
 input wire [n-1:0] y;

 wire [n-1:0] w0 = x ^ y;
 assign r = ~( |w0 );
 endmodule
