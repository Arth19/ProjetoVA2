module i_mem (
    input [31:0] address, // Endereço da instrução
    output reg [31:0] instruction // Instrução no endereço especificado
);

// Suponha que você tenha um conjunto de instruções hardcoded para teste
reg [31:0] memory [255:0]; // 256 instruções de 32 bits

always @(address) begin
    instruction = memory[address];
end

endmodule
