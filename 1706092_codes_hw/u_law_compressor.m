function sampled_com = u_law_compressor(signal, u)
signal = double(signal)
sampled_norm = signal/max(abs(signal))
figure("Name", "sampled_norm")
stem(sampled_norm)
sampled_com=log(1+u*abs(sampled_norm))/log(1+u).*sign(sampled_norm);