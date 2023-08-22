load music
fs = 24000;
x1 = mixit(music,ones(1,15));
sound(x1,fs);   % you need to do this in MATLAB not in the grader
pause
x2 = mixit(music,[1 1 1 1 1 1 1 1 1 1 1 0 0 0 0]);
sound(x2,fs);
pause
x3 = mixit(music,~[1 1 1 1 1 1 1 1 1 1 1 0 0 0 0]);
sound(x3,fs);
pause
x4 = mixit(music,~[1 1 0 0 0 0 0 0 0 0 0 1 1 1 1]);
sound(x4,fs);
pause
x5 = mixit(music,[1 1 0 0 0 0 0 0 0 0 0  1 1 1 1]);
sound(x5,fs);