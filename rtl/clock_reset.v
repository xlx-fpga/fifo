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
// Last modified Date:     2024/07/04 14:05:14 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             xlx_fpga
// Created date:           2024/07/04 14:05:14 
// Version:                V1.0 
// TEXT NAME:              clock_reset.v 
// PATH:                   E:\3.xlx_fpga\3.fifo\rtl\clock_reset.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module clock_reset(
    input  wire                                 clkin_50M           ,
    output wire                                 clkout_50M          ,
    output wire                                 clkout_100M         ,
    output reg                                  reset_1             ,
    output reg                                  reset_2              
    );

    wire                                        locked              ;
    reg                [7: 0]                   cnt_1               ;
    reg                [7: 0]                   cnt_2               ;

    always @(posedge clkout_50M or  negedge locked) begin
            if(~locked) begin
                cnt_1 <= 8'd0;
                reset_1 <= 1'b1;
        end
            else if(cnt_1 <= 8'd200) begin
                cnt_1 <= cnt_1 + 1'b1;
                reset_1 <= 1'b1;
        end
            else begin
                cnt_1 <= cnt_1;
                reset_1 <= 1'b0;
        end
        end

    always @(posedge clkout_100M or  negedge locked) begin
            if(~locked) begin
                cnt_2 <= 8'd0;
                reset_2 <= 1'b1;
        end
            else if(cnt_2 <= 8'd200) begin
                cnt_2 <= cnt_2 + 1'b1;
                reset_2 <= 1'b1;
        end
            else begin
                cnt_2 <= cnt_2;
                reset_2 <= 1'b0;
        end
        end

  clk_wiz_0 clk_wiz_0
   (
    // Clock out ports
    .clk_out1                                   (clkout_50M         ),// output clk_out1
    .clk_out2                                   (clkout_100M        ),// output clk_out2
    // Status and control signals
    .reset                                      (1'b0               ),// input reset
    .locked                                     (locked             ),// output locked
   // Clock in ports
    .clk_in1                                    (clkin_50M          ) 
    );

        endmodule
                                                        
        
