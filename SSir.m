% Modelo epidemiológico SIR - simples (determinístico)
% Prof. José Luiz de Souza Pio
% 11.05.2020
%-----------------------------------------------
% Modelo SIR
% Sn - no. de sucetíveis no tempo n 
% In - no.  de infectados no tempo n
% Rn - no. de recuperados no tempo n
%----
% p - probabilidade que um contato resulte em contágio
%----
% gama - taxa de recuperação (ou remoção)? é uma constante positiva de 
% proporcionalidade, chamada taxa de recuperação ou taxa de remoção. gama 
% é uma taxa per-capita e por unidade de tempo. O seu recíproco, 1/gamma, 
% pode ser identificado como o tempo de residência no compartimento 
% infeccioso, isto é, o tempo médio em que um indivíduo é infecioso. 
% Para a gripe, o período infecioso é tipicamente de 1 a 3 dias. Se o 
% considerarmos igual a 2 dias, por exemplo, isto significa que a taxa de 
% recuperação é gamma=1/2 (por indivíduo e por dia) e portanto num dia 
% metade dos infetados recuperam.
%----
% c - diz-se a taxa de contacto per-capita e por unidade de tempo. 
% Pela hipótese da população homogeneamente misturada c é constante 
% (uma hipótese muito questionavel!...).
% ----
% beta - taxa de recuperação
%  beta=cp. A constante beta é chamada o coeficiente de transmissão e tem 
% unidades tempo^(?1).

tmax = 15;              %no. de dias 
Tn = 763;              %Tamanho da população 
S = zeros(tmax);        
I = zeros(tmax);
R = zeros(tmax);
S(1) = Tn-1;          %no. inicial de suceptíveis
I(1) = 1.0;         %no. inicial  de infectados
R(1) = 0.0;         %no. inicial de removidos
c = 3.0;
p = 0.84;
gama = 0.44;
beta = c*p;
deltaT = 1.0;

for n=1:tmax-1
    S(n+1) = S(n) + beta*((S(n)*I(n))/Tn)*deltaT ;
    I(n+1) = I(n) + (beta*((S(n)*I(n))/Tn)-gama*I(n))*deltaT;
    R(n+1) = R(n) + Tn - I(n)- S(n);
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
