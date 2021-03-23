%%signals
t1 = 0.1:0.001:0.5
t2 = 2:0.003:2.5

%%test_signals
conv_matlab = conv(sin(2*pi*t1), sin(2*pi*t2))
conv_me = conv_manami(sin(2*pi*t1), sin(2*pi*t2))

figure()
subplot(211); plot(conv_me); title("conv manami")
subplot(212); plot(conv_matlab); title("conv matlab")