hold on
beta=0.5;
N=1000;
T=20;
dt=0.0625;
I0=50;
S = zeros(1,T/dt);
S(1) = N-I0;
I = zeros(1,T/dt);
I(1) = I0;
    for tt = 1:(T/dt)-1
        dS = (-beta*I(tt)*S(tt)/N);
        dI = (beta*I(tt)*S(tt)/N);
        S(tt+1) = S(tt) + dS*dt;
        I(tt+1) = I(tt) + dI*dt;
    end
     x=0:dt:T-dt;
    hold on
    figure(1)
    plot(x,S,'m','LineWidth',2)
    %title('Suscetíveis')
    xlabel('t (dias)')
    ylabel('No. de indivíduos')
    figure(2)
    hold on
    plot(x,I,'r','LineWidth',2)
    %title('Infectados')
    xlabel('t (dias)')
    ylabel('No. de indivíduos')
    figure(3)
    plot(x,S,x,I,'LineWidth',2)
    %title('Modelo SI sem Dinâmica Vital')
    xlabel('t (dias)')
    ylabel('No. de indivíduos')
    figure(5)
    hold on
    subplot(2,1,1);plot(x,S,'m','LineWidth',2); title('Suscetíveis');xlabel('t (dias)');ylabel('Indivíduos');subplot(2,1,2);plot(x,I,'r','LineWidth',2); title('Infectados');xlabel('t (dias)');ylabel('Indivíduos');
    hold off