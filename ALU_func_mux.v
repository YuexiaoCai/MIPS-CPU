`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 01:00:45
// Design Name: 
// Module Name: ALU_func_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//ALU 前的功能mux
module ALU_func_mux(
            input [31:0] din,imm,
            input alusrc,
            output [31:0] dout
    );
    
            assign dout = (alusrc == 1'b1)  ?   din     :       imm;
endmodule
