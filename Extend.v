`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 23:02:33
// Design Name: 
// Module Name: Extend
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


module Extend(
            input [15:0] imm,
            input src,
            output [31:0] dout
    );
            assign dout = (src == 1'b1)     ?       {{16{imm[15]}},imm[15:0]}         :         {16'b0,imm[15:0]};
endmodule
