`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/18 21:10:08
// Design Name: 
// Module Name: CP0
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


module CP0(
            input clk,reset,
            input write,expwrite,
            
            input [31:0] din,
            input [4:0] rd,
            
            input [31:0] in_epc,
            input [31:0] in_badvaddr,
            input [31:0] in_status,
            input [31:0] in_cause,
            
            
            output reg [31:0] dout,
            
            output [31:0] out_epc,
            output [31:0] out_badvaddr,
            output [31:0] out_status,
            output [31:0] out_cause,
            output [36:0] out_temp
    );      
            
            reg delay;
            reg [31:0] CP0_BadVAddr;
            reg [31:0] CP0_Count;
            reg [31:0] CP0_Status;
            reg [31:0] CP0_Cause;
            reg [31:0] CP0_EPC;
            reg [36:0] CP0_temp;
            
            
            always @(posedge clk)
            begin
                    delay <= reset;
            end
            
            always@(posedge clk)
            begin
                    if( reset ==1'b0)
                    begin
                            CP0_BadVAddr=32'b0;
                            CP0_Count=32'b0;
                            CP0_Status={{9'b0},1'b1,{22'b0}};
                            CP0_Cause=32'b0;
                            CP0_EPC=32'b0;
                            CP0_temp = 32'b0;
                    end
                    else if(write == 1'b1)
                    begin
                            case(rd)
                                5'd8    :   CP0_BadVAddr <= din;
                                5'd9    :   CP0_Count <= din;
                                5'd12   :   CP0_Status <= din;
                                5'd13   :   CP0_Cause <= din;
                                5'd14   :   CP0_EPC <= din;
                            endcase
                    end
                    else if(expwrite == 1'b1)
                    begin
                            CP0_BadVAddr <= in_badvaddr;
                            CP0_Status <= in_status;
                            CP0_Cause <= in_cause;
                            CP0_EPC <= in_epc;
                            CP0_temp <= {in_epc,in_cause[6:2]};
                    end
            end
            
            
            always@(*)
            begin
                    case (rd)
                            5'd8    :   dout = CP0_BadVAddr;
                            5'd9    :   dout = CP0_Count;
                            5'd12   :   dout = CP0_Status;
                            5'd13   :   dout = CP0_Cause;
                            5'd14   :   dout = CP0_EPC;
                    endcase
            end
            
            assign out_epc = CP0_EPC;
            assign out_badvaddr = CP0_BadVAddr;
            assign out_status = CP0_Status;
            assign out_cause = CP0_Cause;
            assign out_temp = CP0_temp;
endmodule
