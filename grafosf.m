%Rede sem escala
%José Luiz de Souza Pio

N=20;
d=3;
graph = zeros(N,N);
placed = zeros(N,1);
rotulo = 1;

for i = 1:(d+1)
    for j = (i+1):(d+1)
        graph(i,j) = 1;
        graph(j,i) = 1;
    end;
    placed(i) = 1;
end;

for i = (d+2):N
    for l = 1:(d/2)
        prob = (graph*placed).*placed.*(ones(N,1)-graph(:,i));
        prob = prob/(ones(1,N)*prob);
        s = rand;
        m = 1;
        while (s>prob(m))
            s = s-prob(m);
            m = m+1;
        end;
        graph(m,i) = 1;
        graph(i,m) = 1;
    end;
    placed(i) = 1;
end;
graph = sparse(graph);
plota_grafo(N,d,rotulo,graph);




%graph = sparse(graph);