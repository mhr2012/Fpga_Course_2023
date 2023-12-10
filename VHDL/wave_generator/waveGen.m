clc;clear all;close all;

Fs = 100e6;
t = 0:1/Fs:1023/Fs;
f = Fs/(1024);
x1 = fix(linspace(-2^8,2^8-1,1024));

x2 = fix((2^8-1).*cos(2*pi*f*t));

plot(x1)
hold on 
plot(x2)