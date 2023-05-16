function [S,I,R] = sirsvital(beta,gama,lambda,delta,mu,N,T,dt,I0);
clear all;
if nargin == 0
    beta    = 1;
    gama    = 0.3333;
    lambda  = 0.1;
    delta   = 0.001;
    mu      = 0.0005;
    N       = 1;
    T       = 20;
    dt      = 1;
    I0      = 0.1;
end
    S = zeros(1,T/dt);
    S(1) = N-I0;
    I = zeros(1,T/dt);
    I(1) = I0;
    R = zeros(1,T/dt);
    for tt = 1:(T/dt)-1
        dS = ((-beta*I(tt)*S(tt)/N)+lambda*R(tt)+ mu*N)*dt;
        dI = ((beta*I(tt)*S(tt)/N) - (I(tt)*(gama + delta)))*dt;
        dR =  (gama*I(tt)-lambda*R(tt))*dt;
        S(tt+1) = S(tt) + dS;
        I(tt+1) = I(tt) + dI;
        R(tt+1) = R(tt) + dR;
    end
clf;
x=0:T/dt-1;
figure(1);
plot(x,S,x,I,x,R);
title('Modelo SIR com Vacinação Constante');
xlabel('Dias');
ylabel('População');

figure(2);
plot(x,S,x,I);
title('Modelo SIR com Vacinacao Constante');
xlabel('Dias');
ylabel('População');
end
