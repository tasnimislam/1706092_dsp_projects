clc
clear all
close all
WAV_FILE_PATH = "1_10 dataset/ten.wav"
[signal, fs] = read_wav_file(WAV_FILE_PATH)
%plot(signal)
r = xcorr(signal(10000:13000, 1))
plot(r)
title("ten")