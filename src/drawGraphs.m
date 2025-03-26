function drawGraphs(graphData, doingTask2, doingTask3,aVector)
	 %% Temperature
    figure(2) % Average temperature at each time step
    
    plot(graphData.temperature(1, :), graphData.temperature(end, :), 'o')
    xlabel('Step Number') 
    ylabel('Temperature')
    title('Temperature')

    figure(3)  % Temperature Histogram
    histogram(graphData.temperature(2, :))
    title('Temperature Histogram')
    xlabel('Temperature')

    %% Density
    figure(4)
    plot(graphData.density(1, :), graphData.density(2, :), 'o')
    ylim([0, 0.025])
    xlabel('Step Number')
    ylabel('Density')
    title('Density')

    %% Pressure
    % Calculate the average pressure over every 20 timesteps
    averagePressure = [];
    for i = 1:50:length(graphData.pressure)
        pressureSum = sum(graphData.pressure(2, i:i+19));
        averagePressure(:, end+1) = [i + 10, pressureSum / 20];
    end

    figure(5)  % Plot the pressure
    plot(averagePressure(1, :), averagePressure(2, :), 'o')
    xlabel('Step Number')
    ylabel('Pressure')
    title('Pressure')

    %% Mean Free Path
    figure(6)

    histogram(graphData.distance ./ (1+graphData.collisions))
    title('Mean Free Path')

    % Display the total mean free path
        disp("Overall Mean free path = " + mean(graphData.distance ./ ...
            (1+graphData.collisions)))
        disp("Median Mean free path = " + median(graphData.distance ./ ...
            (1+graphData.collisions)))

    %% Task 2
    if doingTask2
        % Temperature Standard Deviation 
        figure(7)
        plot(graphData.tempstd(1, :), graphData.tempstd(2, :))
        title('Temperature Standard Deviation')
        xlabel('N')
        ylabel('sd(temp)')

        % Temperature standard deviation (log-log plot) 
        figure(10)
        loglog(graphData.tempstd(1, :), graphData.tempstd(2, :))
        title('Temperature Standard Deviation')
        xlabel('log(N)')
        ylabel('log(sd(temp))')
    end

    %% Speed histogram
    figure(8)
    histogram(sqrt(sum((graphData.velocity).^2,1)))
    title('Speed')

    %% Density By height
    figure(9)
    histogram(graphData.ballCountByY)
    title('Density by Height')

    %% Task 3 - plotting a against
    if doingTask3

        % Pressure against a
        figure(51)
        plot(aVector, graphData.t3Pres,'b',linewidth = 2)
        title("Average Pressure between tau3 and tau4 for a = [1,2,4,5,8]",FontSize = 13)
        xlabel("Wall Movement Speed, a",FontSize = 13)
        ylabel("Average Pressure",FontSize = 13)

        % Temperature against a
        figure(52)
        plot(aVector, graphData.t3Temp,'r',linewidth = 2)
        title("Average Temperature between tau3 and tau4 for a = [1,2,4,5,8]",FontSize = 13)
        xlabel("Wall Movement Speed, a",FontSize = 13)
        ylabel("Average Temperature",FontSize = 13)

        % Ratio of Temp:Pres against a
        figure(53)
        plot(aVector,(graphData.t3Temp./graphData.t3Pres),'black',linewidth = 2)
        title("Average Temperature/Average Pressure for a = [1,2,4,5,8]",FontSize = 13)
        % axis([1 8 10 15]) % this produses an asetic graph for p = 4 
        xlabel("Wall Movement Speed, a",FontSize = 13)
        ylabel("Average Temperature/Average Pressure",FontSize = 13)
    end

end
