`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 11:08:22
// Design Name: 
// Module Name: MEM_rt_for_mux
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


module MEM_rt_for_mux(
            input [31:0] regdata,fordata,
            input [4:0] rt,WBwbadd,WBregwrite,
            output [31:0] dout
    );
    
            assign dout = (WBwbadd == rt && WBregwrite == 1'b1)     ?       fordata     :       regdata;
endmodule
