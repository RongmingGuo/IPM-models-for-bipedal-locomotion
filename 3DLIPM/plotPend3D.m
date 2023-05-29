function [] = plotPend3D(po, p)
    % po: the xyz location of the "stance foot", i.e the origin of the
    % Inverted Pendulum
    % p: the xyz location of the bob
    lineData = [po, p];
    plot3(p(1), p(2), p(3), 'k.', 'MarkerSize', 40); % Plot The Bob
    hold on
    plot3(lineData(1, :), lineData(2, :), lineData(3, :), 'k', 'LineWidth', 2);
    hold off
end