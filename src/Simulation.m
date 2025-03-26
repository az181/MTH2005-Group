
function graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour, wallsMove, isCalculatingPressure)

    % needs to be changed in the end
    tau1 = 20;        % Let system settle
    tau2 = totalTime; % Final time
    
    %% Initial setup
    timeSteps = totalTime/h ;                   % Number of steps
    xNow=[box.left + rand(1,nx)*(box.right-box.left);...
        box.low + rand(1,nx)*(box.up-box.low)]; % Particle positions
    vNow = vIni*2*(rand(2,nx)-0.5) ;             % Particle velocity
    collisionCountTotal = zeros(size(nx,2),1);  % Preallocate
    ballCountByY = zeros(subBox.y,1);           % Preallocate
    currentPressureByY = zeros(subBox.y,1);     % Preallocate 
    currentTempreterByY = zeros(subBox.y,1);

    
    %% Create simulation figure
    hold on
    ballplot = scatter(xNow(1,:),xNow(2,:),10,'Filled') ;       % Setup box
    wall = plot([box.left box.right],[box.up box.up],'black') ; % Plot wall
    hold off
    
    grid on
    xticks(0:box.right/subBox.x:box.right)    % Standardise x axis ticks
    yticks(0:box.right/subBox.y:box.up)       % Standardise y axis ticks
    
    axis([box.left box.right box.low box.up]) % Scale figure to box size
    axis square
    
    %% Create graphData structure - holds information for creating graphs
    graphData = struct(...
        'temperature', [], ...
        'density', [], ...
        'distance', zeros(1, length(xNow)), ...
        'oldPosition', xNow, 'collisions', ...
        zeros(1, length(collisionCountTotal)), 'pressure', [], ...
        'tempstd', 0, 'velocity', vNow, ...
        'ballCountByY', ballCountByY, ...
        'pressureByY', currentPressureByY, ...
        'temperatureByY', currentTempreterByY);

    %% Run simulation
    for k = 1:timeSteps
        [xNow,vNow, collisionCount, boxIndex, Fwall] = ...
            SimulationStep(h,xNow,vNow,ball,box,usingSubBoxs,subBox,g) ;
    if usingSubBoxs
        % Record vertical density and pressure (task 4)
        ballCountByY= ballCountByY + densityByY(boxIndex, subBox);
        if isCalculatingPressure
            currentPressureByY = currentPressureByY + pressureByY(box, subBox, boxIndex, Fwall);
        end
        currentTempreterByY = currentTempreterByY + temperatureByY(vNow, boxIndex, subBox);
    end
    if k * h >= tau1
        % Record collisions after system settles
        collisionCountTotal = collisionCount + collisionCountTotal;
    end
    if mod(k,20) == 0
            if usingSubBoxs
                % colours = boxColour(boxIndex,subBox);
                colours = [1,1,1]; % CMY
            else
                colours = speedColour(vNow,nColour); % Colour by speed
                % colours = 0;
            end
            % Draw balls
            set(ballplot,'XData',xNow(1,:),'YData',xNow(2,:), ...
                "MarkerEdgeColor",'Black','CData',colours)
            set(gca, 'XTick', [], 'YTick', []) % hide axis numbers
            drawnow  % Update figure
        end
        if wallsMove
            box = wallMove(k*h,nx,box,wall) ;  % Resize the box
        end
        graphData = updateGraphs(xNow, vNow, box, k, graphData, ...
            collisionCount, Fwall, ballCountByY);
        disp(k * h)  % Show time
    end

    
    % Recorded density and pressure (task 4)
    graphData.ballCountByY = ballCountByY*h/(tau2 - tau1);
    if isCalculatingPressure
        graphData.pressureByY = currentPressureByY*h/(tau2 - tau1);
    end
    graphData.temperatureByY = currentTempreterByY*h/(tau2 - tau1);

    % Record final velocity (task 2)    
    graphData.velocity = vNow;
    
    %% Throwing in a density minimisation function
    % t4DensityMinimisation(graphData,subBox,box)
    
    disp(tau2)

end

