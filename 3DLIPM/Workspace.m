clear;
clc;
close all;
%% Environment and Model Settings
g = 9.81;
h = 1; % constant height maintained at 1m
dt = 0.001; % Do not tune smaller. This gurantees smooth solving
footStep = 0.2;
timeStep = 0.3; % 0.4s CD for foot placement --- don't step too fast!
thetaTarget = pi/5; % 30deg NE Walking
kp = 1;
%% Solve
% Initial Conditions
p0 = [0; 0]; % "Stance Foot" starts at origin
X = [0; 0; 0; 0.1]; % [initial position; initial velocity] X is the absolute position and velocity of the pendulum bob (COM)
t = 0;
result = [];
while (t < 2)
    % Time Update
    t = t + dt
    % Distrete Dynamics (Foot Placement Switch)
   % Foot Placement Strategy!!!! ==================
   if (t > 1 && t < 1.002)
      p0 = [-0.1; 0.45]; 
   elseif (t > 1.3 && t < 1.302)
       p0 = [0.2; 0.9];
   elseif (t > 1.6 && t < 1.602)
       p0 = [-0.15; 1.4];
   end
%    if (norm(X(1:2)) >= footStep && CD > timeStep)
%       % Compute Velocity Angle
%       thetaV = atan2(X(4), X(3));
%       thetaX = atan2(X(2), X(1));
%       thetaDeviate = kp * (thetaV - thetaTarget);
%       thetaCommand = thetaV + thetaDeviate;
%       p0 = p0 + [(norm(X(1:2)) * 2) * cos(thetaCommand); (norm(X(1:2)) * 2) * sin(thetaCommand)];
%       display('Leg Switch Happens!');
%       X(1:2) = X(1:2) - p0;
%       CD = 0;
%    end
   % ===============================================
   % Continuous Dynamics
   Xdyn = X - [p0; [0; 0]]; % The equivalent X used for dynamics update
   dXdt = [0, 0, 1, 0; 0, 0, 0, 1; g/h, 0, 0, 0; 0, g/h, 0, 0] * Xdyn;
   X = X + dXdt * dt;
   % display(X);
   % Data Store
   result = [result, [t; p0; X]];
   % pause(0.05);
end

%% Visualization
[~, n] = size(result);
figure(1);
plot3(result(4, :), (result(5, :)), ones(1, n) .* h, 'b.');
grid on
axis equal
hold on
plot3(result(2, :), result(3, :), zeros(1, n) .* h, 'r*', 'MarkerSize', 10);
legend('CoM Trajectory', 'Stance Foot Location')
xlabel('x(m)');
ylabel('y(m)');
title('XYZ Plot of the Pendulum Trajectory');

% Velocity Analysis
figure(2);
plot(result(1, :), result(6, :), 'b', 'LineWidth', 2);
hold on
plot(result(1, :), result(7, :), 'r', 'LineWidth', 2);
grid on
xlabel('time(t)');
ylabel('velocity(m/s)');
legend('Vx', 'Vy');
title('Velocity Analysis')

% Phase Plots
figure(3);
sgtitle('Phase Plots')
subplot(2, 1, 1);
plot(result(4, :), result(6, :), 'b.');
grid on
xlabel('x(t)')
ylabel('x_dot(t)')
subplot(2, 1, 2);
plot(result(5, :), result(7, :), 'r.');
grid on
xlabel('y(t)')
ylabel('y_dot(t)')

% Simulation
figure(4);
[~, n] = size(result);
for i = 1 : 10 : n
    display(result(1, i));
    plotPend3D([result(2:3, i); 0], [result(4:5, i); h]);
    grid on
    xlim([-10, 10]);
    ylim([-10, 10]);
    zlim([-0.1, 2.9]);
    xlabel('x(m)');
    ylabel('y(m)');
    zlabel('z(m)');
    title('Simulation of 3D LIPM with Foot Placement')
    figure(4);
end