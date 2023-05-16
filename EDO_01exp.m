% EDO exponencial
% Equações diferencias -  exponenciais
% José Luiz de Souza Pio
P0=1;
t=0:0.1:10;
k0=0.0;
k1=0.2;
k2=0.4;
k3=0.6;
k4=0.8;
k5=1.0;
k6=1.2;
Pt0=P0*exp(k0*t);
Pt1=P0*exp(k1*t);
Pt2=P0*exp(k2*t);
Pt3=P0*exp(k3*t);
Pt4=P0*exp(k4*t);
Pt5=P0*exp(k5*t);
Pt6=P0*exp(k6*t);
plot(t,Pt0,t,Pt1,t,Pt2,t,Pt3,t,Pt4,t,Pt5,t,Pt6,t,-Pt1,t,-Pt2,t,-Pt3,t,-Pt4,t,-Pt5,t,-Pt6,'LineWidth',2);
axis([0 10 -450 450 ]);