function restore_shift = signal_shift_encod(N, signal, bit, quantized)
quantized = quantized + max(quantized)*2
figure("Name", "quantized_shift");
stem(quantized);
signal = (signal + max(signal)*2)
encod = encoder(N, signal, bit, quantized);
for i=1:length(encod)
   encod(i,end-1:end) = '0';
end
restore_shift = encod