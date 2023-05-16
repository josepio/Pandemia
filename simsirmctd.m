%Modelo SIR CMTD
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
R(1)    = 0;
sim     = 3;

for k=1:sim
    for t=1:endt/dt
        r   = rand;
        p1  = beta*S(t)*I(t)*dt/N;
        p2  = gamma*I(t)*dt;
        p3  = 1 -(p1 + p2)*dt;
        if  r > 0 & r <= p1;
            S(t+1) = S(t)-1;
            I(t+1) = I(t)+1;
            R(t+1) = R(t);
        elseif r > p1 & r <= (p1+p2)
                S(t+1) = S(t);
                I(t+1) = I(t)-1;
                R(t+1) = R(t)+1;
        elseif r > (p1+p2) & r <= 1
                S(t+1) = S(t);
                I(t+1) = I(t);
                R(t+1) = R(t);
         end
    end
    hold off   
    x=0:dt:endt;
    figure (1)
    hold on 
    if k==1
        stairs(x,I,'r-','LineWidth',1);
    elseif k==2
        stairs(x,I,'b-','LineWidth',1);
    elseif k==3
        stairs(x,I,'g-','LineWidth',1);
    end
    xlabel('t (dias)');
    ylabel('No. Infectados');
    hold off
    figure(2)
    hold on
    if k==1
        stairs(x,S,'r-','LineWidth',1);
    elseif k==2
        stairs(x,S,'b-','LineWidth',1);
    elseif k==3
        stairs(x,S,'g-','LineWidth',1);
    end
    xlabel('t (dias)');
    ylabel('No. Suscetíveis');
    hold off
     figure(3)
    hold on
    if k==1
        stairs(x,R,'r-','LineWidth',1);
    elseif k==2
        stairs(x,R,'b-','LineWidth',1);
    elseif k==3
        stairs(x,R,'g-','LineWidth',1);
    end
    xlabel('t (dias)');
    ylabel('No. Recuperados');
    hold off
     
   end     
    
