module johnson_counter_tb;
  reg clk , rst;
  wire [3:0] q;

  johnson_counter johnson_counter_dut (clk , rst , q);

  always #10 clk = ~clk ;
  
  initial begin 
    #10 clk = 0; rst = 1; // Reset inactive
    #10 rst = 0;          // Reset active
    #10 rst = 1; // Reset inactive
    #100;  // شغل 10 دورات

    $finish;
  end
  
endmodule
  
