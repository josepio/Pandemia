% Modelo SI - Curva Epidemiol�gica 
% Resolvido pelo m�todo de Euler
% Jos� Luiz de Souza Pio
beta=1;
N=1000;
T=15;
dt=1;
I0=20;
S = zeros(1,T/dt);
S(1) = N-I0;
I  = zeros(1,T/dt);
dI = zeros(1,T/dt);
dS = zeros(1,T/dt);
I(1) = I0;
    for t = 1:(T/dt)-1
        dS(t) = (-beta*I(t)*S(t)/N);
        dI(t) = (beta*I(t)*S(t)/N);
        S(t+1) = S(t) + dS(t);
        I(t+1) = I(t) + dI(t);
    end
    
x=1:T/dt;
plot(x,dI);
title('Modelo SI, Curva Epidemiol�gica');
xlabel('Dias');
ylabel('Popula��o');