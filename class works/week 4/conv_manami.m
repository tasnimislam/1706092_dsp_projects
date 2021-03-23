function conv = conv_manami(sig1, sig2)
len_w = length(sig1) + length(sig2) - 1
for k=1:len_w
    sum_j = 0
    for j=max(1,k+1-length(sig2)):1:min(k,length(sig1))
        sum_j = sum_j + sig1(j)*sig2(k-j+1)
    end
    w(k) = sum_j
end
conv = w
