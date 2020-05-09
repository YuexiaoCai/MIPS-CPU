`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 17:57:13
// Design Name: 
// Module Name: MEM_dm_dout
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


module MEM_dm_dout(
            input [31:0] din,
            input [1:0] addr2,
            input full,half,byte,signload,
            output reg [31:0] dout
    );
    
            always@(*)
            begin
                    if(full == 1'b1)
                    begin
                            dout = din;
                    end
                    else if(half == 1'b1)
                    begin
                            case(signload)
                            1'b1    :
                            begin
                                    case(addr2)
                                    2'b10   :
                                    begin
                                            dout = {{16{din[31]}},din[31:16]};
                                    end
                                    2'b00   :
                                    begin
                                            dout = {{16{din[15]}},din[15:0]};
                                    end
                                    default :
                                    begin
                                            dout = 32'b0;
                                    end
                                    endcase
                            end
                            1'b0    :
                            begin
                                    case(addr2)
                                    2'b10   :
                                    begin
                                            dout = {{16'b0},din[31:16]};
                                    end
                                    2'b00   :
                                    begin
                                            dout = {{16'b0},din[15:0]};
                                    end
                                    default :
                                    begin
                                            dout = 32'b0;
                                    end
                                    endcase
                            end
                            endcase
                    end
                    else if(byte == 1'b1)
                    begin
                            case(signload)
                            1'b1    :
                            begin
                                    case(addr2)
                                    2'b11   :
                                    begin
                                            dout = {{24{din[31]}},din[31:24]};
                                    end
                                    2'b10   :
                                    begin
                                            dout = {{24{din[23]}},din[23:16]};
                                    end
                                    2'b01   :
                                    begin
                                            dout = {{24{din[15]}},din[15:8]};
                                    end
                                    2'b00   :
                                    begin
                                            dout = {{24{din[7]}},din[7:0]};
                                    end
                                    default :
                                    begin
                                            dout = 32'b0;
                                    end
                                    endcase
                            end
                            1'b0    :
                            begin
                                    case(addr2)
                                    2'b11   :
                                    begin
                                            dout = {{24'b0},din[31:24]};
                                    end
                                    2'b10   :
                                    begin
                                            dout = {{24'b0},din[23:16]};
                                    end
                                    2'b01   :
                                    begin
                                            dout = {{24'b0},din[15:8]};
                                    end
                                    2'b00   :
                                    begin
                                            dout = {{24'b0},din[7:0]};
                                    end
                                    default :
                                    begin
                                            dout = 32'b0;
                                    end
                                    endcase
                            end
                            endcase
                    end
            end
endmodule
