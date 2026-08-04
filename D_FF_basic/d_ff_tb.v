module d_ff_tb;
  reg c , r , d;
  wire q;

  d_ff d_ff_dut( .clk(c) , .rst(r) , .d(d) , .q(q) );

  always #5 c = ~c ;
  
  initial begin
    #10 c = 0 ; r = 1 ; d = 0;

    #10 r = 0;
    #10 r = 1; d = 1;
    #10 d = 0;
    #10 d = 1;
  end
endmodule

  
  
