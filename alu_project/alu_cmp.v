module alu_cmp( input wire clk,
 input wire rst,

 input wire [31:0] src0,
 input wire [31:0] src1,

 output wire dst_equ,
 output wire dst_neq,
 output wire dst_lth,
 output wire dst_lte,
 output wire dst_gth,
 output wire dst_gte );

 wire w0;
 wire w1;
 wire w2;

 equ_nbit t0( .r(w0), .x(src0[31:0]), .y(src1[31:0]) );
 lth_nbit t1( .r(w1), .x(src0[30:0]), .y(src1[30:0]) );

 defparam t0.n = 32;
 defparam t1.n = 31;

 assign w2 = ( src0[31] & src1[31] & ~w0 & w1) |
 ( ~src0[31] & src1[31] ) |
 ( src0[31] & src1[31] & ~w0 & w1 ) ;

 assign dst_equ = w0;
 assign dst_lth = w2;

 assign dst_neq = ~dst_equ ;
 assign dst_lte = dst_lth | dst_equ ;
 assign dst_gth = ~dst_lte ;
 assign dst_gte = ~dst_lth ;

 endmodule
