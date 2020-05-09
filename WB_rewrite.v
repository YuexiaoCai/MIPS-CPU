`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/23 19:40:52
// Design Name: 
// Module Name: WB_rewrite
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


module WB_rewrite(
            input clk,reset,
            input [31:0] WBpc,
            input WB_regwrite,
            output [3:0] WB_real_regwrite
    );
    
            reg [31:0] pre_pc;
            
            always@(posedge clk)
            begin
                    if(reset == 1'b0)
                    begin
                        pre_pc = 32'b0;
                    end
                    else
                    begin
                        pre_pc <= WBpc;
                    end
            end
            
            assign WB_real_regwrite = (WBpc == pre_pc)  ?   4'b0    :   {4{WB_regwrite}};
endmodule
