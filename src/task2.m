function graphData = task2(ball, box, usingSubBoxes, g, vIni, h, totalTime, nColour, moveWalls ,pMax)
    % Calculate standard deviation of temperatures for different N
    
    rng(1)  % Ensure same run each time
    
    tempstd = zeros(2, pMax*2-1);  % Preallocate vector
    
    for p = 2:2*pMax  % We will use increments of half powers of p
        clf
        nx = 4^(p/2); % Number of particles for each iteration
        
        U = 10*sqrt(nx) ; % top right corner of box is (U, U)
        subSize = ceil(U/10);  % Number of sub boxes adjusts with box size
        box.up = U;
        box.right = U;
        subBox = struct('x', subSize, 'y', subSize); 

        % Run simulation
        graphData = Simulation(nx, ball, box, usingSubBoxes, subBox, g, ...
            vIni, h, totalTime, nColour, moveWalls);
    
        % Get the standard deviation of the temperature
        nrec = 100;  % Consider final 100 recordings of average temperature
        sd = std(graphData.temperature(2, end-nrec+1:end));
        disp("sd = " + sd)
    
        tempstd(:, p-1) = [nx; sd]; % Store number of particles and sd
    end
    
    graphData.tempstd = tempstd; % Add sd to graph data
end
