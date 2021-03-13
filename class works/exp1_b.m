clc
clear all
t=0:0.001:0.2;
n=0:50;
F1=10;
F2=50;
F3=100;
Fs=200;
xs=sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t);
xn=sin(2*pi*(F1/Fs)*n)+sin(2*pi*(F2/Fs)*n)+sin(2*pi*(F3/Fs)*n);
xr=interp1(n/Fs,xn,t,'spline');
subplot(3,1,1);
plot(t,xs)
title('Amplitude vs discrete time')
xlabel("discrete time")
ylabel("amplitude")


Max=max(xn);
Min=min(xn);
b=6;
L=2^b;
Del=(Max-Min)/(L-1);
for i=1:L
     l(i)=min(xn)+Del*(i-1)
end
quantized=xn;
for i=1:length(xn)
    for j=1:L-1
        if (xn(i)>l(j) && xn(i)<l(j+1))
            u=xn(i)-l(j);
            v=l(j+1)-xn(i);
            if (u>v)
                quantized(i)=l(j+1);
            else
                quantized(i)=l(j);
            end
        end
    end
end

subplot(3,1,2);
stem(n,xn,'p')
title('Quantized vs time')
xlabel("time")
ylabel("amplitude")

quantized_interpolated=interp1(n/Fs,quantized,t,'spline') ;
subplot(3,1,3);
plot(t,quantized_interpolated,':')
title('Quantized_interpolated vs time')
xlabel("time")
ylabel("amplitude")
 
error=(xn-quantized);

e_square= mean((error.^2));
y_square=mean((xs.^2));
SQNR=y_square/e_square;

A=10*log10(SQNR)
B=1.76+6*b

