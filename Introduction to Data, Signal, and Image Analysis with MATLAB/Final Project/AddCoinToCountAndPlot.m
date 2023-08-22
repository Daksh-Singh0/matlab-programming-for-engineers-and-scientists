function [coinvalue,x_plot,y_plot,col] = AddCoinToPlotAndCount(x,y,cls)
% initialize radians for defining x_plot and y_plot using cos and sin functions
rads = 0:2*pi/32:2*pi;
% initialize parameters for radius and color of circle for each type of coin
dime = struct('radius', 22, 'color', 'r', 'value', 10);
nickel = struct('radius', 30, 'color', 'g', 'value', 5);
quarter = struct('radius', 40, 'color', 'm', 'value', 25);
% use if-elseif statement to define x_plot, y_plot, col
%   when cls is 1, we found a dime
coin = struct();
if cls == 1
    coin = dime;
%   when cls is 2, we found a nickel
elseif cls == 2
    coin = nickel;
%   when cls is 3, we found a quarter
elseif cls == 3
    coin = quarter;
end

coinvalue = coin.value;
x_plot = coin.radius*cos(rads)+x;
y_plot = coin.radius*sin(rads)+y;
col = coin.color;

plot(x_plot,y_plot,col);
end