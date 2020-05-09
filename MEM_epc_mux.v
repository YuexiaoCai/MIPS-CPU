`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 20:48:21
// Design Name: 
// Module Name: MEM_epc_mux
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


module MEM_epc_mux(
                input [31:0] epc,
                input [8:0] except,
                output [31:0] realepc
    );
    
            assign realepc = (except[0] == 1'b1)    ?   epc     :       32'hbfc0_0380;
endmodule
