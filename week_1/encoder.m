function encoded_n = encoder(N, y_sampled, bit, y_quantized)
N=length(y_sampled);
L=2^bit;
del=(max(y_quantized)-min(y_quantized))/(L-1);
for l=1:length(y_quantized)
  encoded_signal(l)=(y_quantized(l)-min(y_quantized))/del;  
end
figure("Name", "stairs_encoded")
stairs(1: length(y_sampled), encoded_signal)
title("encoded signal")
encoded_n=dec2bin(encoded_signal)