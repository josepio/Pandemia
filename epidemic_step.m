function new_states = epidemic_step(old_states, graph, disease, k);

infectiousness = zeros(length(old_states),1);
for individual = 1:length(old_states)
    if (old_states(individual) > 0)
        infectiousness(individual) = disease(old_states(individual));
    end;
end;
prob = (graph*infectiousness)*k;
for individual = 1:length(old_states)
    if (old_states(individual) > 0)
        if (old_states(individual) == length(disease))
            new_states(individual) = -1;
        else
            new_states(individual) = old_states(individual) + 1;
        end;
    else
        if (old_states(individual) == 0)
            if (rand<prob(individual))
                new_states(individual) = 1;
            else
                new_states(individual) = 0;
            end;
        else
            new_states(individual) = -1;
        end;
    end;
end;