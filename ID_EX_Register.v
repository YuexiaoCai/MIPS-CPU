`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/27 15:53:52
// Design Name: 
// Module Name: ID_EX_Register
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


module ID_EX_Register(
        input clk,reset,
        input stall,flush,
        input IDalusrc1,IDalusrc2,
        input [4:0] IDaluctr,
        input IDregdes,
        input IDmemwrite,
        input IDmemread,
        input IDregwrite,
        input IDbds,
        input IDhiread,IDhiwrite,
        input IDloread,IDlowrite,
        input IDcp0read,IDcp0write,
        input IDfull,IDhalf,IDbyte,
        input IDsignload,
        input IDjback,
        input [1:0] IDt_new,
        input [8:0] IDexcept,
        input [31:0] IDpc,
        input [31:0] IDinstruct,
        input [31:0] IDbusA,
        input [31:0] IDbusB,
        input [31:0] IDimm,
        input [4:0] IDrs,
        input [4:0] IDrt,
        input [4:0] IDrd, 
        
        output EXalusrc1,EXalusrc2,
        output [4:0] EXaluctr,
        output EXregdes,
        output EXmemwrite,
        output EXmemread,
        output EXregwrite,
        output EXbds,
        output EXhiread,EXhiwrite,
        output EXloread,EXlowrite,
        output EXcp0read,EXcp0write,
        output EXfull,EXhalf,EXbyte,
        output EXsignload,
        output EXjback,
        output [1:0] EXt_new,
        output [8:0] EXexcept,
        output [31:0] EXpc,
        output [31:0] EXinstruct,
        output [31:0] EXbusA,
        output [31:0] EXbusB,
        output [31:0] EXimm,
        output [4:0] EXrs,
        output [4:0] EXrt,
        output [4:0] EXrd
    );
        reg alusrc1,alusrc2;
        reg [4:0] aluctr;
        reg regdes;
        reg memwrite;
        reg memread;
        reg regwrite;
        reg bds;
        reg hiread,hiwrite;
        reg loread,lowrite;
        reg cp0read,cp0write;
        reg full,half,byte;
        reg signload;
        reg jback;
        reg [1:0] t_new;
        reg [8:0] except;
        reg [31:0] pc;
        reg [31:0] instruct;
        reg [31:0] busA,busB,imm;
        reg [4:0]  rs;
        reg [4:0]  rt;
        reg [4:0]  rd;
        reg delay;

        always@(posedge clk)
                delay <= reset;
        
        always@(posedge clk)
        begin
        if(( reset == 1'b0) || flush == 1'b1)
            begin
            alusrc1=1'b0;
            alusrc2=1'b0;
            aluctr=5'b0;
            regdes=1'b0;
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
            t_new=2'b0;
            except=9'b0;
            pc=32'b0;
            instruct = 32'b0;
            busA=32'b0;
            busB=32'b0;
            imm=32'b0;
            rs=5'b0;
            rt=5'b0;
            rd=5'b0;
            end
        else if (stall == 1'b0)
            begin
            alusrc1          <= IDalusrc1;
            alusrc2         <= IDalusrc2;
            aluctr           <= IDaluctr;
            regdes         <= IDregdes;
            memwrite    <= IDmemwrite;
            memread   <= IDmemread;
            regwrite       <= IDregwrite;
            bds<=IDbds;
            hiread<=IDhiread;
            hiwrite<=IDhiwrite;
            loread<=IDloread;
            lowrite<=IDlowrite;
            cp0read<=IDcp0read;
            cp0write<=IDcp0write;
            full<=IDfull;
            half<=IDhalf;
            byte<=IDbyte;
            signload<=IDsignload;
            jback <= IDjback;
            t_new<=IDt_new;
            except<=IDexcept;
            pc<=IDpc;
            instruct <= IDinstruct;
            busA             <= IDbusA;
            busB              <= IDbusB;
            imm              <=  IDimm;
            rs                   <= IDrs;
            rt                    <= IDrt;
            rd                   <= IDrd;
            end
        end
        
        assign EXalusrc1 = alusrc1;
        assign EXalusrc2 = alusrc2;
        assign EXaluctr = aluctr;
        assign EXregdes = regdes;
        assign EXmemwrite = memwrite;
        assign EXmemread = memread;
        assign EXregwrite = regwrite;
        assign EXbds = bds;
        assign EXhiread = hiread;
        assign EXhiwrite = hiwrite;
        assign EXloread = loread;
        assign EXlowrite = lowrite;
        assign EXcp0read = cp0read;
        assign EXcp0write = cp0write;
        assign EXfull = full;
        assign EXhalf = half;
        assign EXbyte = byte;
        assign EXsignload = signload;
        assign EXjback = jback;
        assign EXt_new = t_new;
        assign EXexcept = except;
        assign EXpc = pc;
        assign EXinstruct = instruct;
        assign EXbusA = busA;
        assign EXbusB = busB;
        assign EXimm = imm;
        assign EXrs = rs;
        assign EXrt = rt;
        assign EXrd = rd;
        
endmodule
