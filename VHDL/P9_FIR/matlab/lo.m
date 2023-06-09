clc;clear all;close all;

Output_Signal_file = fopen('lo.txt');
Output_Signal = fscanf(Output_Signal_file , '%d');
fclose(Output_Signal_file);


plot(Output_Signal)

