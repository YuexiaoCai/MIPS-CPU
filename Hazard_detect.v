`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/19 22:04:02
// Design Name: 
// Module Name: Hazard_detect
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


module Hazard_detect(
            input [1:0] t_rs,t_rt,EXt_new,MEMt_new,
            input [4:0] rs,rt,
            input [4:0] EX_wbadd,
            input EX_regwrite,
            input [4:0] MEM_wbadd,
            input MEM_regwrite,
            input IM_busy,DM_busy,finish,is_exp,
            output reg PC_stall,IFID_stall,IDEX_stall,EXMEM_stall,MEMWB_stall,
            output reg IFID_flush,IDEX_flush,EXMEM_flush,MEMWB_flush
    );
    
            always@(*)
            begin
                    if(is_exp == 1'b1)
                    begin
                            PC_stall = 1'b0;
                            IFID_stall = 1'b0;
                            IDEX_stall = 1'b0;
                            EXMEM_stall = 1'b0;
                            MEMWB_stall = 1'b0;
                            
                            IFID_flush = 1'b1;
                            IDEX_flush = 1'b1;
                            EXMEM_flush = 1'b1;
                            MEMWB_flush = 1'b1;
                    end       
                    else if(DM_busy == 1'b1)
                    begin
                            PC_stall = 1'b1;
                            IFID_stall = 1'b1;
                            IDEX_stall = 1'b1;
                            EXMEM_stall = 1'b1;
                            MEMWB_stall = 1'b1;
                            
                            IFID_flush = 1'b0;
                            IDEX_flush = 1'b0;
                            EXMEM_flush = 1'b0;
                            MEMWB_flush = 1'b0;
                    end
                    else if(finish == 1'b0)
                    begin
                            PC_stall = 1'b1;
                            IFID_stall = 1'b1;
                            IDEX_stall = 1'b1;
                            EXMEM_stall = 1'b1;
                            MEMWB_stall = 1'b1;
                            
                            IFID_flush = 1'b0;
                            IDEX_flush = 1'b0;
                            EXMEM_flush = 1'b0;
                            MEMWB_flush = 1'b0;
                    end     
                    else if(  ( (t_rs < EXt_new)&&(rs == EX_wbadd)&&(EX_regwrite == 1'b1) ) ||
                                (  (t_rt < EXt_new)&&(rt == EX_wbadd)&&(EX_regwrite == 1'b1) )    ) 
                    begin
                            PC_stall = 1'b1;
                            IFID_stall = 1'b1;
                            IDEX_stall = 1'b0;
                            EXMEM_stall = 1'b0;
                            MEMWB_stall = 1'b0;
                            
                            IFID_flush = 1'b0;
                            IDEX_flush = 1'b1;
                            EXMEM_flush = 1'b0;
                            MEMWB_flush = 1'b0;
                    end
                    else if(  ( (t_rs < MEMt_new)&&(rs == MEM_wbadd)&&(MEM_regwrite == 1'b1) ) ||
                                (  (t_rt < MEMt_new)&&(rt == MEM_wbadd)&&(MEM_regwrite == 1'b1) )    ) 
                    begin
                            PC_stall = 1'b1;
                            IFID_stall = 1'b1;
                            IDEX_stall = 1'b0;
                            EXMEM_stall = 1'b0;
                            MEMWB_stall = 1'b0;
                            
                            IFID_flush = 1'b0;
                            IDEX_flush = 1'b1;
                            EXMEM_flush = 1'b0;
                            MEMWB_flush = 1'b0;
                    end
                    else if(IM_busy == 1'b1)
                    begin
                            PC_stall = 1'b1;
                            IFID_stall = 1'b1;
                            IDEX_stall = 1'b0;
                            EXMEM_stall = 1'b0;
                            MEMWB_stall = 1'b0;
                            
                            IFID_flush = 1'b0;
                            IDEX_flush = 1'b1;
                            EXMEM_flush = 1'b0;
                            MEMWB_flush = 1'b0;
                    end
                    else
                    begin
                            PC_stall = 1'b0;
                            IFID_stall = 1'b0;
                            IDEX_stall = 1'b0;
                            EXMEM_stall = 1'b0;
                            MEMWB_stall = 1'b0;
                            
                            IFID_flush = 1'b0;
                            IDEX_flush = 1'b0;
                            EXMEM_flush = 1'b0;
                            MEMWB_flush = 1'b0;
                    end            
            end
endmodule



