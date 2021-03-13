clc;
clear all;
close all;
a='11001011';
c1=not(a-'0')   % one's complement
d=1;
for k=numel(a):-1:1
  r=d & c1(k);
  c2(1,k)=xor(d,c1(k));  % c2 is two's complement
  d=r;
end
[c1;c2]