function encod_loose = encod_bin_shift(encoded_n)
x = encoded_n
for i=1:length(x)
  x(i,end-1:end) = '0';
end
encod_loose = x