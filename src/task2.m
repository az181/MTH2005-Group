function graphData = task2(ball, box, usingSubBoxes, subBox, g, vIni, h, totalTime, nColour, moveWalls ,pMax)
    rng(1)  % Ensure same run each time

    tempstd = zeros(2, pMax*2-1);  % Preallocate vector
    for p = 2:2*pMax  % We will use increments of half powers of p
        nx = 4^(p/2);

        graphData = Simulation(nx, ball, box, usingSubBoxes, subBox, g, ...
            vIni, h, totalTime, nColour, moveWalls, false);

        % Get the standard deviation of the temperature
        nrec = 100;  % Consider final 100 recordings of average temperature
        sd = std(graphData.temperature(2, end-nrec+1:end));
        disp("sd = " + sd)

        tempstd(:, p-1) = [nx; sd];
    end
    
    graphData.tempstd = tempstd;
end
