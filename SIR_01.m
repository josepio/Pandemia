% Modelo SIR
% Resolvido pelo método de Euler
% José Luiz de Souza Pio
clear all;
beta=0.5;
gama=0.1;
N=500;
T=100;
dt=1;
I0=201;
S = zeros(1,T/dt);
S(1) = N-I0;
I = zeros(1,T/dt);
I(1) = I0;
R = zeros(1,T/dt);
    for tt = 1:(T/dt)-1
        dS = (-beta*I(tt)*S(tt)/N)*dt;
        dI = (beta*I(tt)*S(tt)/N - gama*I(tt))*dt;
        dR =  gama*I(tt)*dt;
        S(tt+1) = S(tt) + dS;
        I(tt+1) = I(tt) + dI;
        R(tt+1) = R(tt) + dR;
    end

x=0:T/dt-1;
plot(x,S,x,I,x,R);
title('Modelo SIR');
xlabel('Dias');
ylabel('População');
