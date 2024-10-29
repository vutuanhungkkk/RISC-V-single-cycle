module ImmExtend(input[2:0] immSrc,input[31:7] imm,output reg[31:0] extend);
	always @(immSrc,imm) begin 
		case(immSrc)
			3'b000:extend={{20{imm[31]}},imm[31:20]}; // I_Type
			3'b001:extend={{20{imm[31]}},imm[31:25],imm[11:7]}; //S_Type
			3'b010:extend={{12{imm[31]}},imm[31],imm[19:12],imm[20],imm[30:21],1'b0}; //J_Type
			3'b011:extend={{19{imm[31]}},imm[31],imm[7],imm[30:25],imm[11:8],1'b0};//B_Type
		 	3'b100:extend={imm[31:12],{12{1'b0}}};//U_Type
			default: extend = {32{1'b0}};
		endcase
	end
endmodule
