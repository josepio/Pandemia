function sir = sir_net(states);

sir = zeros(1,3);
for individual = 1:length(states)
    switch states(individual)
        case -1
            sir(3) = sir(3)+1;
        case 0
            sir(1) = sir(1)+1;
        otherwise
            sir(2) = sir(2)+1;
    end;
end;