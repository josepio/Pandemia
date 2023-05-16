%Grafo Generico

clear all;
n=8;
R=zeros(n,n);

%matriz de adjacência
%R=[ 0 1 1 1 1 1 1 1;
%    0 0 1 1 1 1 1 1;
%    0 0 0 1 1 1 1 1;
%    0 0 0 0 1 1 1 1;
%    0 0 0 0 0 1 1 1;
%    0 0 0 0 0 0 1 1;
%    0 0 0 0 0 0 0 1;
%    0 0 0 0 0 0 0 0]

R=[ 0 0 0 0 1 1 1 0;
    0 0 1 1 1 1 0 1;
    0 0 0 1 0 0 0 1;
    0 0 0 0 0 1 0 0;
    0 0 0 0 0 0 1 1;
    0 0 0 0 1 0 0 0;
    0 0 0 0 0 0 0 1;
    0 0 0 0 0 0 0 0]

%vértices
vertices=[ 1,5;
           10,12;
           17,7;
           8,15;
           7,8;
           3,10;
           8,3;
           12,0];

clf;
axis off;
hold on;
plot(vertices(:,1),vertices(:,2),'k.', 'MarkerSize',25);

for i=1:n
    nums=int2str(i);
    str=strcat('v',nums);
    text(vertices(i,1)+0.35,vertices(i,2),str);
end

for i=1:n
    for j=1:n
        if R(i,j)==1
          vi=[vertices(i,1), vertices(j,1)];
          vj=[vertices(i,2), vertices(j,2)];
          plot(vi,vj,'b');
        end
    end
end


%axis([-1 n*n -1 n*n]);

hold off
    
    
    
    
    