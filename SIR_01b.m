% Modelo epidemiológico SIR - simples (determinístico)
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

tmax = 90;             %no. de dias 
Tn = 3000;
S = zeros(tmax);        %Tamanho da população 
I = zeros(tmax);
R = zeros(tmax);
S(1) = 0.7*Tn;         %no. inicial de suceptíveis
I(1) = 0.01*Tn;         %no. inicial  de infectados
R(1) = Tn-S(1)-I(1);           %no. inicial de removidos
mu = 1.0/60.0;        
lambda = 1.0/3.0;
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
legend('S(t)','I(t)','R(t)');
xlabel('Dias');
ylabel('População');

figure(2);
plot(x,S);
title('Sucetíveis');
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



