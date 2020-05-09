`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 16:48:14
// Design Name: 
// Module Name: MEM_WB_Register
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


module MEM_WB_Register(
        input clk,reset,
        input flush,stall,
        input MEMregwrite,
        input [31:0] MEMpc,
        input [31:0] MEMwbdata,
        input [4:0] MEMwbadd,
        
        output WBregwrite,
        output [31:0] WBpc,
        output [31:0] WBwbdata,
        output [4:0] WBwbadd
    );
    
        reg regwrite;
        reg [31:0] pc;
        reg [31:0] wbdata;
        reg [4:0] wbadd;
        reg delay;
        
        
        
        always@(posedge clk)
            delay <= reset;
        
        always@(posedge clk)
        begin
            if((reset == 1'b0) || flush == 1'b1)
            begin
                regwrite=1'b0;
                pc=32'b0;
                wbdata=32'b0;
                wbadd=5'b0;
            end
            else if(stall == 1'b0)
            begin
                regwrite <= MEMregwrite;
                pc<=MEMpc;
                wbdata <= MEMwbdata;
                wbadd <= MEMwbadd;
            end
        end
        
        assign WBregwrite = regwrite;
        assign WBpc = pc;
        assign WBwbdata = wbdata;
        assign WBwbadd = wbadd;
        
endmodule
