module mux8_1bit( output r, input i0 , input i1 , input i2 , input i3 ,
		 input i4 , input i5 , input i6 , input i7,
		 input s0 , input s1 , input s2 );
 
wire outm1,outm12,outm13,outm14,outm21,outm22;

Mux2to1_gate m11(outm11,i0,i1,s0);
Mux2to1_gate m12(outm12,i2,i3,s0);
Mux2to1_gate m13(outm13,i4,i5,s0);
Mux2to1_gate m14(outm14,i6,i7,s0);
Mux2to1_gate m21(outm21,outm11,outm12,s1);
Mux2to1_gate m22(outm22,outm13,outm14,s1);
Mux2to1_gate m31(r,outm21,outm22,s2);

endmodule