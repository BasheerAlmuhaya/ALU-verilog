module Mux2to1_gate(out,A,B,select);
input A,B,select;
output out;
wire c,d,e;
not g1(e,select);
and g2(c,A,e);
and g3(d,B,select);
or g4(out,c,d);
endmodule
