u=0:0.001:1;
p1=2*u.^3-3*u.^2+1;
p2=-2*u.^3+3*u.^2;
p3=u.^3-2*u.^2+u;
p4=(u.^3-u.^2);
hold on
plot(u,p1,'linewidth',2.0);
plot(u,p2,'linewidth',2.0);
plot(u,p3,'linewidth',2.0);
plot(u,p4,'linewidth',2.0);
grid on
hold off