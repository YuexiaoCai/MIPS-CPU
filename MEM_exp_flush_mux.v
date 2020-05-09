`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 11:00:50
// Design Name: 
// Module Name: MEM_exp_flush_mux
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


module MEM_exp_flush_mux(
            input EXmemwrite,EXregwrite,EXhiwrite,EXlowrite,EXcp0write,
            input is_exp,
            output rmemwrite,rregwrite,rhiwrite,rlowrite,rcp0write
    );
    
            assign rmemwrite = (is_exp == 1'b1)     ?       1'b0        :       EXmemwrite;
            assign rregwrite = (is_exp == 1'b1)     ?       1'b0        :       EXregwrite;
            assign rhiwrite = (is_exp == 1'b1)     ?       1'b0        :       EXhiwrite;
            assign rlowrite = (is_exp == 1'b1)     ?       1'b0        :       EXlowrite;
            assign rcp0write = (is_exp == 1'b1)     ?       1'b0        :       EXcp0write;
endmodule
