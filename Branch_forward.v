`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 20:34:13
// Design Name: 
// Module Name: Branch_forward
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


module Branch_forward(
            input [4:0] EXwbadd,
            input EXregwrite,
            input [4:0] MEMwbadd,
            input MEMregwrite,
            input [4:0] WBwbadd,
            input WBregwrite,
            input [4:0] rs,rt,
            output reg [1:0] cmpsrc1,cmpsrc2
    );
    
            always@(*)
            begin
                    if(EXregwrite == 1'b1 && EXwbadd == rs)
                    begin
                            cmpsrc1 = 2'b01;
                    end
                    else if(MEMregwrite == 1'b1 && MEMwbadd == rs)
                    begin
                            cmpsrc1 = 2'b10;
                    end
                    else if(WBregwrite == 1'b1 && WBwbadd == rs)
                    begin
                            cmpsrc1 = 2'b11;
                    end
                    else
                    begin
                            cmpsrc1 = 2'b00;
                    end
            end
            
            
            always@(*)
            begin
                    if(EXregwrite == 1'b1 && EXwbadd == rt)
                    begin
                            cmpsrc2 = 2'b01;
                    end
                    else if(MEMregwrite == 1'b1 && MEMwbadd == rt)
                    begin
                            cmpsrc2 = 2'b10;
                    end
                    else if(WBregwrite == 1'b1 && WBwbadd == rt)
                    begin
                            cmpsrc2 = 2'b11;
                    end
                    else
                    begin
                            cmpsrc2 = 2'b00;
                    end
            end
endmodule





