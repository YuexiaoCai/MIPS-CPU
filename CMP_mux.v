`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 20:14:39
// Design Name: 
// Module Name: CMP_mux
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


module CMP_mux(
            input [31:0] register,
            input [31:0] id_ex,
            input [31:0] ex_mem,
            input [31:0] mem_wb,
            input [1:0] cmpsrc,
            output reg [31:0] dout
    );
            
            always@(*)
            begin
                    case(cmpsrc)
                            2'b00:
                            begin
                                    dout = register;
                            end
                            2'b01:
                            begin
                                    dout = id_ex;
                            end
                            2'b10:
                            begin
                                    dout = ex_mem;
                            end
                            2'b11:
                            begin
                                    dout = mem_wb;
                            end
                    endcase
            end
    
endmodule





