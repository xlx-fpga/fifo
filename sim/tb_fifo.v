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
// Last modified Date:     2024/07/04 14:14:02 
// Last Version:           V1.0 
// Descriptions:            
//---------------------------------------------------------------------------------------- 
// Created by:             xlx_fpga
// Created date:           2024/07/04 14:14:02 
// Version:                V1.0 
// TEXT NAME:              fifo.v 
// PATH:                   E:\3.xlx_fpga\3.fifo\rtl\fifo.v 
// Descriptions:            
//                          
//---------------------------------------------------------------------------------------- 
//****************************************************************************************// 
 
module tb();
    reg                                         clkin_50M           ;
     
    initial
        begin
        clkin_50M = 0;
        forever #(10)
        clkin_50M = ~clkin_50M;
        end

    wire                                        clkout_50M          ;
    wire                                        clkout_100M         ;
    wire                                        reset_1             ;
    wire                                        reset_2             ;

fifo u_fifo(
    .clk                                        (clkin_50M          ) 
);
     
        endmodule
