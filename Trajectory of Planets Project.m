% Trajectory of Planets Project
% 
% Maryam Doukali
% 10/08/2025

% Housekeeping 
close all; clear; clc;

trajectoryfunc = @(E, e, M) E - (e * sin(E)) - M;

data1 = fileread("planetary_data (1).json");
data1 = jsondecode(data1);

plot(0,0, "*", 'DisplayName', 'Sun')
hold on;
for i = 1:length(data1)
    planetName = data1(i).name;
    e = data1(i).e;
    a = data1(i).a;
    b = data1(i).b;
    p = data1(i).p;
    n = (2*pi)/p;
    [x, y] = trajectoryCalc(e, a, b, n, p, trajectoryfunc);
    plot(x, y, "o", 'DisplayName', planetName)
    hold on;
end

hold off;
axis equal;
grid on;
legend




