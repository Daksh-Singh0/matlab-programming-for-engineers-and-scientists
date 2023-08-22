% Define T, Fs, and f (vector of sound frequencies)
Fs = 44100;
T = 3;
f = [330 247 208 165 123 82];
% Compute time vector, t
t = [0:1/Fs:T-1/Fs];
% Use a for-loop to construct y as a sum of cosines
y = 0;
for i=1:length(f)
    y = y + cos(2*pi*f(i)*t);
end