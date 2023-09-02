module ctrl (
    input [5:0] opcode, // Entrada do opcode
    input [5:0] funct,  // Funct code para instruções R-Type
    output reg [2:0] ALUOp, // Sinal de controle para a operação da ALU
    output reg RegDst, // Determina qual registrador será escrito
    output reg ALUSrc, // Seleciona a segunda entrada da ALU
    output reg MemtoReg, // Seleciona a fonte do dado a ser escrito no banco de registradores
    output reg RegWrite, // Habilita a escrita no banco de registradores
    output reg MemRead, // Habilita a leitura da memória de dados
    output reg MemWrite, // Habilita a escrita na memória de dados
    output reg Branch, // Habilita o desvio condicional
    output reg Jump // Habilita o desvio incondicional
);

always @(opcode, funct) begin
    // Valores padrão
    ALUOp = 3'b000;
    RegDst = 1'b0;
    ALUSrc = 1'b0;
    MemtoReg = 1'b0;
    RegWrite = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    Branch = 1'b0;
    Jump = 1'b0;

    case (opcode)
        6'b000000: begin // R-Type
            case (funct)
                6'b100000: begin // add
                    ALUOp = 3'b010;
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b100010: begin // sub
                    ALUOp = 3'b011;
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
					6'b000000: begin // sll
                    ALUOp = 3'b100; // Código para sll
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b000010: begin // srl
                    ALUOp = 3'b101; // Código para srl
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b000011: begin // sra
                    ALUOp = 3'b110; // Código para sra
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b100100: begin // and
                    ALUOp = 3'b000;
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b100101: begin // or
                    ALUOp = 3'b000;
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b100110: begin // xor
                    ALUOp = 3'b000;
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b100111: begin // nor
                    ALUOp = 3'b000;
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b101010: begin // slt
                    ALUOp = 3'b111;
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b101011: begin // sltu
                    ALUOp = 3'b111;
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b000100: begin // sllv
                    ALUOp = 3'b100; // Código para sllv
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b000110: begin // srlv
                    ALUOp = 3'b101; // Código para srlv
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b000111: begin // srav
                    ALUOp = 3'b110; // Código para srav
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b001000: begin // jr
                    Jump = 1'b1;
                end
                6'b001001: begin // jalr
                    Jump = 1'b1;
                    RegWrite = 1'b1; // Escreve no $ra
                end
                6'b001010: begin // mfhi
                    // Código para mfhi
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b001011: begin // mthi
                    // Código para mthi
                    RegWrite = 1'b1;
                end
                6'b001100: begin // mflo
                    // Código para mflo
                    RegDst = 1'b1;
                    RegWrite = 1'b1;
                end
                6'b001101: begin // mtlo
                    // Código para mtlo
                    RegWrite = 1'b1;
                end
					 6'b011000: begin // mult
					 	  ALUOp = 3'b100; 
					 	  RegDst = 1'b0;  
					 	  RegWrite = 1'b0;
					 end
					 6'b011001: begin // multu
						  ALUOp = 3'b101; // Multiplicação sem sinal
						  RegDst = 1'b0;
						  RegWrite = 1'b0;
					 end
					 6'b011010: begin // div
						  ALUOp = 3'b110; // Divisão
						  RegDst = 1'b0;
						  RegWrite = 1'b0;
					 end
					 6'b011011: begin // divu
						  ALUOp = 3'b111; // Divisão sem sinal
						  RegDst = 1'b0;
						  RegWrite = 1'b0;
					 end
					 6'b001110: begin // syscall
						  RegDst = 1'b0;
						  RegWrite = 1'b0;
					 end
					 6'b001001: begin // jalr (forma especial)
				 		  Jump = 1'b1;
						  RegWrite = 1'b1; // Escreve no $ra
						  RegDst = 1'b1;   // Escreve no registrador $rd
					 end
					 6'b100001: begin // addu
						  ALUOp = 3'b010; // Código para adição
						  RegDst = 1'b1;
						  RegWrite = 1'b1;
					 end
					 6'b100011: begin // subu
						  ALUOp = 3'b011; // Código para subtração
						  RegDst = 1'b1;
						  RegWrite = 1'b1;
					 end
                // ... Adicione os funct codes para as outras instruções R-Type aqui
            endcase
        end
        6'b100011: begin // lw
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
        end
        6'b101011: begin // sw
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
        end
        6'b000100: begin // beq
            ALUOp = 3'b001;
            Branch = 1'b1;
        end
        6'b001000: begin // addi
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b001010: begin // slti
            ALUOp = 3'b111; // Código para slti
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b001100: begin // andi
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b001101: begin // ori
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b001110: begin // xori
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b001111: begin // lui
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b100000: begin // lb
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
        end
        6'b100001: begin // lh
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
        end
        6'b100100: begin // lbu
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
        end
        6'b100101: begin // lhu
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
        end
        6'b101000: begin // sb
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
        end
        6'b101001: begin // sh
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
        end
        6'b101011: begin // sw
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
        end
        6'b000101: begin // bne
            ALUOp = 3'b001;
            Branch = 1'b1;
        end
        6'b000110: begin // blez
            ALUOp = 3'b001;
            Branch = 1'b1;
        end
        6'b000111: begin // bgtz
            ALUOp = 3'b001;
            Branch = 1'b1;
        end
        6'b001001: begin // addiu
            ALUOp = 3'b000;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b001011: begin // sltiu
            ALUOp = 3'b111;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b000010: begin // j
            Jump = 1'b1;
        end
        6'b000011: begin // jal
            Jump = 1'b1;
            RegWrite = 1'b1; // Escreve no $ra
        end
        6'b001010: begin // slti
            ALUOp = 3'b111; // Código para slti
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
        6'b001011: begin // sltiu
            ALUOp = 3'b111; // Código para sltiu
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
        end
    endcase
end

endmodule
