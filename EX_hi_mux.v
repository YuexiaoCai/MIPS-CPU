`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 10:34:57
// Design Name: 
// Module Name: EX_hi_mux
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


module EX_hi_mux(
            input alusrc2,
            input [31:0] cal,regrs,
            output [31:0] hi
    );
    
            assign hi = (alusrc2 == 1'b0)       ?       regrs       :       cal;
                  
endmodule
