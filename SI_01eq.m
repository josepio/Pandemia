% Modelo SI Equação integral
% Resolvido pelo método de Euler
% José Luiz de Souza Pio
beta=1;
N=1000;
T=15;
dt=0.1;
I0=20;
S0 = N-I0;
alfa = beta/N;
t=0:dt:T;
I=I0*N./(I0+(N-I0)*exp(-N*alfa*t));
S=S0*N./(S0+(N-S0)*exp(N*alfa*t));

plot(t,I,t,S);
title('Modelo SI, Equação Integral');
xlabel('Dias');
ylabel('População');