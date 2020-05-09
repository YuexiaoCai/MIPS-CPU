`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 14:39:33
// Design Name: 
// Module Name: mycpu_top
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


module mycpu_top(
            input clk,
            input resetn,
            input [5:0] int,
            
            output inst_sram_en,
            output [3:0] inst_sram_wen,
            output [31:0] inst_sram_addr,
            output [31:0] inst_sram_wdata,
            input [31:0] inst_sram_rdata,
            
            output data_sram_en,
            output [3:0] data_sram_wen,
            output [31:0] data_sram_addr,
            output [31:0] data_sram_wdata,
            input [31:0] data_sram_rdata,
            
            output [31:0] debug_wb_pc,
            output [3:0] debug_wb_rf_wen,
            output [4:0] debug_wb_rf_wnum,
            output [31:0] debug_wb_rf_wdata
    );
    
            
            wire flag;
            
            
            wire [31:0] IF_pc4;
            wire [31:0] IF_pc;
            wire [31:0] IF_npc;
            wire [31:0] IF_realpc;
            wire IF_busy;
            wire IF_PC_stall;
            wire [8:0] IF_except;
            
            
            wire IF_ID_stall;
            wire IF_ID_flush;
            
            wire [31:0] ID_npc;
            wire ID_is_branch;
            wire ID_branch;
            wire ID_jump;
            wire ID_bds;
            wire [31:0] ID_pc;
            wire [31:0] ID_instruct;
            wire [8:0] ID_except;
            wire ID_regdes,ID_memread,ID_memwrite,ID_alusrc1,ID_alusrc2,ID_signextend,ID_regwrite;
            wire [2:0] ID_branch_ctr;
            wire ID_jr,ID_hiread,ID_hiwrite,ID_loread,ID_lowrite,ID_cp0read,ID_cp0write;
            wire ID_full,ID_half,ID_byte;
            wire ID_signload;
            wire [1:0] ID_T_rs,ID_T_rt,ID_T_new;
            wire [8:0] ID_real_except;
            wire [4:0] ID_aluctr;
            wire ID_jback;
            wire [31:0] ID_busA,ID_busB;
            wire [31:0] ID_imm;
            wire [31:0] ID_r31;
            wire [31:0] ID_cmp_din1,ID_cmp_din2;
            wire ID_branch_used;
            wire [1:0] ID_cmpctr1,ID_cmpctr2;
            wire [4:0] ID_realrd;
            wire [31:0] ID_real_busB;
            
            
            wire ID_EX_stall;
            wire ID_EX_flush;
            
            
            wire [31:0] EX_busA,EX_busB,EX_imm;
            wire [4:0] EX_wbadd;
            wire EX_regwrite;
            wire EX_alusrc1,EX_alusrc2;
            wire [4:0] EX_aluctr;
            wire EX_regdes,EX_memwrite,EX_memread,EX_bds;
            wire EX_hiread,EX_hiwrite;
            wire EX_loread,EX_lowrite;
            wire EX_cp0read,EX_cp0write;
            wire EX_full,EX_half,EX_byte,EX_signload;
            wire EX_jback;
            wire [1:0] EX_T_new,EX_real_T_new;
            wire [8:0] EX_except,EX_real_except;
            wire [31:0] EX_pc,EX_instruct;
            wire [4:0] EX_rs,EX_rt,EX_rd;
            wire [1:0] EX_mux3_src1,EX_mux3_src2;
            wire [31:0] EX_bridge1,EX_bridge2;
            wire [31:0] EX_alu_din1,EX_alu_din2;
            wire [31:0] EX_aluresult;
            wire EX_of;
            wire [31:0] EX_cal_hi,EX_cal_lo;
            wire EX_finish;
            wire [31:0] EX_hi,EX_lo;
            
            wire EX_MEM_stall,EX_MEM_flush;
            
            
            wire [31:0] MEM_realepc;
            wire MEM_is_exp;
            wire [31:0] MEM_alu_jb_data;
            wire [4:0] MEM_wbadd;
            wire MEM_regwrite; 
            wire MEM_memwrite,MEM_memread,MEM_bds;
            wire MEM_hiwrite,MEM_hiread,MEM_lowrite,MEM_loread,MEM_cp0write,MEM_cp0read;
            wire MEM_full,MEM_half,MEM_byte,MEM_signload;
            wire MEM_jback,MEM_alusrc2;
            wire [1:0] MEM_T_new,MEM_real_T_new;
            wire [8:0] MEM_except,MEM_real_except;
            wire [31:0] MEM_pc,MEM_hi,MEM_lo,MEM_aluresult,MEM_data;
            wire [4:0] MEM_rs,MEM_rt,MEM_rd;    
            wire [31:0] MEM_real_hi,MEM_real_lo;
            wire MEM_src;
            wire [31:0] MEM_hi_read,MEM_lo_read;
            wire MEM_real_memwrite,MEM_real_regwrite,MEM_real_hiwrite,MEM_real_lowrite,MEM_real_cp0write;
            wire [31:0] MEM_real_data;
            wire MEM_exp_write;
            wire [31:0] MEM_in_epc,MEM_in_badv,MEM_in_status,MEM_in_cause;
            wire [31:0] MEM_cp0_read;
            wire [31:0] MEM_out_epc,MEM_out_badv,MEM_out_status,MEM_out_cause;
            wire MEM_busy;
            wire [31:0] MEM_dm_read;
            wire [31:0] MEM_wbdata;
            wire [31:0] MEM_real_sw_data;
            wire [36:0] MEM_cp0_temp;
            
            wire MEM_WB_stall,MEM_WB_flush;
            
            wire [4:0] WB_wbadd;
            wire [31:0] WB_wbdata;
            wire [31:0] WB_pc;
            wire WB_regwrite; 
            
            
            PC_mux mod1(ID_npc,MEM_realepc,IF_pc4,MEM_is_exp,ID_is_branch,IF_npc);
            PC_add  mod2(IF_pc,IF_pc4);
            PC  mod3(clk,resetn,IF_npc,IF_busy,IF_PC_stall,MEM_is_exp,IF_pc);
            PC_exp_detect  mod4(IF_pc,IF_realpc,IF_except,inst_sram_en);      
            IM_busy   mod5(IF_pc,clk,resetn,IF_busy);
            
            assign inst_sram_wen = 4'b0;
            assign inst_sram_addr = IF_realpc;
            assign inst_sram_wdata = 32'b0;
            
            
           
            
            IF_ID_Register  mod6(clk,resetn,IF_ID_stall,IF_ID_flush,ID_branch,ID_jump,
                                                IF_pc4,inst_sram_rdata,IF_except,ID_bds,ID_pc,ID_instruct,ID_except);
            Center_ctr mod7 (ID_instruct,ID_except,ID_regdes,ID_jump,ID_branch,ID_memread,ID_memwrite,
                                        ID_alusrc1,ID_alusrc2,ID_signextend,ID_regwrite,ID_branch_ctr,ID_jr,ID_hiread,ID_hiwrite,
                                        ID_loread,ID_lowrite,ID_cp0read,ID_cp0write,ID_full,ID_half,ID_byte,ID_signload,ID_T_rs,ID_T_rt,
                                        ID_T_new,ID_real_except,ID_aluctr,ID_jback);
           
            Register  mod8 (clk,resetn,ID_instruct[25:21],ID_instruct[20:16],WB_wbadd,WB_wbdata,WB_regwrite,
                                      ID_busA,ID_busB,ID_r31);  
            Extend  mod9 (ID_instruct[15:0],ID_signextend,ID_imm);
            NPC  mod10  (ID_instruct,ID_pc,ID_cmp_din1,ID_jump,ID_branch,ID_jr,ID_npc);
            CMP  mod11  (ID_cmp_din1,ID_cmp_din2,ID_branch_ctr,ID_branch_used);
            
            assign ID_is_branch = (ID_jump == 1'b1 || (ID_branch==1'b1&&ID_branch_used == 1'b1) );
            
            CMP_mux  m1  (ID_busA,EX_busB,MEM_alu_jb_data,WB_wbdata,ID_cmpctr1,ID_cmp_din1);
            CMP_mux  m2  (ID_busB,EX_busB,MEM_alu_jb_data,WB_wbdata,ID_cmpctr2,ID_cmp_din2);
            Branch_forward  mod12 (EX_wbadd,EX_regwrite,MEM_wbadd,MEM_regwrite,WB_wbadd,WB_regwrite,
                                                    ID_instruct[25:21],ID_instruct[20:16],ID_cmpctr1,ID_cmpctr2);
            ID_bj_mux  mod13  (ID_pc,ID_busB,ID_instruct[15:11],ID_jump,ID_branch,ID_branch_ctr,ID_jr,ID_regwrite,ID_realrd,ID_real_busB);
            
            
            ID_EX_Register  mod14  (clk,resetn,ID_EX_stall,ID_EX_flush,ID_alusrc1,ID_alusrc2,ID_aluctr,ID_regdes,ID_memwrite,
                                                   ID_memread,ID_regwrite,ID_bds,ID_hiread,ID_hiwrite,ID_loread,ID_lowrite,ID_cp0read,ID_cp0write,
                                                   ID_full,ID_half,ID_byte,ID_signload,ID_jback,ID_T_new,ID_real_except,ID_pc,ID_instruct,ID_busA,ID_real_busB,
                                                   ID_imm,ID_instruct[25:21],ID_instruct[20:16],ID_realrd,EX_alusrc1,EX_alusrc2,EX_aluctr,EX_regdes,EX_memwrite,EX_memread,EX_regwrite,EX_bds,
                                                   EX_hiread,EX_hiwrite,EX_loread,EX_lowrite,EX_cp0read,EX_cp0write,EX_full,EX_half,EX_byte,EX_signload,EX_jback,EX_T_new,EX_except,
                                                   EX_pc,EX_instruct,EX_busA,EX_busB,EX_imm,EX_rs,EX_rt,EX_rd);
                                                   
            assign EX_real_T_new = (EX_T_new > 2'b01)   ?   EX_T_new - 2'b01    :   2'b00   ;
            
            EX_wb_mux mod15 (EX_rt,EX_rd,EX_regdes,EX_wbadd);
            
            ALU_forward  mod16 (EX_rs,EX_rt,MEM_wbadd,WB_wbadd,MEM_regwrite,WB_regwrite,EX_jback,EX_mux3_src1,EX_mux3_src2);
            ALU_for_mux  mm1   (EX_busA,MEM_alu_jb_data,WB_wbdata,EX_mux3_src1,EX_bridge1);
            ALU_for_mux  mm2   (EX_busB,MEM_alu_jb_data,WB_wbdata,EX_mux3_src2,EX_bridge2);
            ALU_func_mux mm3  (EX_bridge1,EX_imm,EX_alusrc1,EX_alu_din1);
            ALU_func_mux mm4  (EX_bridge2,EX_imm,EX_alusrc2,EX_alu_din2);
            ALU_57   mod17  (EX_alu_din1,EX_alu_din2,EX_aluctr,EX_aluresult,EX_of);
            EX_of_detect  mod18 (EX_except,EX_instruct,EX_of,EX_real_except);
            M_D mod19  (clk,resetn,EX_aluctr,EX_alu_din1,EX_alu_din2,EX_pc,EX_cal_hi,EX_cal_lo,EX_finish);
            EX_hi_mux  mod20 (EX_alusrc2,EX_cal_hi,EX_bridge1,EX_hi);
            EX_lo_mux  mod21  (EX_alusrc2,EX_cal_lo,EX_bridge1,EX_lo);
            
            
            EX_MEM_Register  mod22 (clk,resetn,EX_MEM_stall,EX_MEM_flush,EX_memwrite,EX_memread,EX_regwrite,EX_bds,
                                                        EX_hiwrite,EX_hiread,EX_lowrite,EX_loread,EX_cp0write,EX_cp0read,EX_full,EX_half,EX_byte,EX_signload,
                                                        EX_jback,EX_alusrc2,EX_real_T_new,EX_real_except,EX_pc,EX_hi,EX_lo,EX_aluresult,EX_bridge2,
                                                        EX_wbadd,EX_rs,EX_rt,EX_rd,
                                                        MEM_memwrite,MEM_memread,MEM_regwrite,MEM_bds,MEM_hiwrite,MEM_hiread,MEM_lowrite,MEM_loread,
                                                        MEM_cp0write,MEM_cp0read,MEM_full,MEM_half,MEM_byte,MEM_signload,MEM_jback,MEM_alusrc2,MEM_T_new,
                                                        MEM_except,MEM_pc,MEM_hi,MEM_lo,MEM_aluresult,MEM_data,MEM_wbadd,MEM_rs,MEM_rt,MEM_rd);
            assign MEM_real_T_new = (MEM_T_new > 2'b01)   ?   MEM_T_new - 2'b01    :   2'b00   ;
            
            HI_LO_mux n1 (MEM_hi,WB_wbdata,MEM_src,MEM_real_hi);
            HI_LO_mux n2 (MEM_lo,WB_wbdata,MEM_src,MEM_real_lo);
            MEM_hi_lo_forward n3 (MEM_rs,WB_wbadd,WB_regwrite,MEM_alusrc2,MEM_src);
            HI  mod23 (clk,resetn,MEM_real_hiwrite,MEM_real_hi,MEM_hi_read);
            LO mod24 (clk,resetn,MEM_real_lowrite,MEM_real_lo,MEM_lo_read);
            MEM_alu_jb_mux mod25 (MEM_aluresult,MEM_data,MEM_jback,MEM_alu_jb_data);
            MEM_exp_flush_mux mod26 (MEM_memwrite,MEM_regwrite,MEM_hiwrite,MEM_lowrite,MEM_cp0write,MEM_is_exp,
                                                            MEM_real_memwrite,MEM_real_regwrite,MEM_real_hiwrite,MEM_real_lowrite,MEM_real_cp0write);
            MEM_rt_for_mux mod27 (MEM_data,WB_wbdata,MEM_rt,WB_wbadd,WB_regwrite,MEM_real_data);
            CP0  mod28 (clk,resetn,MEM_real_cp0write,MEM_exp_write,MEM_real_data,MEM_rd,
                                 MEM_in_epc,MEM_in_badv,MEM_in_status,MEM_in_cause,MEM_cp0_read,
                                 MEM_out_epc,MEM_out_badv,MEM_out_status,MEM_out_cause,MEM_cp0_temp);
            MEM_exp_detect mod29 (MEM_pc,MEM_aluresult,MEM_out_epc,MEM_out_badv,MEM_out_status,MEM_out_cause,MEM_cp0_temp,
                                                     MEM_real_except,MEM_bds,
                                                     MEM_is_exp,MEM_exp_write,
                                                     MEM_in_epc,MEM_in_badv,MEM_in_status,MEM_in_cause);
            MEM_dm_detect  mod30 (MEM_except,MEM_memread,MEM_memwrite,MEM_aluresult,
                                                      MEM_full,MEM_half,MEM_byte,MEM_real_except);
            DM_busy  mod31 (MEM_pc,clk,resetn,MEM_memread,MEM_real_memwrite,MEM_busy);
            MEM_dm_addr mod32 (MEM_real_memwrite,MEM_full,MEM_half,MEM_byte,MEM_aluresult[1:0],MEM_real_data,MEM_real_sw_data,data_sram_wen);
            assign data_sram_en = 1'b1;
            assign data_sram_addr = {3'b000,MEM_aluresult[28:2],2'b00};
            assign data_sram_wdata = MEM_real_sw_data;
            MEM_dm_dout mod33 (data_sram_rdata,MEM_aluresult[1:0], MEM_full,MEM_half,MEM_byte,MEM_signload,MEM_dm_read);
            MEM_epc_mux mod34 (MEM_out_epc,MEM_real_except,MEM_realepc);
            MEM_wb_mux mod35 (MEM_hi_read,MEM_lo_read,MEM_cp0_read,MEM_dm_read,MEM_data,MEM_aluresult,
                                                 MEM_hiread,MEM_loread,MEM_cp0read,MEM_memread,MEM_jback,MEM_wbdata);
            MEM_WB_Register mod36 (clk,resetn,MEM_WB_flush,MEM_WB_stall,MEM_real_regwrite,MEM_pc,MEM_wbdata,MEM_wbadd,
                                                         WB_regwrite,WB_pc,WB_wbdata,WB_wbadd);
            assign debug_wb_pc = WB_pc-4;
            assign debug_wb_rf_wnum = WB_wbadd;
            assign debug_wb_rf_wdata = WB_wbdata;
            WB_rewrite mn (clk,resetn,debug_wb_pc,WB_regwrite,debug_wb_rf_wen);
            
            Hazard_detect  mod37 (ID_T_rs,ID_T_rt,EX_real_T_new,MEM_real_T_new,
                                                  ID_instruct[25:21],ID_instruct[20:16],
                                                  EX_wbadd,EX_regwrite,
                                                  MEM_wbadd,MEM_real_regwrite,
                                                  IF_busy,MEM_busy,EX_finish,MEM_is_exp,
                                                  IF_PC_stall,IF_ID_stall,ID_EX_stall,EX_MEM_stall,MEM_WB_stall,
                                                  IF_ID_flush,ID_EX_flush,EX_MEM_flush,MEM_WB_flush);
            assign flag = (MEM_aluresult[15:0] == 16'hf02c)    ?   1'b1    :   1'b0;
            
            
endmodule





