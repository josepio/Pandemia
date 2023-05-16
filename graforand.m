%Modelo de Erdos-Rényi

clear all
n=11;
p=0.1;
R=zeros(n,n);
x=zeros(1,n);
y=zeros(1,n);
%Gera os vértices aleatórios
%for i=1:n
%    x(i)=randi([1,n]);
%    y(i)=randi([1,n]);
%end

%Gera vértices em círculos
xinit=n/2;
yinit=n/2;
r=n/2-1;
r2=r+0.8;
th = 0:2*pi/n:2*pi;
x = r * cos(th) + xinit;
y = r * sin(th) + yinit;

%Posicionamento dos rótulos dos vértices
x2 = r2 * cos(th) + xinit-0.3;
y2 = r2 * sin(th) + yinit;


for i=1:n
    for j=1:n
        s=rand;
        if s < p
            R(i,j)=1;
        end
    end
end

%Plota os vértices
plot(x,y,'k.', 'MarkerSize',25);
axis([-1 n+2 -1 n+2]);
for i=n:-1:1
    nums=int2str(i);
    str=strcat('v',nums);
    text(x2(i), y2(i),str);
end
axis off
hold on

for i=1:n
    for j=1:n
        if R(i,j)==1
            xg = [x(i) x(j)];
            yg = [y(i) y(j)];
            plot(xg,yg,'b');
         end
    end
end
pbaspect([1 1 1]);
hold off
R

