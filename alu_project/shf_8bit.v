module shf_8bit( input wire [2:0] oper,

 output wire [7:0] r,
 input wire [7:0] x,
 input wire [7:0] y );

 wire [7:0] w0;
 wire [7:0] w1;
 wire [7:0] w2;
 wire [7:0] w3;
 wire [7:0] w4;
 wire [7:0] w5;
 wire [7:0] w6;

 assign w0 = x;
 assign r = w6;

 mux8_8bit t0( .r(w1),

 .i0({ 1'b0, w0[7:1] }),
 .i1({ {1{w0[7:7]}}, w0[7:1] }),
 .i2({ w0[0:0], w0[7:1] }),
 .i3({ w0[6:0], 1'b0 }),
 .i5({ w0[6:0], w0[7:7] }),

 .s0(oper[0]), .s1(oper[1]), .s2(oper[2]) );

 mux2_8bit t1( .r(w2), .i0(w0), .i1(w1), .s0(y[0]) );

 mux8_8bit t2( .r(w3),

 .i0({ 2'b0, w2[7:2] }),
 .i1({ {2{w2[7:7]}}, w2[7:2] }),
 .i2({ w2[1:0], w2[7:2] }),
 .i3({ w2[5:0], 2'b0 }),
 .i5({ w2[5:0], w2[7:6] }),

 .s0(oper[0]), .s1(oper[1]), .s2(oper[2]) );

 mux2_8bit t3( .r(w4), .i0(w2), .i1(w3), .s0(y[1]) );

 mux8_8bit t4( .r(w5),

 .i0({ 4'b0, w4[7:4] }),
 .i1({ {4{w4[7:7]}}, w4[7:4] }),
 .i2({ w4[3:0], w4[7:4] }),
 .i3({ w4[3:0], 4'b0 }),
 .i5({ w4[3:0], w4[7:4] }),

 .s0(oper[0]), .s1(oper[1]), .s2(oper[2]) );

 mux2_8bit t5( .r(w6), .i0(w4), .i1(w5), .s0(y[2]) );

 endmodule
