`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 00:49:22
// Design Name: 
// Module Name: ALU_forward
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


module ALU_forward(
            input [4:0] rs,rt,
            input [4:0] MEM_wbadd,WB_wbadd,
            input MEM_regwrite,WB_regwrite,
            input jback,
            output [1:0] alusrc1,alusrc2
    );
    
            assign alusrc1 = ( MEM_wbadd == rs  &&  MEM_regwrite == 1'b1)   ?    2'b01  :
                                      ( WB_wbadd == rs && WB_regwrite == 1'b1)      ?       2'b10   :   2'b00;
                                      
                                      
            assign alusrc2 = (jback == 1'b1)    ?    2'b00  :
                                      ( MEM_wbadd == rt  &&  MEM_regwrite == 1'b1)   ?    2'b01  :
                                      ( WB_wbadd == rt && WB_regwrite == 1'b1)      ?       2'b10   :   2'b00;
            
endmodule
