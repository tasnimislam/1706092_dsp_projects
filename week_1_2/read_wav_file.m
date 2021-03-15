function [signal, fs] = read_wav_file(wav_file_path)
[signal, fs] = audioread(wav_file_path)
