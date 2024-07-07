`timescale 1ns / 1ns
//****************************************VSCODE PLUG-IN**********************************// 
//---------------------------------------------------------------------------------------- 
// IDE :                   VSCODE      
// VSCODE plug-in version: Verilog-Hdl-Format-2.4.20240526
// VSCODE plug-in author : Jiang Percy 
//---------------------------------------------------------------------------------------- 
//****************************************Copyright (c)***********************************// 
// Copyright(C)            xlx_fpga
// All rights reserved      
// File name:               
// Last modified Date:     2024/07/04 13:52:07 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             xlx_fpga
// Created date:           2024/07/04 13:52:07 
// Version:                V1.0 
// TEXT NAME:              fifo.v 
// PATH:                   E:\3.xlx_fpga\3.fifo\rtl\fifo.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module fifo(
    input                                       clk                  
                 
);

    wire                                        clkout_50M          ;
    wire                                        clkout_100M         ;
    wire                                        reset_1             ;
    wire                                        reset_2             ;

 
    wire                                        wr_en               ;
    wire               [7: 0]                   wr_data             ;
    wire                                        almost_full         ;
    wire                                        full                ;

    wire                                        rd_en               ;
    wire               [7: 0]                   rd_data             ;
    wire                                        empty               ;
    wire                                        almost_empty        ;






fofo_rd u_fofo_rd(
    .clk_50M                                    (clkout_50M         ),
    .rst                                        (reset_1            ),
    .almost_full                                (almost_full        ),
    .almost_empty                               (almost_empty       ),
    .rd_data                                    (rd_data            ),
    .rd_en                                      (rd_en              ) 
);

fifo_wr u_fifo_wr(
    .clk_100m                                   (clkout_100M        ),
    .rst                                        (reset_2            ),
    .empty                                      (empty              ),
    .almost_full                                (almost_full        ),
    .wr_en                                      (wr_en              ),
    .wr_data                                    (wr_data            ) 
);

clock_reset u_clock_reset(
    .clkin_50M                                  (clk                ),
    .clkout_50M                                 (clkout_50M         ),
    .clkout_100M                                (clkout_100M        ),
    .reset_1                                    (reset_1            ),
    .reset_2                                    (reset_2            ) 
);

fifo_w8x16d fifo_w8x16d (
    .rst                                        (reset_1            ),// input wire rst
    .wr_clk                                     (clkout_100M        ),// input wire wr_clk
    .rd_clk                                     (clkout_50M         ),// input wire rd_clk
    .din                                        (wr_data            ),// input wire [7 : 0] din
    .wr_en                                      (wr_en              ),// input wire wr_en
    .rd_en                                      (rd_en              ),// input wire rd_en
    .dout                                       (rd_data            ),// output wire [7 : 0] dout
    .full                                       (full               ),// output wire full
    .almost_full                                (almost_full        ),// output wire almost_full
    .empty                                      (empty              ),// output wire empty
    .almost_empty                               (almost_empty       ) // output wire almost_empty
);
        endmodule

