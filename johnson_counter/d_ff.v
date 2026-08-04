module d_ff( d ,clk , rset , q);
input d, clk, rset;
output reg q;

always @ (posedge clk or negedge rset)
       if (!rset)
           q <= 0;
       else
           q <= d;
endmodule 