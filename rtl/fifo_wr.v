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

module fifo_wr(
    input                                       clk_100m             ,
    input                                       rst                 ,
    input                                       empty               ,
    input                                       almost_full         ,
    output reg                                  wr_en               ,
    output reg         [7: 0]                   wr_data              
);

    reg                                         empty_d0            ;
    reg                                         empty_d1            ;

//empty???????????
    always @(posedge clk_100m )
        begin
            if(rst)
        begin
                empty_d0 <= 0;
                empty_d1 <= 0;
        end
            else 
        begin
                empty_d0 <= empty;
                empty_d1 <= empty_d0;
        end
        end

//?fifo????????????almos_full??                              
    always @(posedge clk_100m )
        begin
            if(rst) begin
                wr_en <= 0;
        end
            else if(almost_full) begin
                wr_en <= 0;
        end
            else if(empty_d1) begin
                wr_en <= 1;
        end
            else begin
                wr_en <= wr_en;
        end
        end

//????????????
    always @(posedge clk_100m )
        begin
            if(rst) begin
                wr_data <= 8'b0;
        end
            else if(wr_en) begin
                wr_data <= wr_data +1'b1;
        end
            else begin
                wr_data <= wr_data;
        end
        end


        endmodule
