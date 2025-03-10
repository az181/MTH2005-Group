function [none] = drawGraphs(graphData)
    %% Temperature
    figure(2)
    plot(graphData.temperature(1, :), graphData.temperature(end, :), 'o')
    xlabel('Step Number')
    ylabel('Temperature')
    title('Temperature')

    figure(3)  % Temperature Histogram
    histogram(graphData.temperature(2, :))
    title('Temperature Histogram')
    xlabel('Temperature')

    %%%%%% MOve nrec somewhere else
    nrec = 100;
    sd = std(graphData.temperature(2, end-nrec+1:end));
    disp("sd = " + sd)

    %% Density
    figure(5)
    plot(graphData.density(1, :), graphData.density(2, :), 'o')
    ylim([0, 0.5])
    xlabel('Step Number')
    ylabel('Density')
    title('Density')

    %% Mean Free Path
    figure(6)
    % TODO: Do this
end