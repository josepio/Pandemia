%Modelo SIS CMTD
%José Luiz de Souza Pio
clear all
clc;
%set(0,'DefaultAxesFontSize', 10);
beta    = 1.0;
gamma   = 0.5;
R0      = beta/gamma;
N       = 100;
dt      = 0.01;
endt    = 25;
I0      = 2;
S0      = N-I0;
I(1)    = I0;
S(1)    = S0;

for t=1:endt/dt
    r   = rand;
    p1  = beta*I(t)*(N-I(t))*dt/N;
    p2  = gamma*I(t)*dt;
    p3  = 1 -(p1 + p2);
    if  r > 0 & r <= p1;
        I(t+1) = I(t)+1;
        S(t+1) = S(t)-1;
    elseif r > p1 & r <= (p1+p2)
            I(t+1) = I(t)-1;
            S(t+1) = S(t)+1;
    elseif r > (p1+p2) & r <= 1
            I(t+1) = I(t);
            S(t+1) = S(t);
     end
end
clc;
hold on    
x=0:dt:endt;
stairs(x,I,'r-','LineWidth',1);
%stairs(x,S,'b-','LineWidth',1);

y(1)=I0;
for k=1:endt/dt
    y(k+1)=y(k)+dt*(beta*(N-y(k))*y(k)/N-gamma*y(k));
end
plot(x,y,'k-','LineWidth',2);
xlabel('Tempo');
ylabel('No. Infectados');
hold off