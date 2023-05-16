% Birth and Death Process
clear all
n0=2; b=2; d=1; % Initial value and parameters
t=[0:.1:5];
y=n0*exp((b-d).*t);% Deterministic solution
plot(t,y,'k--','Linewidth',2);
axis([0,5,0,50]);
hold on
for k=1:4 % Four Sample Paths, Gillespie algorithm
    clear t x
    t(1)=0; x(1)=n0;
    j=1;
    while x(j)>0 & x(j)<50 % Stop hits zero or reaches size=50
        u1=rand; u2=rand; % Two uniform random numbers
        t(j+1)=-log(u1)/(b*x(j)+d*x(j))+t(j); %Time to next event
        if u2<b/(b+d)
            x(j+1)=x(j)+1; % Birth
        else
            x(j+1)=x(j)-1; % Death
        end
        j=j+1;
    end
    if k==1
        stairs(t,x,'y-','Linewidth',2);
    end
    if k==2
        stairs(t,x,'b-','Linewidth',2);
    end
    if k==3
        stairs(t,x,'g-','Linewidth',2);
    end
        if k==4
        stairs(t,x,'r-','Linewidth',2);
    end
end
xlabel('Time');
ylabel('Population Size');
hold off