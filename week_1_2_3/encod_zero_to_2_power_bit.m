function vcr = encod_zero_to_2_power_bit(y_quantized, sample, bit)
vc = str2num(dec2bin(rescale(y_quantized,0,2.^bit-1)));
vcr = rescale(bin2dec(num2str(vc)),min(sample),max(sample));

