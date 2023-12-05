clc;
clear all;
close all;


Fs = 50e6;
t = 0:1/Fs:255/Fs;
f = 1/(256*20e-9);

x = fix((2^15-1)*cos(2*pi*f*t));

plot(x);