%tracado de uma funcao impl�cita
%Lemniscata

clearvars;
f = @(x,y) (x^2+y^2)^2 - (x^2-y^2)^2;
fimplicit(f)