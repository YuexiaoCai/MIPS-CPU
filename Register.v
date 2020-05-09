`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 19:23:12
// Design Name: 
// Module Name: Register
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


module Register(
        input clk,reset,
        input [4:0] read1,read2,
        input [4:0] write,
        input [31:0] wdata,
        input we,
        output  [31:0] busA,busB,r31
        );
        
        reg[31:0] register[31:0];
        
        initial
            register[0]=32'b0;
            
        
        assign busA = register[read1];
        assign busB = register[read2]; 
        assign r31    = register[5'b11111];
        
        always@(negedge reset)
                register[0] = 32'b0;
                
        always@(posedge clk)
        begin
            if( we && (write!=5'b00000))
                register[write]<=wdata;
        end
        
endmodule
