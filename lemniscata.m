%tracado de uma funcao implícita
%Lemniscata

clearvars;
f = @(x,y) (x^2+y^2)^2 - (x^2-y^2)^2;
fimplicit(f)