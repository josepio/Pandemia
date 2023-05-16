%function [S,I,R]=mbi(N,dt,dd,mu,ni,infec,S0,I0,R0,fig)
clear all;
%Exemplo
N=1000;
dt=0.1;
dd=25*dt;
mu=60;
ni=5*mu/dt;
infec=0.25;
S0=0.9*N
I0=0.01*N
R0=N-S0-I0
fig=1;
%[S,I,R]=mbi(N,dt,dd,mu,ni,infec,S0,I0,R0,fig);
%Populacao inicial
P=[zeros(S0,1); ones(I0,1); 2*ones(R0,1)];
P(:,2)=-mu*0.25*log(rand(N,1));
P(:,3)=-mu*log(rand(N,1));
indf=find(P(:,1)==1);
nindf=length(indf);
P(indf,4)=-dd*0.25*log(rand(nindf,1));
P(indf,5)=-dd*log(rand(nindf,1));
%Numero de S,I,R - incial
S(1)=length(find(P(:,1)==0));
I(1)=length(find(P(:,1)==1));
R(1)=length(find(P(:,1)==2));
%Processo iterativo
for k=1:ni
%Inicio dos individuos
    for kk=1:N
        %MORTE
        %0,1,2 => 0
        if P(kk,2) > P(kk,3)
            %Torna-se suscetivel
            P(kk,1)=0;
            %Reinicia o tempo de vida
            P(kk,2)=0;
            P(kk,3)=-mu*log(rand(1));
        else
            %INFECCAO
            if P(kk,1)==0
                %Escolha aleatoria de um individuo
                %se for o mesmo e como nao tivesse encontro
                ind=randi(N,1);
                if ind ~= kk %eh o mesmo? Se nao continua
                    if P(ind,1)==1
                        if rand(1) > (1-infec)
                            P(kk,1)=1;
                            P(kk,4)=0;
                            P(kk,5)=-dd*log(rand(1));
                        end % if rand(1) > (1-infec)
                    end % if P(ind,1)== 1
                end % if ind ~= kk
            end % if P(kk,1)==0
            %RECUPERACAO
            if P(kk,1)==1
                if P(kk,4)>P(kk,5)
                    P(kk,1)=2;
                    P(kk,4:5)=0;
                else
                    P(kk,4)=P(kk,4)+dt;
                end % if P(kk,4)=0
            end % if P(kk,1)=0
        end % if P(kk,2) > P(kk,3)
        %Individuos envelhecem em dt
        P(kk,2)=P(kk,2)+dt;
    end % for kk=1:N
    %Numero de S, I, R
    S(k+1)=length(find(P(:,1)==0));
    I(k+1)=length(find(P(:,1)==1));
    R(k+1)=length(find(P(:,1)==2));
    [S(end) I(end) R(end) k]
end % for k=1:dt
%Figuras
if fig
    subplot(311),plot(linspace(0,ni*dt,ni+1),S);
    set(gca,'FontName','times','FontSize',14)
    ylabel('S');
    subplot(312),plot(linspace(0,ni*dt,ni+1),I);
    set(gca,'FontName','times','FontSize',14)
    ylabel('I');
    subplot(313),plot(linspace(0,ni*dt,ni+1),R);
    set(gca,'FontName','times','FontSize',14)
    ylabel('R');
    xlabel('t')
end