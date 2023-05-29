function [] = plotPIPM(pStance, p)
    % Rod
    rodLine = [pStance, p];
    % Plot bob
    plot3(p(1), p(2), p(3), 'k.', 'MarkerSize', 30);
    hold on
    plot3(rodLine(1, :), rodLine(2, :), rodLine(3, :), 'k', 'LineWidth', 1);
    % hold off
end