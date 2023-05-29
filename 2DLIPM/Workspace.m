%% Envrionmental Constants
g = 9.81;
dt = 0.01; % Solver Accuracy
%%  Hybrid Dynamics With Trivial Foot Placement Plan
stepLength = 0.4;
xdot = 0.5;
t = 0;
% Initial Condition
t = 0;
xo = 0;
yh = 1;
x = 0;
X = [x; xdot];

% Result
result = []; % [time; xo; x(realtive)]
while (t < 10) % 10s Simulation Time
    display(X);
    % Discrete Dynamics Change
    if (X(1) >= stepLength/2)
       display('New Step!');
       xo = xo + 2 * X(1);
       X(1) = - X(1);
    end
    % Continuous Dynamics
    dXdt = [X(2); g/yh * X(1)];
    X = X + dXdt * dt;
    t = t + dt;
    % Result
    result = [result, [t; xo; X]];
    %pause(0.02);
end

%% Analysis
% Simulation
figure(1);
[~, n] = size(result);
for i = 1 : n
    i
    plot2DPend(result(2, i), result(3, i), yh);
    grid on
    axis equal
    ylim([-0.1, 1.9]);
    xlim([0, 5]);
    title('Simulation Visualization');
    xlabel('x(m)');
    ylabel('y(m)');
    figure(1);
end
% Velocity V.s Time
figure(2);
plot(result(1, :), result(4, :), 'r', 'LineWidth', 1.5);
grid on
axis equal
xlabel('Time(t)');
ylabel('COM Velocity(m/s)');
title('Velocity v.s Time Analysis');
