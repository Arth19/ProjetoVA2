module regfile (
    input [4:0] ReadAddr1, ReadAddr2, WriteAddr, // Números dos registradores
    input [31:0] WriteData, // Dados a serem escritos
    input Clock, RegWrite, Reset, // Sinais de controle e clock
    output reg [31:0] ReadData1, ReadData2 // Dados dos registradores lidos
);

reg [31:0] registers [31:0]; // 32 registradores de 32 bits

// Leitura assíncrona
assign ReadData1 = (ReadAddr1 == 5'd0) ? 32'd0 : registers[ReadAddr1];
assign ReadData2 = (ReadAddr2 == 5'd0) ? 32'd0 : registers[ReadAddr2];

// Escrita síncrona
always @(posedge Clock or posedge Reset) begin
    if (Reset) begin
        // Reset todos os registradores para 0
        for (integer i = 0; i < 32; i = i + 1) begin
            registers[i] = 32'd0;
        end
    end else if (RegWrite && WriteAddr != 5'd0) begin
        // Escreve no registrador se RegWrite estiver habilitado e não estiver escrevendo no registrador $0
        registers[WriteAddr] = WriteData;
    end
end

endmodule
