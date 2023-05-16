% Agentes atua��o espacial - Pio
clear all
clear all
%caracter�sticas do individuo
%c1: suscet�vel (0), infectado (1) ou removido (2)
%c2: idade do individuo em anos. Cada itera��o aumenta deltat
%c3: idade m�xima que o indiv�duo viver� (C3 = -mu*ln(rand))
%c4: tempo que o individuo est� no estado infectado (em anos)
%c5: tempo m�ximo de infec��o do individuo
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
for k=1:s0 %cria os suscet�veis
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