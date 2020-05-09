`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/18 20:30:26
// Design Name: 
// Module Name: DM_busy
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


module DM_busy(
            input [31:0] pc,
            input clk,reset,
            input memread,memwrite,
            output busy
    );
            reg [31:0] pre_pc;    
            reg delay;
            
            always@(posedge clk)
                    delay <= reset;
                    
            always@(posedge clk)
            begin
                    if( reset == 1'b0)
                    begin
                            pre_pc = 32'b0;
                    end
                    else
                    begin
                            pre_pc <= pc;
                    end
            end
            
            assign busy = (memread == 1'b1 || memwrite == 1'b1)     ?      
                                   ((pre_pc == pc)       ?       1'b0        :       1'b1)      :       1'b0;
endmodule
