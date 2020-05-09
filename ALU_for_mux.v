`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 00:46:18
// Design Name: 
// Module Name: ALU_for_mux
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


module ALU_for_mux(
            input [31:0] bus,MEM_data,WB_data,
            input [1:0] alusrc,
            output [31:0] dout
    );
    
            assign dout = (alusrc == 2'b00)     ?       bus     :
                                   (alusrc == 2'b01)     ?       MEM_data   :    WB_data;
endmodule
