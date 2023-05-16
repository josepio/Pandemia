% Matlab Program # 3
% CTMC SIR Epidemic Model
% Three Sample Paths and the Deterministic Solution
clear all
clf
set(0,'DefaultAxesFontSize', 10);
set(gca,'fontsize',10);
beta=1;
gama=0.5;
R0=beta/gama
N=100;
init=2;
tfim=25;
sim=3;
for k=1:sim
    clear t s i
    t(1)=0;
    i(1)=init;
    s(1)=N-i(1);
    r(1)=0;
    j=1;
    while i(j)>0 & t(j)<tfim
        a=(beta*i(j)*s(j))/N;
        b=gama*i(j);
        p1=a/(a+b); %prob. de infecção
        p2=b/(a+b); %prob. 
        u1=rand; % gera um número aleatório
        u2=rand; % gera um número aleatório
        t(j+1)=t(j)-log(u1)/(a+b);
        if u2 > 0 & u2 <= p1
            i(j+1)=i(j)+1;
            s(j+1)=s(j)-1;
            r(j+1)=r(j);
        else
            i(j+1)=i(j)-1;
            s(j+1)=s(j);
            r(j+1)=r(j)+1;
        end
        j=j+1;
    end
    figure(1)
    clc
    hold on
    if k==1
        stairs(t,i,'r-','LineWidth',1)
    elseif k==2
        stairs(t,i,'b-','LineWidth',1)
    elseif k==3
        stairs(t,i,'g-','LineWidth',1)
    end
        xlabel('t (dias)');
        ylabel('No. Infectados');
     hold off
        figure(2)
        clc
        hold on
        if k==1
        stairs(t,s,'r-','LineWidth',1)
    elseif k==2
        stairs(t,s,'b-','LineWidth',1)
    elseif k==3
        stairs(t,s,'g-','LineWidth',1)
    end
        xlabel('t (dias)');
        ylabel('No. Suscetíveis');
        hold off
        figure(3)
        clc
        hold on
        if k==1
        stairs(t,r,'r-','LineWidth',1)
    elseif k==2
        stairs(t,r,'b-','LineWidth',1)
    elseif k==3
        stairs(t,r,'g-','LineWidth',1)
    end
        xlabel('t (dias)');
        ylabel('No. Removidos')
        hold off
end