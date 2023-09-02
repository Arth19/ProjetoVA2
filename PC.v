module PC (
    input clk,       // Clock
    input reset,     // Reset signal
    input [31:0] in, // Input address
    output reg [31:0] out // Output address
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        out <= 32'b0; // Reset PC to 0
    end else begin
        out <= in; // Update PC with the input address
    end
end

endmodule
