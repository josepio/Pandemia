function plota_grafo(N, rotulo, graph)
clf;
xinit=N/2;
yinit=N/2;
r=N/2;
r2=r+0.8;
th = 0:2*pi/N:2*pi;
x = r * cos(th) + xinit;
y = r * sin(th) + yinit;

%Posicionamento dos rótulos dos vértices
x2 = r2 * cos(th) + xinit-0.3;
y2 = r2 * sin(th) + yinit;

tv = 25 % tamanho do vértice
if N >= 80
    tv = 12.5
end

plot(x,y,'k.', 'MarkerSize',tv);
axis([-1 N+2 -1 N+2]);

if rotulo == 1
    for i=N:-1:1
        nums=int2str(i);
        str=strcat('v',nums);
        text(x2(i), y2(i),str);
    end
end
axis off
hold on

for i=1:N
    for j=1:N
        if graph(i,j)==1
            xg = [x(i) x(j)];
            yg = [y(i) y(j)];
            plot(xg,yg,'b');
         end
    end
end
pbaspect([1 1 1]);
hold off;