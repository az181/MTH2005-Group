function [none] = drawGraphs(graphData)
    %% Temperature
    figure(2)
    plot(graphData.temperature(1, :), graphData.temperature(2, :), 'o')
    xlabel('Step Number')
    ylabel('Temperature')
    title('Temperature')

    %% Density
    figure(3)
    plot(graphData.density(1, :), graphData.density(2, :), 'o')
    ylim([0, 0.5])
    xlabel('Step Number')
    ylabel('Density')
    title('Density')
end