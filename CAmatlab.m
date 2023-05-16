% Simulate the spreading model of the virus in Matlab
%  Value establishment
M=100;              %  Size 
beta=0.05;          %  Infection rate
gama=0.01;          %  immunity 
%  Build grid
y = zeros(M, M);    %  The meaning of the grid x element is: 0Is a healthy person,1Make the infected,2Immunized
%  Set the initial grid x, there is a circle of infected persons in the center of the grid, the radius is10Cells
for i=1:M
    for j=1:M
        dxx = i-M/2;
        dyy = j-M/2;
        d = sqrt(dxx*dxx+dyy*dyy);
        if ( d<10 )
            y(i,j)=1;
        end
    end
end
%  Define the community, which is the nearest8Neighbors
lingju = [-1 -1; 0 -1; 1 -1; 1 0; 1 1; 0 1; -1 1; -1 0];
%  Create a new window
figure
hold on
%  Main loop, iteration time variable t
for t=1:100000
    %  Traverse all cells in grid x, for index i 1From n and j from1To n
    for i=1:M
        for j=1:M
            %  Move back and forth between neighbors to spread disease
            for k=1:8
                i2 = i+lingju(k, 1);
                j2 = j+lingju(k, 2);
                %  Check if the cell is inside the grid boundary
                if ( i2>=1 && j2>=1 && i2<=M && j2<=M )
                    %If the cell is in a susceptible state and neighboring cells
                    %  The probability of being infected to spread infection is beta
                    if ( y(i,j)==0 && y(i2, j2)==1 )
                        if ( rand<beta )
                            y(i,j) = 1;
                        end
                    end
                end
            end
            %  If the infected person can recover from the disease with the probability of gamma
            if ( y(i,j)==1 && rand<gama )
                y(i,j) = 2;
            end
        end
    end
    %  Dynamic simulation
    clf
    imagesc(y, [0 2])                   %  Grid display
    pause(0.01)                         %  time out0.01s
    colormap([1 0 1; 1 1 0; 1 1 1]);    %  definition0?1?2Corresponding colors
    %  If there are no more infected people, stop the simulation
    if ( sum(y==1)==0 )
        break;
    end
end
%