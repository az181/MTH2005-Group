function [None] = updateGraphs(x, v, box, k)
    % Draws the relevant graphs. Will currently draw them all on different
    % figures

    %% Temperature
    if mod(k, 50) == 0

    figure(2)
    drawnow limitrate
    hold on
    averageTemp = averageTemperature(x, v, box);
    axis = gca;
    if isempty(get(axis, 'Children'))
        scatter(k, averageTemp);
    end
    graph = get(axis, 'Children');
    xData = get(graph, 'XData');
    xData(end + 1) = k;
    yData = get(graph, 'YData');
    yData(end + 1) = averageTemp;
    set(graph,'XData',xData,'YData', yData, 'Marker', 'o')
    end
end

