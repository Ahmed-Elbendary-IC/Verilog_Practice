module alu #(parameter width = 8 ,
             parameter width_opcode = 3)
(
		input wire [width - 1 : 0]  in_a , in_b ,
		input wire [width_opcode - 1 : 0] opcode , 
        output wire [width - 1 : 0] alu_out , 
        output  wire a_is_zero		
);

wire [width - 1 : 0] w_and , w_xor ;
wire [width - 1: 0] w_add_sum ;
wire c_in = 1'b0;
wire w_c_out;
 
assign a_is_zero = (in_a == 0);
assign w_and = in_a & in_b;
assign w_or = in_a | in_b;
assign w_xor = in_a ^ in_b;

full_adder  f_a(
                .in_a(in_a) , .in_b(in_b) , .c_in(c_in), 
                .w_add(w_add_sum) , .c_out(w_c_out)
);

mux3_1 mux( .w_and(w_and) , .w_xor(w_xor) , .w_add(w_add_sum) , .in_a(in_a) , .in_b(in_b) , 
            .opcode(opcode) , .alu_out(alu_out)   
);
			   
endmodule
// ----------------------------MUX-------------------------------------//

module mux3_1 # (parameter width_mux = 8 , width_opcode_mux = 3)
                (input wire [width_mux - 1 :0] w_and , w_xor , w_add ,
                input wire [width_mux - 1 : 0] in_a , in_b ,
                input wire [width_opcode_mux - 1: 0] opcode ,
                output reg [width_mux - 1 :0] alu_out
);

always @(*) 
    begin 
        case(opcode) 
		    3'b000: alu_out <= in_a ;
			3'b001: alu_out <= in_a ;
			3'b010: alu_out = w_add ;
			3'b011: alu_out <= w_and;
			3'b100: alu_out <= w_xor ;
			3'b101: alu_out <= in_b ;
			3'b110: alu_out <= in_a ;
			3'b111: alu_out <= in_a ;
		endcase
    end
endmodule
// ----------------------------full_adder-------------------------------------//
module full_adder #(parameter width_add = 8 )
                (input wire [width_add - 1: 0] in_a , 
				 input wire [width_add - 1: 0] in_b , 
				 input  wire c_in ,
                 output wire [width_add - 1: 0] w_add ,
                 output	 wire c_out
);

assign w_add = in_a + in_b + c_in;
assign c_out = (in_a & in_b) | (in_a & c_in) | (in_b & c_in);

endmodule