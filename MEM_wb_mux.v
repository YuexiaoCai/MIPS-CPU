`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 11:13:27
// Design Name: 
// Module Name: MEM_wb_mux
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


module MEM_wb_mux(
            input [31:0] hi,lo,cp0,dm,jal,aluresult,
            input hiread,loread,cp0read,memread,jback,
            output [31:0] dout
    );
    
            assign dout = (hiread == 1'b1)      ?      hi       :
                                   (loread == 1'b1)     ?       lo      :
                                   (cp0read == 1'b1)  ?       cp0   :
                                   (memread == 1'b1) ?      dm   :    
                                   (jback == 1'b1)       ?       jal     :      aluresult;
endmodule
