function encod_loose = encod_bin_shift(encoded_n)
x = encod
for i=1:length(x)
  x(i,end-1:end) = '0';
end
encod_loose