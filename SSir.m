% Modelo epidemiol�gico SIR - simples (determin�stico)
% Prof. Jos� Luiz de Souza Pio
% 11.05.2020
%-----------------------------------------------
% Modelo SIR
% Sn - no. de sucet�veis no tempo n 
% In - no.  de infectados no tempo n
% Rn - no. de recuperados no tempo n
%----
% p - probabilidade que um contato resulte em cont�gio
%----
% gama - taxa de recupera��o (ou remo��o)? � uma constante positiva de 
% proporcionalidade, chamada taxa de recupera��o ou taxa de remo��o. gama 
% � uma taxa per-capita e por unidade de tempo. O seu rec�proco, 1/gamma, 
% pode ser identificado como o tempo de resid�ncia no compartimento 
% infeccioso, isto �, o tempo m�dio em que um indiv�duo � infecioso. 
% Para a gripe, o per�odo infecioso � tipicamente de 1 a 3 dias. Se o 
% considerarmos igual a 2 dias, por exemplo, isto significa que a taxa de 
% recupera��o � gamma=1/2 (por indiv�duo e por dia) e portanto num dia 
% metade dos infetados recuperam.
%----
% c - diz-se a taxa de contacto per-capita e por unidade de tempo. 
% Pela hip�tese da popula��o homogeneamente misturada c � constante 
% (uma hip�tese muito questionavel!...).
% ----
% beta - taxa de recupera��o
%  beta=cp. A constante beta � chamada o coeficiente de transmiss�o e tem 
% unidades tempo^(?1).

tmax = 15;              %no. de dias 
Tn = 763;              %Tamanho da popula��o 
S = zeros(tmax);        
I = zeros(tmax);
R = zeros(tmax);
S(1) = Tn-1;          %no. inicial de sucept�veis
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
ylabel('Popula��o');

figure(2);
plot(x,S);
title('Sucept�veis');
xlabel('Dias');
ylabel('Popula��o');

figure(3);
plot(x,I);
title('Infectados');
xlabel('Dias');
ylabel('Popula��o');

figure(4);
plot(x,R);
title('Removidos');
xlabel('Dias');
ylabel('Popula��o');
