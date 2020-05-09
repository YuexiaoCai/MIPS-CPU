`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 19:31:11
// Design Name: 
// Module Name: NPC
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


module NPC(
            input [31:0] instruct,
            input [31:0] pc,
            input [31:0] r31,
            input jump,
            input branch,
            input jr,
            output [31:0] npc
    );
            assign npc = (branch == 1'b1)       ?       pc+{{14{instruct[15]}},instruct[15:0],2'b00}      :
                                  (jump == 1'b0)         ?        pc        :
                                  (jr == 1'b1)                ?        r31      :       {pc[31:28],instruct[25:0],2'b00}     ; 
endmodule







