`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 20:31:05
// Design Name: 
// Module Name: EX_of_detect
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


module EX_of_detect(
            input [8:0] in_except,
            input [31:0] instruct,
            input of,
            output [8:0] out_except
    );
            wire temp;
           
            assign temp = (of == 1'b0)      ?       1'b0    :
                                    (instruct[31:26] == 6'b0 && instruct [5:0] == 6'b100000)    ?   1'b1    :
                                    (instruct[31:26] == 6'b001000)      ?       1'b1        :
                                    (instruct[31:26] == 6'b0 && instruct [5:0] == 6'b100010)        ?   1'b1   :   1'b0;
            assign out_except = {in_except[8:6],temp,in_except[4:0]};
endmodule
