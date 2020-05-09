`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 16:27:03
// Design Name: 
// Module Name: EX_MEM_Register
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


module EX_MEM_Register(
        input clk,reset,
        input stall,flush,
        input EXmemwrite,
        input EXmemread,
        input EXregwrite,
        input EXbds,
        input EXhiwrite,EXhiread,
        input EXlowrite,EXloread,
        input EXcp0write,EXcp0read,
        input EXfull,EXhalf,EXbyte,
        input EXsignload,
        input EXjback,
        input EXalusrc2,
        input [1:0] EXt_new,
        input [8:0] EXexcept,
        input [31:0] EXpc,
        input [31:0] EXhi,
        input [31:0] EXlo,
        input [31:0] EXaluresult,
        input [31:0] EXdata,
        input [4:0] EXwbadd,EXrs,EXrt,EXrd,
        
        output MEMmemwrite,
        output MEMmemread,
        output MEMregwrite,
        output MEMbds,
        output MEMhiwrite,MEMhiread,
        output MEMlowrite,MEMloread,
        output MEMcp0write,MEMcp0read,
        output MEMfull,MEMhalf,MEMbyte,
        output MEMsignload,
        output MEMjback,
        output MEMalusrc2,
        output [1:0] MEMt_new,
        output [8:0] MEMexcept,
        output [31:0] MEMpc,
        output [31:0] MEMhi,
        output [31:0] MEMlo,
        output [31:0] MEMaluresult,
        output [31:0] MEMdata,
        output [4:0] MEMwbadd,MEMrs,MEMrt,MEMrd
    );
    
        reg memwrite;
        reg memread;
        reg regwrite;
        reg bds;
        reg hiwrite,hiread;
        reg lowrite,loread;
        reg cp0write,cp0read;
        reg full,half,byte;
        reg signload;
        reg jback;
        reg alusrc2;
        reg [1:0]t_new;
        reg [8:0] except;
        reg [31:0] pc;
        reg [31:0] hi;
        reg [31:0] lo;
        reg [31:0] aluresult;
        reg [31:0] data;
        reg [4:0] wbadd,rs,rt,rd;
        reg delay;
        
      
        
        always@(posedge clk)
            delay <= reset;
        
        always@(posedge clk)
        begin
            if((reset == 1'b0) || flush == 1'b1)
            begin
                memwrite=1'b0;
                memread=1'b0;
                regwrite=1'b0;
                bds=1'b0;
            hiread=1'b0;
            hiwrite=1'b0;
            loread=1'b0;
            lowrite=1'b0;
            cp0read=1'b0;
            cp0write=1'b0;
            full=1'b0;
            half=1'b0;
            byte=1'b0;
            signload=1'b0;
            jback = 1'b0;
            alusrc2 = 1'b0;
            t_new=2'b0;
            except=9'b0;
            pc=32'b0;
            hi=32'b0;
            lo=32'b0;
                aluresult=32'b0;
                data=32'b0;
                wbadd=5'b0;
                rs=5'b0;
                rt=5'b0;
                rd=5'b0;
            end
            else if(stall == 1'b0)
            begin
                memwrite <= EXmemwrite;
                memread <= EXmemread;
                regwrite <= EXregwrite;
                bds <= EXbds;
            hiread <= EXhiread;
            hiwrite <= EXhiwrite;
            loread <= EXloread;
            lowrite <= EXlowrite;
            cp0read <= EXcp0read;
            cp0write <= EXcp0write;
            full <= EXfull;
            half <= EXhalf;
            byte <= EXbyte;
            signload <= EXsignload;
            jback <= EXjback;
            alusrc2 <= EXalusrc2;
            t_new <= EXt_new;
            except <= EXexcept;
            pc <= EXpc;
            hi <= EXhi;
            lo <= EXlo;
                aluresult <= EXaluresult;
                data <= EXdata;
                wbadd <= EXwbadd;
                rs <= EXrs;
                rt <= EXrt;
                rd <= EXrd;
            end
        end
        
        assign MEMmemwrite = memwrite;
        assign MEMmemread = memread;
        assign MEMregwrite = regwrite;
        assign MEMbds = bds;
        assign MEMhiread = hiread;
        assign MEMhiwrite = hiwrite;
        assign MEMloread = loread;
        assign MEMlowrite = lowrite;
        assign MEMcp0read = cp0read;
        assign MEMcp0write = cp0write;
        assign MEMfull = full;
        assign MEMhalf = half;
        assign MEMbyte = byte;
        assign MEMsignload = signload;
        assign MEMjback = jback;
        assign MEMalusrc2 = alusrc2;
        assign MEMt_new = t_new;
        assign MEMexcept = except;
        assign MEMpc = pc;
        assign MEMhi = hi;
        assign MEMlo = lo;
        assign MEMaluresult = aluresult;
        assign MEMdata = data;
        assign MEMwbadd = wbadd;
        assign MEMrs = rs;
        assign MEMrt = rt;
        assign MEMrd = rd;
        
endmodule
