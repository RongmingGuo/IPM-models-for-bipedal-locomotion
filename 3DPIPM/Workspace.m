%%
clear;
clc;
close all;
%% Environment and Setup Variablees
g = 9.81;
m = 5;
% Simulation
dt = 0.001; % Accuracy
tTotal = 3; % Total Simulation Time
result = [];
% PD Pendulum Height Controller
kp = 100;
kd = 20;
% Initial Conditions
pStance = zeros(3, 1);
X = [-0.3; 0.25; 0.8; 0.4; -0.4; 0];
t = 0;
rDesire = 1; % 1.5m original length spring
%% Dynamics
while (t <= tTotal)
    % Discretee Update Policy ============
%     if (t > 1.5 && t < 1.502)
%        pStance = [0.4; -0.4; 0]; 
%     end
    % ====================================
    Xdyn = X(1:3)- pStance;
    % Prismatic Joint Control
    r = norm(Xdyn);
    drdt = ((Xdyn(1) * X(4) + Xdyn(2) * X(5) + Xdyn(3) * X(6))) / r;
    F = kp * (rDesire - r) - kd * drdt;
    disp(F);
    % Continuous Dynamics
    Fp = F * (Xdyn / norm(Xdyn));
    zdotdot = (Fp(3) - m * g) / m;
    xdotdot = (Xdyn(1)/Xdyn(3)) * zdotdot;
    ydotdot = (Xdyn(2)/Xdyn(3)) * zdotdot;
    dXdt = zeros(6, 1);
    dXdt(1:3) = X(4:6);
    dXdt(4:6) = [xdotdot; ydotdot; zdotdot];
    X = X + dXdt * dt;
    t = t + dt;
    % Result Store
    result = [result, [t; pStance; X]];    
end

%% Plot Analysis
% Trajeectory
figure(1);
plot3(result(5, :), result(6, :), result(7, :), 'b.');
grid on
axis equal
xlim([-2, 2]);
ylim([-2, 2]);
zlim([-0.1, 3.9]);
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
title('Trajectory of 3D PIPM')

% Velocity
figure(3);
plot(result(1, :), result(8, :), 'b');
hold on
plot(result(1, :), result(9, :), 'r');
plot(result(1, :), result(10, :), 'k');
grid on
xlabel('Time(t) [s]')
ylabel('Veelocity(v) [m/s]')
legend('vx', 'vy', 'vz');
% Phasee

% Simulation
figure(4);
[~, n] = size(result);
for i = 1 : 10 : n
    display(result(1, i));
    plotPIPM(result(2:4, i), result(5:7, i));
    grid on
    xlim([-2, 2]);
    ylim([-2, 2]);
    zlim([-0.1, 1.9]);
    xlabel('x(m)');
    ylabel('y(m)');
    zlabel('z(m)');
    title('Simulation of 3D PIPM with PD Control of Prismatic Actuation')
    figure(4);
end
