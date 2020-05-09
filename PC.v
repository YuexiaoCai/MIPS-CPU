`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 14:23:17
// Design Name: 
// Module Name: PC
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


module PC(
        input clk,
        input reset,
        input [31:0] npc,
        input busy,
        input pc_stall,
        input is_exp,
        output [31:0] pc
    );
    
        reg [31:0] mpc;
        reg delay;
        
        always@(posedge clk)
                delay <= reset;
                
        always @(posedge clk)
        begin
            if(reset == 1'b0)
                    begin
                        mpc <= 32'hbfc0_0000;
                    end
            else if(is_exp == 1'b1)
                    begin
                        mpc <= npc;
                    end
            else if(pc_stall == 1'b0 && busy == 1'b0)
                    begin
                        mpc <= npc;    
                    end        
        end
        
        assign pc = mpc;
endmodule
