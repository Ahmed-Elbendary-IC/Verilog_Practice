module encoder(d1,d2,d3,d4,d5,d6,d7,d8,d9, a0, a1, a2, a3);

input d1,d2,d3,d4,d5,d6,d7,d8,d9;
output a0, a1, a2, a3;

assign a0 = d1 | d3 | d5 | d7 | d9;
assign a1 = d2 | d3 | d6 | d7;
assign a2 = d4 | d5 | d6 | d7;
assign a3 = d8 | d9;

endmodule