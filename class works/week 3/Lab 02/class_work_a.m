clc;
clear all;
close all;

n = -3:3;
n0 = 0;
x = zeros(1,length(n));
for i=1:length(n)
    if n(i) > n0
        x(i) = n(i) - n0;
    else
        x(i) = 0;
    end
end

xplus = x;
xneg = fliplr(x);
xeven = 0.5*(xplus+xneg);
xodd = 0.5*(xplus-xneg);
stem(n,x);
figure("Name", "Even")
stem(n,xeven);
figure("Name", "Odd")
stem(n,xodd);
figure("Name", "Main Signal")
stem(n, (xodd + xeven)/2)
