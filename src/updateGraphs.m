function [graphData] = updateGraphs(x, v, box, k, graphData)
    % Draws the relevant graphs. Will currently draw them all on different
    % figures

    %% Temperature
    if mod(k, 20) == 0
        averageTemp = averageTemperature(x, v, box);
        graphData.temperature(:, end+1) = [k, averageTemp];
    end

    %% Density
    if mod(k, 20) == 0
        averageDens = averageDensity(x, box);
        graphData.density(:, end+1) = [k, averageDens];
    end
end

