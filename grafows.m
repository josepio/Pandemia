%Grafo modelo pequeno-mundo

clear all
n=10;
nk=2;
p=0.01;
R=zeros(n,n);
x=zeros(1,n);
y=zeros(1,n);
rotulo=0;
%Gera o anel
   
xinit=n/2;
yinit=n/2;
r=n/2;
r2=r+0.8;
th = 0:2*pi/n:2*pi;
x = r * cos(th) + xinit;
y = r * sin(th) + yinit;

%Posicionamento dos rótulos dos vértices
x2 = r2 * cos(th) + xinit-0.3;
y2 = r2 * sin(th) + yinit;

%faz o anel principal
j=0;
for i=1:n-1
    j=i+1;
    R(i,j)=1;
end

%monta o anel interno para todos k>2
for k=2:nk
    for i=1:n
        if i+k <= n
            j=i+k;
        else
            j=i+k-n;
        end
    R(i,j)=1;
    end
end

% faz a troca das arestas segundo a probabilidade p
for k=1:nk
    for i=1:n
        s = rand;
        if p>s
            R(i,i+1)=0;
            j=randi([i,n],1);
            R(i,j)=1;
        end
    end
end

plota_grafo(n,rotulo,R);

%Plota os vértices
%plot(x,y,'k.', 'MarkerSize',25);
%axis([-1 n+2 -1 n+2]);
%for i=n:-1:1
%    nums=int2str(i);
%    str=strcat('v',nums);
%    text(x2(i), y2(i),str);
%end
%axis off
%hold on

%for i=1:n
%    for j=1:n
%        if R(i,j)==1
%            xg = [x(i) x(j)];
%            yg = [y(i) y(j)];
%            plot(xg,yg,'b');
%         end
%    end
%end
hold on
%Fecha com a última aresta
xfim = [x(1) x(n)];
yfim = [y(1) y(n)];
plot(xfim,yfim,'b');
pbaspect([1 1 1]);
hold off
%R
 

