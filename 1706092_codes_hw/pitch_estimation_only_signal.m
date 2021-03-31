clc
clear all
close all
WAV_FILE_PATH = "1_10 dataset/ten.wav"
name = split(WAV_FILE_PATH, "/")
name = split(name(2), ".")

%%plot the original signal
[signal, fs] = read_wav_file(WAV_FILE_PATH)
%resampled
signal = resample(signal,8000, fs)
len_signal = length(signal(:, 1))
% figure("Name", "original signal")
% plot(signal)
% title(sprintf("original signal: %s", name(1)))

%%correlation for a particular part only
x_begin = 1 
x_end = len_signal
signal = signal(x_begin:x_end)
r = xcorr(signal)
% figure("Name", "correlation for a particular part only")
% plot(r)
% title(sprintf("correlation befor noise: %d to %d for signal name: %s", x_begin, x_end, name(1)))

%%Input power
Px=sum(signal.^2)/length(signal);
SNR = 5
Py = Px/10^(SNR/10)

%%generate white noise
n=sqrt(Py).*randn(1,length(signal));
y = signal(:, 1) + n
ACF_x=normalize(xcorr(signal)); % Normalizing the peak to 1 
ACF_n=normalize(xcorr(n)); 
ACF_y=normalize(xcorr(y)); 
ACF_y(length(signal))=.4*max(ACF_y); %You can enable this line for better

R = normalize(signal)
R=signal/max(signal)

[A, E] = lpc(signal, 16)
figure("Name", "LPC of o of dosh")
freqz(A,E)
title("LPC of o of dosh")

%PSD
[pxx,w] = pwelch(signal,length(signal));
figure("Name", "Pwelch")
plot(pxx)

%%plot stuff
figure("Name", "signal noise and ACF")
subplot(611), plot(signal), title(sprintf("original signal: %s", name(1)))
subplot(612), plot(r), title(sprintf("correlation before noise: %d to %d for signal name: %s", x_begin, x_end, name(1)))
subplot(613), plot(n), title("noise")
subplot(614),plot(ACF_x), title("ACF of signal wrt time")
subplot(615),plot(ACF_y), title(sprintf("ACF of noisy signal wrt time SNR:%d", SNR))
subplot(616),plot(R), title(sprintf("R noisy signal wrt time SNR:%d", SNR))

Factor = 1.2732e+03
