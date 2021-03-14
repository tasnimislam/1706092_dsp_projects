clc
clear all
close all
%%load the signal
t = 0:0.001:0.1;
signal = sin(2*pi*20*t);

%%plot the original signal
figure("Name", "original");
plot(t, signal);

%plot the sampled version
figure("Name", "stem_the_signal");
stem(t, signal);

%u_law_compressor_not plausible

%%quantized
bit = 8;
y_quantized = quantize(signal,bit);
figure("Name", "quantized");
stem(y_quantized);

%%reconstruct
recon = interp1(t, double(y_quantized), t);
figure("Name", "recon");
plot(recon);


%%SQNR
SQNR_hard_coded = signal_noise_ratio(signal, y_quantized);
SQNR_eq=1.76+6*bit;

%%Encoding
N = 8;
encoded_n = encoder(N, signal, bit, y_quantized);
encod = encoded_n;

%%loose the single bit
restore= loose_bit_twos(encod)
figure("Name", "restore")
plot(t, restore)

%%signal shift restore
restore_shift = signal_shift_encod(N, signal, bit, y_quantized)

%%encod shift
encod_loose = encod_bin_shift(encoded_n)
figure("Name", "stairs_encoded_x")
stairs(1: length(signal), bin2dec(x))




