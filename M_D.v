`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  dx
// 
// Create Date: 2019/06/19 20:09:40
// Design Name: 
// Module Name: M_D
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


module M_D(
    input clk, reset,
    input [4:0] aluctr,
    input [31:0] din1, din2,
    input [31:0] pc,
    output [31:0] hi, lo,
    output complete
    );
    wire [63:0] D_S, M_S, D_US, M_US;
    wire divisor_tvalid;
    wire dividend_tvalid;
    wire complete_d_s;
    wire complete_d_u;
    reg [31:0] prepc;
    div_gen_0   d_signed(clk,  divisor_tvalid, din2, dividend_tvalid, din1, complete_d_s, D_S);
    div_unsigned    d_unsigned(clk,  divisor_tvalid, din2, dividend_tvalid, din1, complete_d_u, D_US);
    mult_gen_0      mult_signed(clk, din1, din2, M_S);
    mult_unsigned       m_unsigned(clk, din1, din2, M_US);
    assign hi = (aluctr==5'b00110) ? D_S[31:0] : //�з��ų�
                (aluctr==5'b00111) ? D_US[31:0]:              //�޷��ų���
                (aluctr==5'b01000) ? M_S[63:32] :       //�з��ų˷�
                M_US[63:32];
    assign lo =  (aluctr==5'b00110) ? D_S[63:32] : //�з��ų�
                (aluctr==5'b00111) ? D_US[63:32]:              //�޷��ų���
                (aluctr==5'b01000) ? M_S[31:0] :       //�з��ų˷�
                M_US[31:0];
    always@(posedge clk)
    begin
    if(reset == 1'b0)
            prepc <= 32'b0;
    end
    always @(posedge clk) begin
        prepc <= pc;
    end
    assign divisor_tvalid = (prepc!=pc && (aluctr==5'b00110 || aluctr==5'b00111)) ? 1 : 0;
    assign dividend_tvalid = divisor_tvalid;
    assign complete = (aluctr!=5'b00110 && aluctr!=5'b00111 && aluctr!=5'b01000 && aluctr!=5'b01001) ? 1 :
                      ((prepc==pc && aluctr==5'b01000) || (prepc==pc && aluctr==5'b01001)) ? 1 :
                      ((prepc==pc && aluctr==5'b00110 && complete_d_s )|| (prepc==pc && aluctr==5'b00111 && complete_d_u)) ? 1 : 0;
                //     ��ֻ���ǳ˳�����prepc!=pcʱҪ��ͣ ,�˳�������ʲôʱ����һ�����ڳ����
endmodule
