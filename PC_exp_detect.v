`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 19:12:00
// Design Name: 
// Module Name: PC_exp_detect
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


module PC_exp_detect(
            input [31:0]  pc,
            output reg [31:0] realpc,
            output reg [8:0] except,
            output reg wen
    );      
    
            always@(*)
            begin
                    case (pc[1:0])
                        2'b00:
                        begin
                                realpc = {3'b0,pc[28:0]};
                                except = 9'b0;
                                wen = 1'b1;
                        end
                        default:
                        begin
                                realpc = 32'hbfc0_0000;
                                except = 9'b0_1000_0000;
                                wen = 1'b0;
                        end
                    endcase
            end
    
endmodule
