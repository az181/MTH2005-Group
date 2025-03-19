function drawGraphs(graphData)
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

    % s = size(graphData.tempstd);
    % if s(1) == 1
    %     nrec = 100;
    %     sd = std(graphData.temperature(2, end-nrec+1:end));
    %     graphData.tempstd = sd;
    %     disp("sd = " + sd)
    % end

    %% Density
    figure(4)
    plot(graphData.density(1, :), graphData.density(2, :), 'o')
    ylim([0, 0.025])
    xlabel('Step Number')
    ylabel('Density')
    title('Density')

    %% Pressure
    figure(5)
    % Calculate the average pressure over every 20 timesteps
    averagePressure = [];
    for i = 1:50:length(graphData.pressure)
        pressureSum = sum(graphData.pressure(2, i:i+19));
        averagePressure(:, end+1) = [i + 10, pressureSum / 20];
    end

    % Actually plot the pressure
    plot(averagePressure(1, :), averagePressure(2, :), 'o')
    xlabel('Step Number')
    ylabel('Pressure')
    title('Pressure')

    %% Mean Free Path
    figure(6)

    histogram(graphData.distance ./ graphData.collisions)
    title('Mean Free Path')

    %% Temperature Standard Deviation (if possible)
    figure(7)
    title('Temperature Standard Deviation')
    xlabel('log(N)')
    ylabel('log(sd(temp))')
    
    % plot(log(graphData.tempstd(1, :)), log(graphData.tempstd(2, :)))
    loglog(graphData.tempstd(1, :), log(graphData.tempstd(2, :)))
end