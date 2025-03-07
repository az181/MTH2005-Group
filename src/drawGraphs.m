function [none] = drawGraphs(graphData)
    %% Temperature
    figure(2)
    plot(graphData.temperature(1, :), graphData.temperature(2, :), 'o')

    %% Density
    figure(2)
    plot(graphData.density(1, :), graphData.density(2, :), 'o')
    ylim([0, 0.5])
end