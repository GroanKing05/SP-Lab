%% Roll Number 2023102021

%x = linspace(0,3*pi,20);
% function [y] = discrete_sine(x,pos)
% y = sin(x);
% subplot(2,3,pos)
% stem(x,y)
% grid on
% xlim([0 3*pi])
% ylim([-2 2])
% title("Sine Function")
% end


a = linspace(1,20,1000);

% a is a row vector
% can be transposed to make it a column vector
% A = [a;2*a;3*a;4*a;5*a];
% y = sin(A');
% plot(a,y);
% 
% figure;
% B = [a' 2*a' 3*a' 4*a' 5*a'];
% y = sin(B);
% plot(a,y);
%change the number of points for stem
% for i=1:6
%     discrete_sine(i*a,i)
% end

% figure;
% for i=1:6
%    y = sin(i*a);
%    plot(a,y);
%    hold on;
% end

%plot 2 cycles of a discrete time square wave of period 10(samples), duty cycle 30
% function [f]= sqw(a)
% f = (mod(floor(a),10)< 3);
% stem(a,f)
% 
% end
% 
% sqw(a);

x= cos(a)+sin(a);
plot(a,x);
y = sin(a)./a;
% element wise division
plot(a,y);


 
