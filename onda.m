clc;
t = (0:0.001:2)';
y = sin(2*pi*50*t) + sin(2*pi*120*t);
yn = y + 0.5*randn(size(t));
figure(1)
plot(t(1:500),y(1:500))

figure(2)
x = linspace(0,4*pi,300);
subplot(2,1,1)
plot(x/pi,diric(x,7))
title('N = 7')

subplot(2,1,2)
plot(x/pi,diric(x,8))
title('N = 8')
xlabel('x / \pi')

fs = 1e3;
tmax = 15;
tt = 0:1/fs:tmax-1/fs;
f0 = 10;
T = 1;
t = 0:1/fs:T-1/fs;
pls = cos(2*pi*f0*t);