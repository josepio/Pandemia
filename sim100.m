%Modelo SIS CMTD - Simulacao 3 trilhas
%José Luiz de Souza Pio
clear all;
clc;
%set(0,'DefaultAxesFontSize', 10);
beta    = 1.0;
gamma   = 0.5;
R0      = beta/gamma;
N       = 100;
dt      = 0.01;
endt    = 50;
I0      = 5;
S0      = N-I0;
I(1)    = I0;
S(1)    = S0;
sim     = 1000;

for k=1:sim
    for t=1:endt/dt
        r   = rand;
        p1  = beta*I(t)*(N-I(t))*dt/N;
        p2  = gamma*I(t)*dt;
        p3  = 1 -(p1 + p2)*dt;
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
    hold on    
    x=0:dt:endt;

    %if k==1
        %stairs(x,I,'r-','LineWidth',1);
    %elseif k==2
        %stairs(x,I,'b-','LineWidth',1);
    %elseif k==3
        %stairs(x,I,'g-','LineWidth',1);
    %end
    Ip(k,:)=I(:);
end     
   Im=mean(Ip); 

y(1)=I0;
for k=1:endt/dt
    y(k+1)=y(k)+dt*(beta*(N-y(k))*y(k)/N-gamma*y(k));
end
plot(x,y,x,Im,'r-','LineWidth',2);
xlabel('t (dias)');
ylabel('No. Infectados');
