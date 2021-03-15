clc
clear all
close all
%%load the signal
t = 0:0.001:0.2;
signal = sin(2*pi*10*t)+sin(2*pi*50*t)+sin(2*pi*100*t);


%%sample the signal
n = 0:1:40
fs = 200
stem_sig = sin(2*pi*(10/fs)*n)+sin(2*pi*(50/fs)*n)+sin(2*pi*(100/fs)*n);

%%plot the original signal
figure("Name", "original");
plot(t, signal);
title("original signal")

%plot the sampled version
figure("Name", "sampled_signal");
stem(stem_sig);
title("sampled signal")

%u_law_compressor
u = 255
sampled_com = u_law_compressor(stem_sig, u)
figure("Name", "u_law_compressed");
stem(sampled_com)
title("u law compressed")

%quantized
bit = 8;
y_quantized = quantize(stem_sig,bit);
figure("Name", "quantized");
stem(y_quantized);
title("quantized")

%reconstruct
recon = interp1(n/fs,y_quantized,t,'spline');
figure("Name", "recon");
plot(recon);
title("reconstracted")

%SQNR
SQNR_hard_coded = signal_noise_ratio(stem_sig, y_quantized);
SQNR_eq=1.76+6*bit;

%Encoding
N = 8;
encoded_n = encoder(N, stem_sig, bit, y_quantized);
encod = encoded_n;

%loose the single bit
restore= loose_bit_twos(encod)
figure("Name", "restore")
plot(n, restore)
title("restore")

%signal shift restore
restore_shift = signal_shift_encod(N, stem_sig, bit, y_quantized)

%encod shift
encod_loose = encod_bin_shift(encoded_n)
figure("Name", "stairs_encoded_after_a_bit_loss")
stairs(1: length(stem_sig), bin2dec(encod_loose))
title("stairs encoded after a bit loss")




