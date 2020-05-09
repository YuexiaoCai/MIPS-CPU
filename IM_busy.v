`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 15:34:10
// Design Name: 
// Module Name: IM_busy
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


module IM_busy(
            input [31:0] pc,
            input clk,
            input reset,
            output busy
    );
            reg [31:0] pre_pc;
            reg delay;
            
            always@(posedge clk)
                    delay <= reset;
                    
                    
            always@(posedge clk)
            begin
                    if(reset == 1'b0)
                    begin
                            pre_pc <= 32'b0; 
                    end
                    else
                    begin
                            pre_pc <= pc;
                    end
            end
            
            assign busy = (pc == pre_pc)    ?      0       :       1;      
endmodule
