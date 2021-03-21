clc
clear all
close all
WAV_FILE_PATH = "1_10 dataset/one.wav"
% NEW_FS = 25000

%%load the signal
[signal, fs] = read_wav_file(WAV_FILE_PATH)
%what is the difference between layer 1 and two
% sound(signal(:, 1), fs)
% new_sig = resample(signal(:, 1), 44100, 25000)
% sound(new_sig,25000)
%%plot the original signal
% figure("Name", "original");
% plot(1:length(signal), signal(:, 1));
% title("original signal")

%noisy_sig = awgn(signal(2000:4000, 1),10,'measured');
r = xcorr(signal(:, 1))
plot(r)
title("one")
% %sample the signal
% % % stem_sig = signal(:, 1)
% % % figure("Name", "stem the signal")
% % % stem(signal(:, 1))
% % % title("stem the signal")
% 
% % %u_law_compressor
% % u = 0.0001
% % sampled_com = u_law_compressor(stem_sig, u)
% % figure("Name", "u_law_compressed");
% % stem(sampled_com)
% % title(["u law compressed at u = " num2str(u)])
% 
% %reject max 10%
% cleared_signal = reject_10_percent(signal)
% stem_sig = cleared_signal(:, 1)
% 
% figure("Name", "stem the signal after rejecting 10%")
% stem(stem_sig)
% title("stem the signal after rejecting 10%")
% 
% 
% %quantized
% bit = 3
% y_quantized = quantize(stem_sig,bit);
% figure();
% stem(y_quantized);
% title(["quantized at bit = " num2str(bit)])
% %sound(y_quantized, fs)
% 
% 
% %reconstruct
% % % recon = interp1(n/fs,y_quantized,t,'spline');
% % % figure("Name", "recon");
% % % plot(recon);
% % % title("reconstracted")
% y_quantized = transpose(y_quantized)
% 
% %SQNR
% SQNR_hard_coded = signal_noise_ratio(stem_sig, y_quantized);
% SQNR_eq=1.76+6*bit;
% % 
% %Encoding
% N = 8;
% encoded_n = encoder(N, stem_sig, bit, y_quantized);
% encod = encoded_n;
% 
% %encode_zero_to_2_power_bit
% vcr = encod_zero_to_2_power_bit(y_quantized, stem_sig, bit)
% figure("Name", "encode_bits_only")
% stem(vcr)
% %sound(vcr, fs)
% % vcr = interp1(n/fs,vcr,t,'spline');
% % plot(t, vcr)
% % title("encoded rescaled")
% % 
% % %loose the single bit
% % restore= loose_bit_twos(encod)
% % figure("Name", "restore")
% % plot(n, restore)
% % title("restore")
% % 
% % %signal shift restore
% % restore_shift = signal_shift_encod(N, stem_sig, bit, y_quantized)
% % 
% %encod shift
% encod_loose = encod_bin_shift(encoded_n)
% figure("Name", "stairs_encoded_after_a_bit_loss")
% stairs(1: length(stem_sig), bin2dec(encod_loose))
% title("stairs encoded after a bit loss")
% sound(double(bin2dec(encod_loose)), fs)
% % 
% % 
% % 
% 
