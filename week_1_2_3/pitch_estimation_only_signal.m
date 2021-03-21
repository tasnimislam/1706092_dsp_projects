clc
clear all
close all
WAV_FILE_PATH = "1_10 dataset/three.wav"
name = split(WAV_FILE_PATH, "/")
name = split(name(2), ".")

%%plot the original signal
[signal, fs] = read_wav_file(WAV_FILE_PATH)
% figure("Name", "original signal")
% plot(signal)
% title(sprintf("original signal: %s", name(1)))

%%correlation for a particular part only
x_begin = 10000
x_end = 13000
signal = signal(x_begin:x_end)
r = xcorr(signal)
% figure("Name", "correlation for a particular part only")
% plot(r)
% title(sprintf("correlation befor noise: %d to %d for signal name: %s", x_begin, x_end, name(1)))

%%Input power
Px=sum(signal.^2)/length(signal);
SNR = -10
Py = Px/10^(SNR/10)

%%generate white noise
n=sqrt(Py).*randn(1,length(signal));
y = signal(:, 1) + n
ACF_x=normalize(xcorr(signal)); % Normalizing the peak to 1 
ACF_n=normalize(xcorr(n)); 
ACF_y=normalize(xcorr(y)); 
ACF_y(length(signal))=.4*max(ACF_y); %You can enable this line for better

%%plot stuff
figure("Name", "signal noise and ACF")
subplot(511), plot(signal), title(sprintf("original signal: %s", name(1)))
subplot(512), plot(r), title(sprintf("correlation befor noise: %d to %d for signal name: %s", x_begin, x_end, name(1)))
subplot(513), plot(n), title("noise")
subplot(514),plot(ACF_x), title("ACF of signal wrt time")
subplot(515),plot(ACF_y), title("ACF of noisy signal wrt time")


