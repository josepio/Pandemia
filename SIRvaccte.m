% Modelo SIR com dinamica vital e vacinacao constante
% Resolvido pelo método de Euler
% José Luiz de Souza Pio
function [S,I,R] = sirvaccte(beta,gama,mu,p,N,T,dt,I0);
clear all;
if nargin == 0
    beta=0.9;
    gama=0.1429;
    mu=0.004;
    p= 0.7; %
    N=1;
    T=900;
    dt=1;
    I0=0.23;
end
    S = zeros(1,T/dt);
    S(1) = N-I0;
    I = zeros(1,T/dt);
    I(1) = I0;
    R = zeros(1,T/dt);
    for tt = 1:(T/dt)-1
        dS = (mu*(1-p)+(-beta*I(tt)*S(tt)/N)-mu*S(tt))*dt;
        dI = ((beta*I(tt)*S(tt)/N) - (I(tt)*gama) - (mu*I(tt)))*dt;
        dR =  (p*mu + gama*I(tt)-mu*R(tt))*dt;
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
