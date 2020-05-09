`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 01:21:27
// Design Name: 
// Module Name: HI_LO_mux
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

//HI LO Ç°µÄforward
module HI_LO_mux(
            input [31:0] regdata,fordata,
            input src,
            output [31:0] dout
    );
    
            assign dout = (src == 1'b0)     ?       regdata     :       fordata;
endmodule
