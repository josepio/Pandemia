%curva epidemica do modelo SI
%Traçado da curva epidêmica
%José Luiz de Souza Pio
beta=0.5;
N=1000;
T=20;
dt=0.125;
I0=100;
S = zeros(1,T/dt);
dS= zeros(1,T/dt);
dI= zeros(1,T/dt);
S(1) = N-I0;
I = zeros(1,T/dt);
I(1) = I0;
dI(1)=I0;
alfa = beta/N;
yI(1)=(alfa*I(1)*(N-I(1)));
    for tt = 1:(T/dt)-1
        dS(tt+1) = (-beta*I(tt)*S(tt)/N);
        dI(tt+1) = (beta*I(tt)*S(tt)/N)
        S(tt+1) = S(tt) + dS(tt)*dt;
        I(tt+1) = I(tt) + dI(tt)*dt;
        yI(tt+1) = (alfa*I(tt+1)*(N-I(tt+1)))
    end
    x=0:dt:T-dt;
    hold on
    plot(x,yI,'LineWidth',2)
    %title('Curva Epidêmica')
    xlabel('t (dias)')
    hold off
    ylabel('dI(t)/dt')