`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 20:45:24
// Design Name: 
// Module Name: CMP
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


module CMP(
            input [31:0] din1,din2,
            input [2:0] cmpctr,
            output branch_used
    );
    
            wire signed [31:0] d1,d2;
            assign d1 = din1;
            assign d2 = din2;
            
            assign branch_used = (cmpctr == 3'b000)     ?      ( (din1 == din2)      ?       1'b1        :      1'b0)       :
                                               (cmpctr == 3'b001)      ?     (  (din1 == din2)      ?       1'b0        :     1'b1)        :
                                               (cmpctr == 3'b010)      ?     (  (d1 < 0)                ?       1'b0        :      1'b1)        :
                                               (cmpctr == 3'b011)       ?     (  (d1 > 0)               ?       1'b1         :       1'b0)      :
                                               (cmpctr == 3'b100)       ?     (  (d1 >0)                ?       1'b0        :       1'b1)       :
                                               (cmpctr == 3'b101)       ?     (  (d1 < 0)               ?        1'b1        :       1'b0)      :
                                               (cmpctr == 3'b110)       ?     (  (d1 < 0)               ?        1'b0       :       1'b1)       :
                                                                                          (  (d1 < 0)               ?         1'b1       :       1'b0) ;
                                                                                          
endmodule
