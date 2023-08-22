function [y,Fs_min] = IsNyquistSatisfied(fmax,Fs)
    Fs_min = 2*fmax;
    y = Fs > Fs_min;
end