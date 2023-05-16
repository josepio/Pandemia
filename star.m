%Grafo modelo star-shaped

clear all
n=20;
x=zeros(1,n);
y=zeros(1,n);

%Gera o anel
   
xinit=n/2;
yinit=n/2;
r=n/2;
r2=r+0.8;
th = 0:2*pi/(n-1):2*pi;
x = r * cos(th) + xinit;
y = r * sin(th) + yinit;

%Posicionamento dos rótulos dos vértices
x2 = r2 * cos(th) + xinit-0.3;
y2 = r2 * sin(th) + yinit;


%Cria as arestas
R(1,1)=0;
R(1,2:n)=1;
 
 
%Plota os vértices
plot(x,y,'k.', 'MarkerSize',25);
axis([-1 n+2 -1 n+2]);
for i=n:-1:2
    nums=int2str(i);
    str=strcat('v',nums);
    text(x2(i), y2(i),str);
end
axis off
hold on

    i=1
    for j=1:n
        if R(i,j)==1
            xg = [xinit x(j)];
            yg = [yinit y(j)];
            plot(xg,yg,'b');
         end
    end
    plot(xinit,yinit,'k.','MarkerSize',25);
    text(xinit+0.3, yinit,'v1')
    pbaspect([1 1 1]);
hold off