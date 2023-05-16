clear all
%características do individuo
%c1: suscetível (0), infectado (1) ou removido (2)
%c2: idade do individuo em anos. Cada iteração aumenta deltat
%c3: idade máxima que o indivíduo viverá (C3 = -mu*ln(rand))
%c4: tempo que o individuo está no estado infectado (em anos)
%c5: tempo máximo de infecção do individuo
caracteristicas = struct('c1',{0},'c2',{0},'c3',{0},'c4',{0});
N=1000;
s0=0.9*N;
i0=0.01*N;
r0=N-s0-i0;
mu=60; %expectativa de vida
dt = 0.1;
dd=2.5;
ni=5*mu/dt;
infec=0.25;

fig=1;
for k=1:s0 %cria os suscetíveis
    Agente(k).c1=0;
    Agente(k).c2=-mu*0.25*log(rand);
    Agente(k).c3=-mu*log(rand);
    Agente(k).c4=0;
    Agente(k).c5=0;
    Idade(k)=Agente(k).c2;
end
for k=s0+1:s0+i0 %cria os infectados
    Agente(k).c1=1;
    Agente(k).c2=-mu*0.25*log(rand);
    Agente(k).c3=-mu*log(rand);
    Agente(k).c4=-dd*0.25*log(rand);
    Agente(k).c5=-dd*log(rand);
    Idade(k)=Agente(k).c2;
end
for k=s0+i0+1:N %cria os removidos
    Agente(k).c1=2;
    Agente(k).c2=-mu*0.25*log(rand);
    Agente(k).c3=-mu*log(rand);
    Agente(k).c4=0;
    Agente(k).c5=0;
    Idade(k)=Agente(k).c2;
end
HG=histogram(Idade);
HG.FaceColor = 'g';
HG.EdgeColor = 'r';
HG.NumBins = 10;
break
%Simulação
S=zeros(1,ni);
Ii=zeros(1,ni);
R=zeros(1,ni);
S(1)=s0;
Ii(1)=i0;
R(1)=r0;

for j=1:ni
    for k=1:N
        %MORTE
        %0,1,2 => 0
        if Agente(k).c2 > Agente(k).c3
            %Torna-se suscetivel
            Agente(k).c1=0;
            %Reinicia o tempo de vida
            Agente(k).c2=0;
            Agente(k).c3=-mu*log(rand(1));
        else
            %INFECCAO
            if Agente(k).c1==0
                %Escolha aleatoria de um individuo
                %se for o mesmo e como nao tivesse encontro
                ind=randi(N,1);
                if ind ~= k %eh o mesmo? Se nao continua
                    if Agente(ind).c1==1
                        if rand(1) > (1-infec)
                            Agente(k).c1=1;
                            Agente(k).c4=0;
                            Agente(k).c5=-dd*log(rand(1));
                        end % if rand(1) > (1-infec)
                    end % if P(ind,1)== 1
                end % if ind ~= kk
            end % if P(kk,1)==0
            %RECUPERACAO
            if Agente(k).c1==1
                if Agente(k).c4 > Agente(k).c5
                    Agente(k).c1=2;
                    Agente(k).c4=0;
                    Agente(k).c5=0;
                else
                    Agente(k).c4=Agente(k).c4+dt;
                end % if I(k).c4==0
            end % if I(k).c1==1
        end % if P(kk,2) > P(kk,3)
        %Individuos envelhecem em dt
        Agente(k).c2=Agente(k).c2+dt;
    end % for j=1:N
    %disp(conta0);
    %disp(conta1);
    %disp(conta2);
    conta0=0;
    conta1=0;
    conta2=0;
    for i=1:N
        if Agente(i).c1==0
            conta0=conta0+1;
        end
        if Agente(i).c1==1
            conta1=conta1+1;
        end
        if Agente(i).c1==2
            conta2=conta2+1;
        end
    end
    disp(conta0);
    disp(conta1);
    disp(conta2);
    %b=input(' ');
    S(j+1)=conta0;
    Ii(j+1)=conta1;
    R(j+1)=conta2;
    %Numero de S, I, R
    %[S(end) Ii(end) R(end) k]
end % for j=1:dt
%Figuras
if fig
    subplot(311),plot(linspace(0,ni*dt,ni+1),S);
    set(gca,'FontName','times','FontSize',14)
    ylabel('S');
    subplot(312),plot(linspace(0,ni*dt,ni+1),Ii);
    set(gca,'FontName','times','FontSize',14)
    ylabel('I');
    subplot(313),plot(linspace(0,ni*dt,ni+1),R);
    set(gca,'FontName','times','FontSize',14)
    ylabel('R');
    xlabel('t')
end
