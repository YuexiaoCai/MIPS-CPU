`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/18 21:07:50
// Design Name: 
// Module Name: LO
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


module LO(
            input clk,reset,
            input lowrite,
            input [31:0] din,
            output [31:0] dout
    );
            
            reg delay;
            reg [31:0] lo;
            
            always@(posedge clk)
                    delay <= reset;
                    
            always@(posedge clk)
            begin
                    if(reset ==1'b0)
                    begin
                            lo <= 32'b0;
                    end
                    else if(lowrite == 1'b1)
                    begin
                            lo <= din;
                    end
            end
            
            assign dout = lo;

endmodule
