%não paramétrica
x=-20:0.5:15;
y1=0.5*x-1
y2= 5*x + x.^2;
figure(1);
subplot(1,2,1);plot(x,y1);grid on;subplot(1,2,2);plot(x,y2); grid on;
%axis off;
%axis([-5 5 -5 5]);

figure(2);
t=0:0.1:12*pi; % intervalo para eixo t
plot3(sin(t), cos(t), t/5) % eixos x,y,z
grid on
%axis equal


figure(3)
theta = linspace (-pi/4,pi/4);
x = cos(theta).*sqrt(2.*cos(2.*theta));
y = sin(theta).*sqrt(2.*cos(2.*theta));
plot(x,y,-x,-y,'linewidth',2), grid on, axis off
%axis ('equal')

figure