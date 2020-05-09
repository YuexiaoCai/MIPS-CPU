`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 12:42:39
// Design Name: 
// Module Name: MEM_dm_detect
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


module MEM_dm_detect(
            input [8:0] in_except,
            input memread,memwrite,
            input [31:0] in_add,
            input full,half,byte,
            output [8:0] out_except
    );
    
            wire wrong;
            
            assign wrong = (full == 1'b1 && in_add[1:0] != 2'b00)       ?      1'b1     :
                                     (half == 1'b1 && in_add[0] != 1'b0)        ?       1'b1        :       1'b0;
             assign out_except = (wrong == 1'b0)    ?   in_except   :
                                             (memread == 1'b1)      ?       {in_except[8:3],1'b1,in_except[1:0]}     :
                                             (memwrite == 1'b1)     ?       {in_except[8:2],1'b1,in_except[0]}      :   in_except;
endmodule
