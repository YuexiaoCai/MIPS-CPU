`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 10:54:23
// Design Name: 
// Module Name: MEM_hi_lo_forward
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


module MEM_hi_lo_forward(
            input [4:0] rs,WBwbadd,
            input WBregwrite,alusrc2,
            output src
    );
            assign src = (alusrc2 == 1'b1)      ?       1'b0        :
                                (WBwbadd == rs && WBregwrite == 1'b1)     ?       1'b1       :        1'b0;
            
endmodule
