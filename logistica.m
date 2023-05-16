%crescimento log�stico
clc;
c=700000;
p=1000000;
y(1:101)=700000;
n=0:0.1:10;
t=c./(1+699999*exp(-2*n));
plot(n,p,n,t,n,y,'r--','LineWidth',2);
xlabel('tempo (t)');
ylabel('N�mero de casos P(t)');
grid on
%legend ('Dados Registros', 'Reta de Regress�o');


%plot(n,5);

