module regfile (
    input [4:0] read_reg1, read_reg2, write_reg, // Números dos registradores
    input [31:0] write_data, // Dados a serem escritos
    input write_enable, // Sinal de controle de escrita
    output reg [31:0] read_data1, read_data2 // Dados dos registradores lidos
);

reg [31:0] registers [31:0]; // 32 registradores de 32 bits

always @(read_reg1 or read_reg2 or write_reg or write_data or write_enable) begin
    read_data1 = registers[read_reg1];
    read_data2 = registers[read_reg2];
    if (write_enable) begin
        registers[write_reg] = write_data;
    end
end

endmodule
