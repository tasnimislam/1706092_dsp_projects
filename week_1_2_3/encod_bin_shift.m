function encod_loose = encod_bin_shift(encoded_n)
x = encoded_n
for i=1:length(x)
  x(i,2:end) = '00';
end
encod_loose = x