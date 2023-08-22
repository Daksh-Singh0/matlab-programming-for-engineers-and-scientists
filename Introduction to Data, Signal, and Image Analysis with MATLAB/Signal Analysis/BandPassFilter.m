function y = BandPassFilter(x, Fs, freq_range, W)
    %Create the filter using 'fir1'
    filt = fir1(W, freq_range/(Fs/2), 'bandpass');
    %Apply the filter using 'conv'
    y = conv(x, filt, 'same');
end