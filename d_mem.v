module d_mem (
    input [31:0] address, // Endereço de memória
    input [31:0] write_data, // Dados a serem escritos
    input read, write, // Sinais de controle de leitura e escrita
    output reg [31:0] read_data // Dados lidos
);

reg [31:0] memory [255:0]; // 256 palavras de 32 bits

always @(address or write_data or read or write) begin
    if (write) begin
        memory[address] = write_data;
    end
    if (read) begin
        read_data = memory[address];
    end
end

endmodule
