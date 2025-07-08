`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 08:51:00 PM
// Design Name: 
// Module Name: alu_tb
// Description: Testbench for ALU with registered inputs/outputs
//////////////////////////////////////////////////////////////////////////////////

module alu_tb;

    reg clk;
    reg signed [3:0] A_t;
    reg signed [3:0] B_t;
    reg [3:0] opcode_t;
    wire signed [7:0] result_t;

    // Instantiate DUT
    alu uut (
        .clk(clk),
        .A(A_t),
        .B(B_t),
        .opcode(opcode_t),
        .result(result_t)
    );

    // Clock generation: 670 MHz (T = 1.5 ns)
    initial clk = 0;
    always #0.75 clk = ~clk; // Toggle every 0.75ns ? 1.5ns period

    initial begin
        $display("Time    | A     B   | opcode | result");
        $display("--------|-------------|--------|--------");

        A_t = 0; B_t = 0; opcode_t = 0;
        #5; // Wait for initial setup

        for(opcode_t = 4'b0000; opcode_t <= 4'b1111; opcode_t = opcode_t + 1) begin
            A_t = 4'b1110;
            B_t = 4'b0110;
            #3; // Wait for clock edge and propagation
            $display("%0t | %b %b | %b  | %b", $time, A_t, B_t, opcode_t, result_t);
        end

        $stop;
    end

endmodule
