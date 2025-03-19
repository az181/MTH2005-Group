function graphData = task2(ball, box, usingSubBoxes, subBox, g, vIni, h, totalTime, nColour, pMax)
    rng(1)  % Ensure same run each time
    tempstd = [];
    for p = 1:2*pMax
        nx = 4^(p/2);
        graphData = Simulation(nx, ball, box, usingSubBoxes, subBox, g, ...
            vIni, h, totalTime, nColour, false);
        tempstd(:, end+1) = [nx; graphData.tempstd];
    end
    
    graphData.tempstd = tempstd;
end