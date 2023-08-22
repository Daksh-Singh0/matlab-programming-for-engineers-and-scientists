function output = voltage(V, R)
M = [R(7)*R(2)+R(1)*R(2)+R(1)*R(7), -R(1)*R(2), 0;
    -R(3)*R(4)*R(8), R(7)*R(4)*R(8)+R(3)*R(4)*R(8)+R(3)*R(7)*R(8)+R(3)*R(7)*R(4), -R(3)*R(7)*R(4);
    0, -R(5)*R(6), R(8)*R(6)+R(5)*R(6)+R(5)*R(8)];
O = [R(7)*R(2)*V;R(7)*R(4)*R(8)*V;R(8)*R(6)*V];
output = M\O;