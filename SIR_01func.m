function SIR_01(S0, I0, R0, a, d, lambda, beta, m, alpha1, alpha2, r, tmax)

%S0     - No. inicial de suceptíveis
%I0     - No. inicial de infectados
%R0     - No. inicial de removidos
%a      -
%d      - 
%lambda -
%beta   -
%m      -
%alpha1 -
%alpha2 -
%r      -
%tmax   -

S=zeros(1,tmax);
I=zeros(1,tmax);
R=zeros(1,tmax);
S(1)=S0;
I(1)=I0;
R(1)=R0;
T(1)=0;
for t=1:1:tmax-1
    T(t+1)=t;
    S(t+1)=S(t)+(a-d*S(t)-(lambda*S(t)*I(t)/(1+alpha1*I(t)+alpha2*I(t)^2))+beta*R(t));
    I(t+1)=I(t)+((lambda*S(t)*I(t)/(1+alpha1*I(t)+alpha2*I(t)^2))-(d+m+r)*I(t));
    R(t+1)=R(t)+(m*I(t)-(d+beta)*R(t)+r*I(t));
end
plot(T,S,T,I,T,R);
title('SIR Model');
legend('S(t)','I(t)','R(t)');
xlabel('time, t');
ylabel('Population');
end