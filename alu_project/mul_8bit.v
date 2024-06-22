module mul_8bit( output wire [15:0] r,
 input wire [ 7:0] x,
 input wire [ 7:0] y );

 wire [15:0] w0 = {8'b0, {8{y[0]}} & x} ;
 wire [15:0] w1 = {8'b0, {8{y[1]}} & x} << 1;
 wire [15:0] w2 = {8'b0, {8{y[2]}} & x} << 2;
 wire [15:0] w3 = {8'b0, {8{y[3]}} & x} << 3;
 wire [15:0] w4 = {8'b0, {8{y[4]}} & x} << 4;
 wire [15:0] w5 = {8'b0, {8{y[5]}} & x} << 5;
 wire [15:0] w6 = {8'b0, {8{y[6]}} & x} << 6;
 wire [15:0] w7 = {8'b0, {8{y[7]}} & x} << 7;

 wire [15:0] s0;
 wire [15:0] s1;
 wire [15:0] s2;
 wire [15:0] s3;
 wire [15:0] s4;
 wire [15:0] s5;

 add_nbit t0(.ci(1'b0),.r(s0),.x(w0),.y(w1));
 add_nbit t1(.ci(1'b0),.r(s1),.x(w2),.y(w3));
 add_nbit t2(.ci(1'b0),.r(s2),.x(w4),.y(w5));
 add_nbit t3(.ci(1'b0),.r(s3),.x(w6),.y(w7));

 add_nbit t4(.ci(1'b0),.r(s4),.x(s0),.y(s1));
 add_nbit t5(.ci(1'b0),.r(s5),.x(s2),.y(s3));

 add_nbit t6(.ci(1'b0),.r(r ),.x(s4),.y(s5));

 defparam t0.n = 16;
 defparam t1.n = 16;
 defparam t2.n = 16;
 defparam t3.n = 16;

 defparam t4.n = 16;
 defparam t5.n = 16;

 defparam t6.n = 16;

 endmodule
