% Modelo SIR com demografia dinamica vital
% Resolvido pelo método de Euler
% José Luiz de Souza Pio
clear all;
beta=0.9;
gama=0.1429;
mu=0.004;
N=1000000;
T=500;
dt=1;
I0=100000;
S = zeros(1,T/dt);
S(1) = N-I0;
I = zeros(1,T/dt);
I(1) = I0;
R = zeros(1,T/dt);
    for tt = 1:(T/dt)-1
        dS = mu*(N-S(tt))+(-beta*I(tt)*S(tt)/N)*dt;
        dI = (beta*I(tt)*S(tt)/N - I(tt)*(mu+gama))*dt;
        dR =  (gama*I(tt)-mu*R(tt))*dt;
        S(tt+1) = S(tt) + dS;
        I(tt+1) = I(tt) + dI;
        R(tt+1) = R(tt) + dR;
    end

x=0:T/dt-1;
plot(x,S,x,I,x,R);
title('Modelo SIR com Demografia');
xlabel('Dias');
ylabel('População');
