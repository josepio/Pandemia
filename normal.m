%distribuição normal
x=-4.09:0.01:4.09;
mu=0.0;
sigma1=1.0;
sigma2=0.8;
sigma3=0.5;
y1 = normpdf(x,mu,sigma1);
y2 = normpdf(x,mu,sigma2);
y3 = normpdf(x,mu,sigma3);
plot(x,y1,x,y2,x,y3,'LineWidth',2);
xlabel('x');
ylabel('f(x)');
grid on;

%x1=0:0.1:6;
%l1=0.5;
%l2=1;
%l3=1.5;

%distribuição exponencial
%y1=l1*exp(-l1*x1);
%y2=l2*exp(-l2*x1);
%y3=l3*exp(-l3*x1);
%plot(x1,y1,x1,y2,x1,y3,'LineWidth',2);
%xlabel('x');
%ylabel('Densidade f(x)');
%hold off
%distribuição binomial
%p=0.5
%n=20;
%x=0:n;
%P=zeros(1,n+1);
%for i=1:n+1
%   P(i)=combinacao(n,i-1)*(p^(i-1))*(1-p)^(n-i-1)
%end
%hold on
%plot(x,P,'.','MarkerSize',15);
%bar(x,P)

%Poisson

%lambda1=1;
%lambda2=4;
%lambda3=10;
%n=20;
%f1=zeros(1,n+1);
%f1=zeros(1,n+1);
%f1=zeros(1,n+1);
%for k=0:20
    %f1(k+1)=exp(-lambda1)*lambda1^k/factorial(k);
    %f2(k+1)=exp(-lambda2)*lambda2^k/factorial(k);
    %f3(k+1)=exp(-lambda3)*lambda3^k/factorial(k);
%end
%x=0:20;
%hold on
%plot(x,f1,'.','MarkerSize',15)
%plot(x,f2,'*',x,f3,'+')

   



