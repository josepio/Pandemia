% Model parameters
beta = 3.4*10^-7; % rate of infection
gamma = 0.45; % rate of recovery (try also 0.07)
delta = 0.0; % rate of immunity loss
N = 3*10^6; % Total population N = S + I + R
I0 = 30; % initial number of infected
T = 60; % period of 300 days
dt = 1/4; % time interval of 6 hours (1/4 of a day)
fprintf('Value of parameter R0 is %.2f',N*beta/gamma)

% Calculate the model
[S,I,R] = sir_model(beta,gamma,delta,N,I0,T,dt);
% Plots that display the epidemic outbreak
tt = 0:dt:T-dt;
% Curve
plot(tt,S,'b',tt,I,'r',tt,R,'g','LineWidth',2); grid on;
xlabel('Dias'); ylabel('Numero de Individuos');
legend('S','I','R');

