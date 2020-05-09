`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 01:02:36
// Design Name: 
// Module Name: EX_wb_mux
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


module EX_wb_mux(
            input [4:0] rt,rd,
            input regdes,
            output [4:0] wbadd
    );
            assign wbadd = (regdes == 1'b1)     ?       rd      :       rt;
endmodule
