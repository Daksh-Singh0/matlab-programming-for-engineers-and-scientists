function y = myifft(yfft, f, Fs)
% Replace redundant part of the fft that we trimmed away:
%   if the last frequency in f equals Fs/2, 
if f(end) == Fs/2
%       then we need to append the conjugate of the mirrored entries in yfft from 2 to length of yfft minus 1
    y = ifft([yfft; conj(flipud(yfft(2:end-1)))]);
%   else
else
%       then we need to append the conjugate of the mirrored entries in yfft from 2 to length of yfft
    y = ifft([yfft; conj(flipud(yfft(2:end)))]);
% perform ifft
end