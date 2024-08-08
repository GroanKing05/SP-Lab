%% Roll No. 2023112005
%% Lab1: MATLAB BASICS - All different files/codes are put into this file.
% First creating the x-axis, from 0 to 3*pi with 1000 equidistant data
% points
x = linspace(0,3*pi,1000);
y = sin(x);

subplot(2,1,1);
plot(x,y,'-.r');
title('A Sine Function');
ylim([-1.2,1.2]);

x2 = linspace(0,3*pi,20);
y2 = sin(x2);
subplot(2,1,2);
stem(x2,y2);
title('A Sine Stem Plot');
ylim([-1.2,1.2]);

%% Plotting multiple sine waves
x3 = linspace(0,3*pi,10000);
x3=x3';
T = [x3 2*x3 3*x3 4*x3 5*x3];
y3 = sin(T);

plot(x3,y3);
grid on;
title('Sine Functions');
ylim([-1.2,1.2]);

%% Plotting square wave with 30% duty cycle
sqw = [0, ones(1,3), zeros(1,7), ones(1,3), zeros(1,7)];
x_axis = 0:20;
stem(x_axis,sqw);
ylim([-1,2]);




