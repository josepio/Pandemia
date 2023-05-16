I=[25 34 52 77 98 98 98 234 291 428 621 978 1176 1604 1960 2271 2988 3477 3928 4661];
C=log(I);
Ci=2;
tt=0:0.5:14;
P0=1;
P=P0*Ci.^tt;
t=0:19;

%Encontra o reta de regressão com a função polyfit
Coef=polyfit(t,C,1)

%Reta de regressão
r=Coef(1)*t+Coef(2);

Y=exp(Coef(2))*exp(Coef(1)).^t;

% Plota a curva exponencial
figure(1)
plot(P,'LineWidth',1.5);
xlabel('Tempo');
ylabel('Infectados');
grid on;

% Plota a pontos reais (no. de infectados)
figure(2)
hold on
plot(t,I,'o','LineWidth',1.5);
%plot(t,Y,'LineWidth',1.5);
xlabel('Tempo');
ylabel('Infectados (I)');
hold off
grid on 

% Plota a reta de regressão
figure(3)
plot(t,C,'*',t,r,'LineWidth',1.5);
xlabel('Tempo');
ylabel('Log(I)');
grid on

figure(4)
clf
hold on
plot(t,Y,'LineWidth',1.5);
plot(t,I,'o','LineWidth',1.5);
xlabel('Tempo');
ylabel('Infectados (I)');
hold off
grid on;

