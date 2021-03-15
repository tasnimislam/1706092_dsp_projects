function cleared_signal = reject_10_percent(signal)
audiorange = max(signal(:, 1)) - min(signal(:, 1))
sig = signal
for i=1:length(sig(:, 1))
    if abs(sig(i, 1)) < 0.1*audiorange
        sig(i, 1) = 0;
    end
end
cleared_signal = sig