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
// Last modified Date:     2024/07/04 18:46:50 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             xlx_fpga
// Created date:           2024/07/04 18:46:50 
// Version:                V1.0 
// TEXT NAME:              fofo_rd.v 
// PATH:                   E:\3.xlx_fpga\3.fifo\rtl\fofo_rd.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 

module fofo_rd(
    input                                       clk_50M             ,
    input                                       rst                 ,
    input                                       almost_full         ,
    input                                       almost_empty        ,
    input              [7: 0]                   rd_data             ,
    output reg                                  rd_en                
);

    reg                                         almost_full_d0      ;
    reg                                         almost_full_d1      ;


//almost_full来自写时钟，打拍
    always @(posedge clk_50M )
        begin
            if(rst)
        begin
                almost_full_d0 <= 0;
                almost_full_d1 <= 0;
        end
            else 
        begin
                almost_full_d0 <= almost_full;
                almost_full_d1 <= almost_full_d0;
        end
        end

//当fifo写满的时候，开启读使能
    always @(posedge clk_50M )
        begin
            if(rst) begin
                rd_en <= 0;
        end
            else if(almost_full_d1) begin
                rd_en <= 1'b1;
        end
            else if(almost_empty) begin
                rd_en <= 0;
        end
            else begin
                rd_en <= rd_en;
        end
                                                      
        end
        endmodule
