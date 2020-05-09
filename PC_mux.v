`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 15:30:34
// Design Name: 
// Module Name: PC_mux
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


module PC_mux(
            input [31:0] npc,
            input [31:0] epc,
            input [31:0] pc4,
            input is_exp,
            input is_branch,
            output [31:0] real_npc
    );
    
            assign real_npc = (is_exp == 1'b1)      ?       epc         :
                                        (is_branch == 1'b1)  ?      npc         :         pc4;
endmodule
