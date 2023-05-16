%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For more details of this code
% see
% Erik Cuevas, An agent-based model to evaluate the COVID-19 transmission
% risks in facilities, Computers in Biology and Medicine, Volume 121June 
% 2020Article 103827
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
% Population of susceptible
Agents=200;
% Number of infected in the population
Infected=1;
% Total number of agents (susceptible + infected)
Total=Agents+Infected;
%Maximum number of iteration simulated
maxim=1000;
% Distance of contagious
h=4;
% Probability of Trasmission
PrInf=0.2;  %0.2
% Sick in the population
Sick=zeros(1,maxim);
Anterior=0;
% Local movement size
S=2;
% Size of the facility
range=[0 300 0 300];
xrange=range(2)-range(1);
yrange=range(4)-range(3);
% The position of each agent is randomly initialized
xn=rand(1,Agents)*xrange+range(1);
yn=rand(1,Agents)*yrange+range(3);
% Each person is initialized with a probability of trasmission
% It refers to a different susceptibility
% The probability of contagious is from 0.1 to 0.3
rangeI=[0.1 0.3];
rangeP=rangeI(2)-rangeI(1);
ProbPer=rand(1,Total)*rangeP+rangeI(1);
% Each person is initialized with a probability of mobility
% It models the movement of the person in the facility
rangeM=[0.2 0.4];
rangePM=rangeM(2)-rangeM(1);
ProbPos=rand(1,Total)*rangePM+rangeM(1);
 
% Two vectors for the simulation
% People stores the current population
% PeopleN the next population
 
People=zeros(Total,3);
PeopleN=zeros(Total,3);
 
% Store person poition of not infected 
People(1:Agents,1)=xn;
People(1:Agents,2)=yn;
People(1:Agents,3)=0;
 
xn=rand(1,Infected)*xrange+range(1);
yn=rand(1,Infected)*yrange+range(3);
% Store person poition of infected
People(Agents+1:Agents+Infected,1)=xn;
People(Agents+1:Agents+Infected,2)=yn;
People(Agents+1:Agents+Infected,3)=1;
 
% The simulation starts
 
for gen=1:maxim
  % register the number of infected 
  Sick(gen)=sum(People(:,3));
  
  % Register number of infected per iteration
  Rate(gen)=Sick(gen)-Anterior;
  
  % Distance of all individuals in the facility
    X(:,1)=People(:,1);
    X(:,2)=People(:,2);
     Y = pdist(X);
    Z = squareform(Y);
    
for id=1:Total
 
 % check if the individual is not infected
 % Therefore, it can infect
 if (People(id,3)==0)
    
% the distance with itself is set to a large number
% in order to avoid false small distance
Ab=Z(:,id);
Ab(id)=1000;
%check if one or more individual al close
indice=find(Ab<=h);
% Check if it is an infected
indiceM=find(People(indice,3));
 % If it is not infected or there is not close element
  if ((isempty(indice))||(isempty(indiceM)))
      PeopleN(id,3)=0;
      if (rand<=ProbPos(id))
        if (rand<=0.8) % Probability of small movements
          xn=People(id,1)+randn*S;  
          yn=People(id,2)+randn*S; 
          if xn<range(1)
              xn=range(1);
          end
          if xn>range(2)
              xn=range(2);
          end
            if yn<range(3)
              yn=range(3);
          end
          if yn>range(4)
              yn=range(4);
          end   
          PeopleN(id,1)=xn;
       PeopleN(id,2)=yn;
        
        else    
          xn=rand*xrange+range(1); % Large movement
       yn=rand*yrange+range(3);   
       PeopleN(id,1)=xn;
       PeopleN(id,2)=yn;
        end
      else
        PeopleN(id,1)=People(id,1);
        PeopleN(id,2)=People(id,2);
      end
  else
      if (rand<=ProbPer(id)) % There is a infected very close
      PeopleN(id,3)=1;  % The probability of infection is ProbPer(id)
      PeopleN(id,1)=People(id,1); % For individual d
       PeopleN(id,2)=People(id,2);
      else
      PeopleN(id,3)=0;
      PeopleN(id,1)=People(id,1);
       PeopleN(id,2)=People(id,2);
      end
  end
  
 end
 
 if (People(id,3)==1)  % It is an infected individual
     PeopleN(id,3)=1;
     if (rand<=ProbPos(id))
       if (rand<=0.8)
          xn=People(id,1)+randn*S;  
          yn=People(id,2)+randn*S; 
          if xn<range(1)
              xn=range(1);
          end
          if xn>range(2)
              xn=range(2);
          end
            if yn<range(3)
              yn=range(3);
          end
          if yn>range(4)
              yn=range(4);
          end   
          PeopleN(id,1)=xn;
       PeopleN(id,2)=yn; 
        else    
          xn=rand*xrange+range(1);
       yn=rand*yrange+range(3);   
       PeopleN(id,1)=xn;
       PeopleN(id,2)=yn;
        end
       
      else
        PeopleN(id,1)=People(id,1);
        PeopleN(id,2)=People(id,2);
    end
 end
 
 
 
end
 
 People=PeopleN;
 
% the Spatiotemporal status of the population is displayed 
 for in=1:Total
  if People(in,3)==0
      plot(People(in,1),People(in,2),'o','markersize',10,'markerfacecolor','b');
      hold on
  else
       plot(People(in,1),People(in,2),'o','markersize',10,'markerfacecolor','r');
       hold on
  end
  
    
 end
title('Processo Epaçotemporal de Infecção')
drawnow;
hold off
 
 end
 
% Display the general results of the simulation 
 
Anterior=Sick(gen);
 
 
 
maxE=max(Sick);
ME=Sick/maxE;
 
genC=1:maxim;
genC=(genC)/maxim;
 
Knee=ME-genC;
 
[M,I]=max(Knee);
DE = diff(Sick);
 
figure
plot(Sick)
title('Número Total de Infectados')
hold on
plot(I,Sick(I),'o')
title('Ponto Final do Surto')
figure
stem(DE)
title('Numero de Infectados por Interação')
figure
plot(Knee)
title('onto de Saturação')
