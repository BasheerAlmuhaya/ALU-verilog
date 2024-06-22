module lth_nbit( r, x, y );
 parameter n = 8;

 output wire r;
 input wire [n-1:0] x;
 input wire [n-1:0] y;
 wire [n-1:0] w0 =~(x ^ y );
 wire [n-1:0] w1 = ( ~x & y );
 wire [n-1:0] w2;

 assign w2[0] = w1[ 0];
 assign r = w2[n-1];
 genvar i;
 generate
 begin
 for( i = 1; i < n; i = i + 1 )
 begin:gen_lth
 assign w2[i] = w1[i] | ( w0[i] & w2[i-1] );
 end
 end
 endgenerate
 endmodule
