%meet.google.com/pnz-pbpg-dxo
beta=1.68; %modelo da SIRdengue.pdf
gama=0.44;
N= 763;
T=15;
dt=1;
I0=1;
S = zeros(1,T/dt);
S(1) = N-I0;
I = zeros(1,T/dt);
I(1) = I0;
data =[0 3	7	22	78	233	300	256	233	189	128	72	33	11	6];
R = zeros(1,T/dt);
    for tt = 1:(T/dt)-1
        dS = (-beta*I(tt)*S(tt)/N);
        dI = (beta*I(tt)*S(tt)/N - gama*I(tt));
        dR =  gama*I(tt);
        S(tt+1) = S(tt) + dS;
        I(tt+1) = I(tt) + dI;
        R(tt+1) = R(tt) + dR;
    end
    s=S/N;
    i=I/N;
    r=R/N;
    x=0:dt:T-dt;
    figure(1)
    %hold on
    %plot(x,S,'m','LineWidth',2)
    plot(x,S,'mo')
    %title('Suscetíveis')
    xlabel('tempo (dias)')
    ylabel('No. de indivíduos')
    figure(2)
    %plot(x,I,'r','LineWidth',2)
    plot(x,I,'ro',x,data,'bo')
    %title('Infectados')
    xlabel('tempo (dias)')
    ylabel('No. de indivíduos')
    figure(3)
    plot(x,R,'b','LineWidth',2)
    %title('Removidos')
    xlabel('tempo (dias)')
    ylabel('No. de indivíduos')
    figure(4)
    plot(x,S,x,I,x,R,'LineWidth',2)
    %title('Modelo SIR sem Dinâmica Vital')
    xlabel('tempo (dias)')
    ylabel('No. de indivíduos')
    figure(5)
    subplot(3,1,1);plot(x,S,'m','LineWidth',2); title('Suscetíveis');xlabel('tempo (dias)');ylabel('Indivíduos');subplot(3,1,2);plot(x,I,'r','LineWidth',2); title('Infectados');xlabel('tempo (dias)');ylabel('Indivíduos');subplot(3,1,3);plot(x,R,'b','LineWidth',2);title('Removidos');xlabel('tempo (dias)');ylabel('Indivíduos');
    %subplot(3,1,1);plot(x,S,'m','LineWidth',2); title('Suscetíveis');xlabel('tempo (dias)');ylabel('Indivíduos');subplot(3,1,2);plot(x,I,'r','LineWidth',2); title('Infectados');xlabel('tempo (dias)');ylabel('Indivíduos');subplot(3,1,3);plot(x,R,'b','LineWidth',2);title('Removidos');xlabel('tempo (dias)');ylabel('Indivíduos');
    %figure(6)
    %xn=0:1/(T-1):1;
    %plot(xn,s,xn,i,xn,r);
    %hold off