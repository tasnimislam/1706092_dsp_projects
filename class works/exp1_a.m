clc;
clear all;
close all;

Fs=200;
n=0:1:50;
t=0:0.001:0.2;
y=sin(2*pi*(10/Fs)*n)+sin(2*pi*(50/Fs)*n)+sin(2*pi*(100/Fs)*n);
xr=interp1(n/Fs,y,t,'spline');
stem(n,y,'O');
figure;
plot(t,xr,':.');