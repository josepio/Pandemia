function history = epidemic(initstates,graph,disease,k);

states = initstates;
count = sir(states);
history = count;
while (count(2)>0)
    states = epidemic_step(states,graph,disease,k);
    count = sir_net(states);
    history(length(history(:,1))+1,:) = count;
end;