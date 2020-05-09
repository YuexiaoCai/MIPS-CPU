`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 14:55:41
// Design Name: 
// Module Name: IF_ID_Register
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


module IF_ID_Register(
    input clk,reset,
    input stall,flush,
    input IDbranch,IDjump,
    input [31:0] IFpc,
    input [31:0] IFinstruct,
    input [8:0] IFexcept,
    output IDbds,
    output [31:0] IDpc,
    output [31:0] IDinstruct,
    output [8:0] IDexcept
    );
    
    reg [31:0] pc;
    reg [31:0] instruct;    
    reg [8:0]  except;
    reg delay;
    reg bds;
    
    always@(posedge clk)
            delay <= reset;
    
    always@(posedge clk)
    begin
        if(( reset == 1'b0) || flush == 1'b1)
        begin
            bds = 1'b0;
            pc = 32'b0;
            instruct = 32'b0;
            except = 8'b0;
        end
        else if (stall == 1'b0)
        begin
            bds <= (IDbranch==1'b1 || IDjump == 1'b1);
            pc <= IFpc;
            instruct <= IFinstruct;
            except <= IFexcept;
        end
    end
    
    assign IDbds = bds;
    assign IDpc = pc;
    assign IDinstruct = instruct;
    assign IDexcept = except;
    
endmodule
