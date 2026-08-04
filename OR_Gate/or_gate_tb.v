module or_gate_tb;
  reg A , B ;
  wire C ;
  or_gate or_gate_dut(A , B , C);
  initial
    begin
      #10 A = 0 ; B = 0 ;
      #10 A = 0 ; B = 1 ;
      #10 A = 1 ; B = 0 ;
      #10 A = 1 ; B = 1 ;
    end
endmodule
