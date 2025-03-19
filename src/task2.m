function graphData = task2(ball, box, usingSubBoxes, subBox, g, vIni, h, totalTime, nColour, pMax)
    rng(1)  % Ensure same run each time
    tempstd = zeros(2, pMax*2-1);
    for p = 2:2*pMax
        nx = 4^(p/2);
        graphData = Simulation(nx, ball, box, usingSubBoxes, subBox, g, ...
            vIni, h, totalTime, nColour, false);

        nrec = 100;
        sd = std(graphData.temperature(2, end-nrec+1:end));
        disp("sd = " + sd)

        tempstd(:, p-1) = [nx; sd];
    end
    
    graphData.tempstd = tempstd;
end
