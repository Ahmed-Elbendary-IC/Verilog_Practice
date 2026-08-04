module mux_2_1(d0, d1 , s , y);
  input d0 , d1 , s ;
  output y ;
  wire (not_s , out_g2 , out_g3);

  not_gate g1 (s , not_s);
  and_gate g2 (d0 , not_s, out_g2);
  and_gate g3 (d1 , s , out_g3);
  or_gate g4 (out_g2 , out_g3 , y);
endmodule

//----------------andgate----------------//
  module and_gate(a , b , c);
  input a , b;
  output c;
  assign c = a & b;
  endmodule
//----------------orgate----------------//
  module or_gate(a , b , c);
  input a , b;
  output c;
  assign c = a | b;
  endmodule
//----------------notgate----------------//
  module not_gate(a , not_a );
  input a ;
  output not_a;
  assign not_a = ~a ;
  endmodule
    
  
  
