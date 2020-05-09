`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 17:49:22
// Design Name: 
// Module Name: MEM_dm_addr
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


module MEM_dm_addr(
            input memwrite,full,half,byte,
            input [1:0] addr,
            input [31:0] din,
            output [31:0] dout,
            output [3:0] wen
    );
    
            assign wen = (memwrite == 1'b0)     ?       4'b0000     :
                                  (full == 1'b1)     ?       4'b1111     :
                                  (half == 1'b1 && addr == 2'b00)    ?       4'b0011    :
                                  (half == 1'b1 && addr == 2'b10)    ?       4'b1100    :
                                   (byte == 1'b1 && addr == 2'b00)   ?      4'b0001    :
                                   (byte == 1'b1 && addr == 2'b01)   ?      4'b0010    :
                                   (byte == 1'b1 && addr == 2'b10)   ?      4'b0100    :
                                   (byte == 1'b1 && addr == 2'b11)    ?      4'b1000    :    4'b0000;
                                   
            assign dout = (full == 1'b1)    ?   din :
                                   (half == 1'b1 && addr == 2'b00)   ?   {16'b0,din[15:0]}  :
                                   (half == 1'b1 && addr == 2'b10)   ?    {din[15:0],16'b0}  :
                                    (byte == 1'b1 && addr == 2'b00)   ?  {24'b0,din[7:0]}    :
                                   (byte == 1'b1 && addr == 2'b01)   ?    {16'b0,din[7:0],8'b0}    :
                                   (byte == 1'b1 && addr == 2'b10)   ?    {8'b0,din[7:0],16'b0}    :
                                   (byte == 1'b1 && addr == 2'b11)    ?    {din[7:0],24'b0}    :    32'b0;
endmodule
