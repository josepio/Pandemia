% Modelo epidemiológico SIR - simples (deterinistico)
% Prof. José Luiz de Souza Pio
% 21.03.2020
%-----------------------------------------------
% Modelo SIR
% Sn - no. de sucetíveis no tempo n 
% In - no.  de infectados no tempo n
% Rn - no. de recuperados no tempo n
% mu - taxa de mortalidade
% lambda - taxa de transmissão
% betha - taxa de recuperação

tmax = 365;         %no. de dias 
S = zeros(tmax);
I = zeros(tmax);
R = zeros(tmax);
S(1) = 2000000;     %no. inicial de suceptíveis
I(1) = 3;           %no. inicial  de infectados
Tn = 3000000;       %Tamanho da população 
R(1) = 1000000;     %no. inicial de removidos
mu = 0.05;        
lambda = 0.4;
betha = 0.0567;

for n=1:tmax-1
    S(n+1) = S(n) + mu*Tn - (lambda*S(n)*I(n))/Tn - mu*S(n);
    I(n+1) = I(n) + (lambda*S(n)*I(n))/Tn - mu*I(n) - betha*I(n);
    R(n+1) = R(n) + betha*I(n) - mu*R(n);
end 
x=1:tmax;
figure(1);
plot(x,S,x,I,x,R);
title('Modelo SIR');
xlabel('Dias');
ylabel('População');

figure(2);
plot(x,S);
title('Suceptíveis');
xlabel('Dias');
ylabel('População');

figure(3);
plot(x,I);
title('Infectados');
xlabel('Dias');
ylabel('População');

figure(4);
plot(x,R);
title('Removidos');
xlabel('Dias');
ylabel('População');



