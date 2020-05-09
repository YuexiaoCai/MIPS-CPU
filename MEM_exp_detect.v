`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 18:38:29
// Design Name: 
// Module Name: MEM_exp_detect
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


module MEM_exp_detect(
            input [31:0] pc,dm_add,
            input [31:0] in_epc,
            input [31:0] in_badvaddr,
            input [31:0] in_status,
            input [31:0] in_cause,
            input [36:0] in_temp,
            input [8:0] in_except,
            input bds,
            
            output reg is_exp,
            output reg expwrite,
            output reg [31:0] out_epc,
            output reg [31:0] out_badvaddr,
            output reg [31:0] out_status,
            output reg [31:0] out_cause 
    );
            wire status_exl = in_status[1];
            wire status_ie = in_status[0];
            wire status_im1 = in_status[9];
            wire status_im0 = in_status[8];
            wire cause_ip1 = in_cause[9];
            wire cause_ip0 = in_cause[8];
            wire [31:0] realepc;
            
            assign realepc = (bds == 1'b1)  ?   pc-8    :   pc-4;    
            
            always@(*)
            begin
                    if(status_exl == 1'b0 && status_ie == 1'b1 &&cause_ip1 == 1'b1 &&status_im1 == 1'b1 && pc!=32'b0)
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            out_epc = pc-4;
                            out_badvaddr = in_badvaddr;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {1'b0,in_cause[30:7],5'b00000,in_cause[1:0]};
                    end
                    else if(status_exl == 1'b0 && status_ie == 1'b1 &&cause_ip0 == 1'b1 &&status_im0 == 1'b1 && pc!=32'b0)
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            out_epc = pc-4;
                            out_badvaddr = in_badvaddr;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {1'b0,in_cause[30:7],5'b00000,in_cause[1:0]};
                    end
                    else if(status_exl == 1'b0 && in_except[7] == 1'b1)   //inst
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            if(bds == 1'b1)
                                    out_epc = pc-8;
                            else
                                    out_epc = pc-4;
                            out_badvaddr = pc-4;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {bds,in_cause[30:7],5'b00100,in_cause[1:0]};
                    end
                    else if(status_exl == 1'b0 && in_except[6] == 1'b1)  // no ask
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            
                            if(bds == 1'b1)
                                    out_epc = pc-8;
                            else
                                    out_epc = pc-4;
                            out_badvaddr = in_badvaddr;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {bds,in_cause[30:7],5'b01010,in_cause[1:0]};
                    end
                    else if(status_exl == 1'b0 && in_except[5] == 1'b1)  //over flow
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            if(bds == 1'b1)
                                    out_epc = pc-8;
                            else
                                    out_epc = pc-4;
                            out_badvaddr = in_badvaddr;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {bds,in_cause[30:7],5'b01100,in_cause[1:0]};
                    end
                    else if(status_exl == 1'b0 && in_except[3] == 1'b1 )//syscall
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            
                            if(bds == 1'b1)
                                    out_epc = pc-8;
                            else
                                    out_epc = pc-4;
                            out_badvaddr = in_badvaddr;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {bds,in_cause[30:7],5'b01000,in_cause[1:0]};
                    end
                    else if(status_exl == 1'b0 && in_except[8] == 1'b1)//break
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            if(bds == 1'b1)
                                    out_epc = pc-8;
                            else
                                    out_epc = pc-4;
                            out_badvaddr = in_badvaddr;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {bds,in_cause[30:7],5'b01001,in_cause[1:0]};
                    end
                    else if(status_exl == 1'b0 && in_except[2] == 1'b1)//data_read
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            if(bds == 1'b1)
                                    out_epc = pc-8;
                            else
                                    out_epc = pc-4;
                            out_badvaddr = dm_add;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {bds,in_cause[30:7],5'b00100,in_cause[1:0]};
                    end
                    else if(status_exl == 1'b0 && in_except[1] == 1'b1)//data_write
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            if(bds == 1'b1)
                                    out_epc = pc-8;
                            else
                                    out_epc = pc-4;
                            out_badvaddr = dm_add;
                            out_status = {in_status[31:2],1'b1,in_status[0]};
                            out_cause = {bds,in_cause[30:7],5'b00101,in_cause[1:0]};
                    end
                    else if(in_except[0] == 1'b1)//eret
                    begin
                            is_exp = 1'b1;
                            expwrite = 1'b1;
                            out_epc = in_epc;
                            out_badvaddr = in_badvaddr;
                            out_status = {in_status[31:2],1'b0,in_status[0]};
                            out_cause = in_cause;
                    end
                    else
                    begin
                            is_exp = 1'b0;
                            expwrite = 1'b0;
                    end
            end
endmodule
