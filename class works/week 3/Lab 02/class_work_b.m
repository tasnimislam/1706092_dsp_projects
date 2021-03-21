x1=[4 2 6 3 8 1 5]; x2=[3 8 6 9 6 7]; 
x1=[4 2 6 3 8 1 5]; 
n1=[-2:4];% generating index 
x2=[3 8 6 9 6 7]; 
n2=[-4:1]; 
kmin=n1(1)+n2(1);% left edge of convolved result 
kmax=n1(end)+n2(end); % right edge of convolved result

y=conv(x1,x2); 
all_index = [-6:6]
k=kmin:kmax; % generating index of the result 
subplot(311),stem(all_index,[0 0 x1 0 0 0 0]) 
subplot(312),stem(all_index,[0 0 x2 0 0 0 0 0]) 
subplot(313),stem(all_index,[y 0]) 