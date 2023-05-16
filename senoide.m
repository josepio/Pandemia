x=-3*pi:0.01:3*pi;
y1=sin(x);
y2=cos(x);
plot(x,y1,'--',x,y2);
axis([-3*pi 3*pi -1.5 1.5])