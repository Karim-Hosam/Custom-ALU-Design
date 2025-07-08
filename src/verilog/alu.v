module alu_registered(
    input clk,
    input signed [3:0] A,
    input signed [3:0] B,
    input [3:0] opcode,
    output reg signed [7:0] result
    );

    reg signed [3:0] A_reg, B_reg;
    reg signed [7:0] alu_result;

    // Register inputs A and B
    always @(posedge clk) begin
        A_reg <= A;
        B_reg <= B;
    end

    // Combinational ALU logic using registered inputs and combinational opcode
    always @(*) begin
        case(opcode)
            4'b0000: alu_result = A_reg + 1;
            4'b0001: alu_result = B_reg + 1;
            4'b0010: alu_result = A_reg;
            4'b0011: alu_result = B_reg;
            4'b0100: alu_result = A_reg - 1;
            4'b0101: alu_result = A_reg * B_reg;
            4'b0110: alu_result = A_reg + B_reg;
            4'b0111: alu_result = A_reg - B_reg;
            4'b1000: alu_result = ~A_reg;
            4'b1001: alu_result = ~B_reg;
            4'b1010: alu_result = A_reg & B_reg;
            4'b1011: alu_result = A_reg | B_reg;
            4'b1100: alu_result = A_reg ^ B_reg;
            4'b1101: alu_result = ~(A_reg ^ B_reg);
            4'b1110: alu_result = ~(A_reg & B_reg);
            4'b1111: alu_result = ~(A_reg | B_reg);
            default: alu_result = 0;
        endcase
    end

    // Register the ALU output result on clk (single flip-flop)
    always @(posedge clk) begin
        result <= alu_result;
    end

endmodule
