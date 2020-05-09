`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 01:07:14
// Design Name: 
// Module Name: MEM_alu_jb_mux
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


module MEM_alu_jb_mux(
            input [31:0] aluresult,data,
            input jback,
            output [31:0] dout
    );
    
            assign dout = (jback == 1'b1)   ?   data    :   aluresult;
endmodule
