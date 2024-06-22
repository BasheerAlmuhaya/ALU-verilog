module add_nbit( co, ci, r, x, y );

 parameter n = 8;

 output wire co;
 input wire ci;

 output wire [n-1:0] r;
 input wire [n-1:0] x;
 input wire [n-1:0] y;

 wire [n-2:0] w0;

 add_1bit t0( .co(w0[ 0]), .s(r[ 0]),
 .ci(ci ), .x(x[ 0]), .y(y[ 0]) );
 add_1bit t1( .co(co ), .s(r[n-1]),
 .ci(w0[n-2]), .x(x[n-1]), .y(y[n-1]) );

 genvar i;
generate
 for( i = 1; i < n-1; i = i + 1 )
 begin:gen_add
 add_1bit t2( .co(w0[i ]), .s(r[i]),
 .ci(w0[i-1]), .x(x[i]), .y(y[i]) );
 end
 endgenerate
 endmodule
