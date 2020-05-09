`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/18 20:56:12
// Design Name: 
// Module Name: HI
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


module HI(
            input clk,reset,
            input hiwrite,
            input [31:0] din,
            output [31:0] dout
    );
            
            reg delay;
            reg [31:0] hi;
            
            always@(posedge clk)
                    delay <= reset;
                    
            always@(posedge clk)
            begin
                    if( reset ==1'b0)
                    begin
                            hi <= 32'b0;
                    end
                    else if(hiwrite == 1'b1)
                    begin
                            hi <= din;
                    end
            end
            
            assign dout = hi;
endmodule
