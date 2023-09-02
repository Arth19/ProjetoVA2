module ula_ctrl(ALUOp, funct, ALUCtrl);
    input [2:0] ALUOp;
    input [5:0] funct;
    output reg [3:0] ALUCtrl; // Supondo que ALUCtrl seja de 4 bits para cobrir todas as operações

    always @(ALUOp, funct) begin
        case (ALUOp)
            3'b000: ALUCtrl = 4'b0010; // add
            3'b001: ALUCtrl = 4'b0110; // subtract
            3'b010: begin
                case (funct)
                    6'b100000: ALUCtrl = 4'b0010; // add
                    6'b100001: ALUCtrl = 4'b0010; // addu
                    6'b100010: ALUCtrl = 4'b0110; // sub
                    6'b100011: ALUCtrl = 4'b0110; // subu
                    6'b100100: ALUCtrl = 4'b0000; // and
                    6'b100101: ALUCtrl = 4'b0001; // or
                    6'b100110: ALUCtrl = 4'b0011; // xor
                    6'b100111: ALUCtrl = 4'b0100; // nor
                    6'b101010: ALUCtrl = 4'b0111; // slt
                    6'b101011: ALUCtrl = 4'b1000; // sltu
                    6'b000000: ALUCtrl = 4'b1001; // sll
                    6'b000010: ALUCtrl = 4'b1010; // srl
                    6'b000011: ALUCtrl = 4'b1011; // sra
                    6'b000100: ALUCtrl = 4'b1001; // sllv
                    6'b000110: ALUCtrl = 4'b1010; // srlv
                    6'b000111: ALUCtrl = 4'b1011; // srav
                    6'b011000: ALUCtrl = 4'b1100; // mult
                    6'b011001: ALUCtrl = 4'b1101; // multu
                    6'b011010: ALUCtrl = 4'b1110; // div
                    6'b011011: ALUCtrl = 4'b1111; // divu
                endcase
            end
            3'b011: ALUCtrl = 4'b0111; // slt (para instruções I-Type)
            3'b100: ALUCtrl = 4'b1001; // sll (para instruções I-Type)
            3'b101: ALUCtrl = 4'b1010; // srl (para instruções I-Type)
            3'b110: ALUCtrl = 4'b1011; // sra (para instruções I-Type)
            3'b111: ALUCtrl = 4'b0111; // sltu (para instruções I-Type)
        endcase
    end
endmodule
