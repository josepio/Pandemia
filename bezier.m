u=0:0.001:1;
p1=(1-u).^3;
p2=3.*u.*(1-u).^2;
p3=3.*u.^2.*(1-u);
p4=u.^3;
hold on
%plot(u,p1,'linewidth',2.0);
%plot(u,p2,'linewidth',2.0);
plot(u,p3,'linewidth',2.0);
plot(u,p4,'linewidth',2.0);
grid on
hold off