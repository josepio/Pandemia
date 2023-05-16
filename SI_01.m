% Modelo SI
% Resolvido pelo método de Euler
% José Luiz de Souza Pio
beta=1;
N=1000;
T=15;
dt=1;
I0=20;
S = zeros(1,T/dt);
S(1) = N-I0;
I = zeros(1,T/dt);
I(1) = I0;
    for t = 1:(T/dt)-1
        dS = (-beta*I(t)*S(t)/N);
        dI = (beta*I(t)*S(t)/N);
        S(t+1) = S(t) + dS;
        I(t+1) = I(t) + dI;
    end
    
x=1:T/dt;
plot(x,S,x,I);
title('Modelo SI');
xlabel('Dias');
ylabel('População');