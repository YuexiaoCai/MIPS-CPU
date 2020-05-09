`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 21:17:00
// Design Name: 
// Module Name: ID_bj_mux
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


module ID_bj_mux(
            input [31:0] pc,
            input [31:0] register,
            input [4:0] rd,
            input jump,branch,
            input [2:0] cmpctr,
            input jr,regwrite,
            output [4:0] realrd,
            output [31:0] busB
    );
    
            assign busB = (jump == 1'b1 || branch == 1'b1)  ?   pc+4    :   register;
            
            assign realrd = (branch == 1'b1 && cmpctr == 3'b110)    ?   5'd31   :
                                    (branch == 1'b1 && cmpctr == 3'b111)     ?   5'd31   :
                                    (jump == 1'b1 && jr == 1'b0)                   ?    5'd31   :   rd;
    
            
endmodule
