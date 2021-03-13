function SQNR = signal_noise_ratio(sample, quantize_signal)
error_quantized=sample - quantize_signal;
sigma_e_square=mean((error_quantized.^2))
sigma_y_square=mean((sample.^2))
SQNR=sigma_y_square/sigma_e_square
SQNR=10*log10(SQNR)
