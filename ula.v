module ula (
    input [31:0] operand1, operand2, // Operandos
    input [2:0] operation, // Tipo de operação
    output reg [31:0] result // Resultado
);

always @(operand1 or operand2 or operation) begin
    case (operation)
        3'b000: result = operand1 + operand2; // Adição
        3'b001: result = operand1 - operand2; // Subtração
        // Adicione mais operações conforme necessário
    endcase
end

endmodule
