function [] = plot2DPend(xo, x, yh)
    % Only Plotting -- need post-editing
    % xo: x-axis location of the new center
    % x: the relative x with respect to the new center
    plot((xo + x), yh, 'k.', 'MarkerSize', 40);
    hold on
    plot([xo, xo + x], [0, yh], 'k', 'LineWidth', 2);
    hold off
end