% Matlab Program # 2
% CTMC SIS Epidemic Model
% Three Sample Paths and the Deterministic Solution
clear
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
        else
            i(j+1)=i(j)-1;
            s(j+1)=s(j)+1;
        end
        j=j+1;
    end
    if k==1
        stairs(t,i,'r-','LineWidth',1)
    elseif k==2
        stairs(t,i,'b-','LineWidth',1)
    else
        stairs(t,i,'g-','LineWidth',1)
    end
    hold on
  end

% Euler’s Method Applied to the Deterministic SIS Epidemic Model
dt=0.01;
y(1)=init;
for k=1:tfim/dt
    y(k+1)=y(k)+dt*(beta*(N-y(k))*y(k)/N-gama*y(k));
end
plot([0:dt:tfim],y,'k--','LineWidth',2);
axis([0,tfim,0,80]);
xlabel('Time');
ylabel('Number of Infectives');

hold off