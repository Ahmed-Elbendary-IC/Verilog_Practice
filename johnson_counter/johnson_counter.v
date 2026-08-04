module johnson_counter(clk , rst , d , q );
  input clk , rst ;
  input [3:0] d;
  output [3:0] q;
  wire not_q3;
  assign not_q3 = ~q[3];

  d_ff ff0 (not_q3 , clk , rst ,  q[0]);
  d_ff ff1 (q[0] , clk , rst ,  q[1]);
  d_ff ff2 (q[1] , clk , rst ,  q[2]);
  d_ff ff3 (q[2] , clk , rst ,  q[3]);
endmodule
  
  
