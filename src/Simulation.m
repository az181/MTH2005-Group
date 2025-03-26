function graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour, wallsMove)

% needs to be changed in the end
tau1 = 50;
tau2 = totalTime;

timeSteps = totalTime/h ;
xNow=[box.left + rand(1,nx)*(box.right-box.left);...
    box.low + rand(1,nx)*(box.up-box.low)];
vNow = vIni*2*(rand(2,nx)-0.5) ;
collisionCountTotal = zeros(size(nx,2),1);

ballCountByY = zeros(subBox.y,1);
currentPressureByY = zeros(subBox.y,1);


hold on
ballplot = scatter(xNow(1,:),xNow(2,:),10,'Filled') ;
wall = plot([box.left box.right],[box.up box.up],'black') ;
hold off

grid on
xticks(0:box.right/subBox.x:box.right)
yticks(0:box.right/subBox.y:box.up)

axis([box.left box.right box.low box.up])
axis square

graphData = struct(...
    'temperature', [], ...
    'density', [], ...
    'distance', zeros(1, length(xNow)), ...
    'oldPosition', xNow, 'collisions', ...
    zeros(1, length(collisionCountTotal)), 'pressure', [], ...
    'tempstd', 0, 'velocity', vNow, ...
    'ballCountByY', ballCountByY, ...
    'pressureByY', currentPressureByY);

for k = 1:timeSteps
    [xNow,vNow, collisionCount, boxIndex, Fwall] = SimulationStep(h,xNow,vNow,ball,box,usingSubBoxs,subBox,g) ;
    if usingSubBoxs
        ballCountByY = ballCountByY + densityByY(boxIndex, subBox);
        currentPressureByY = currentPressureByY + pressureByY(box, subBox, boxIndex, Fwall);
    end
    if k * h >= tau1
        collisionCountTotal = collisionCount + collisionCountTotal;
    end
    if mod(k,20) == 0
        if usingSubBoxs
            % colours = boxColour(boxIndex,subBox) ;
            colours = [1,1,1];
        else
            colours = speedColour(vNow,nColour) ;
            colours = 0;
        end
        set(ballplot,'XData',xNow(1,:),'YData',xNow(2,:),"MarkerEdgeColor",'Black','CData',colours)
        set(gca, 'XTick', [], 'YTick', []);  % Hide axis numbers
        drawnow
    end
    if wallsMove
        box = wallMove(k*h,nx,box,wall) ;
    end
    graphData = updateGraphs(xNow, vNow, box, k, graphData, collisionCountTotal, Fwall);
    disp(k * h)
end

graphData.ballCountByY = ballCountByY*h/(tau2 - tau1);
graphData.pressureByY = currentPressureByY*h/(tau2 - tau1);
graphData.velocity = vNow;  % Here for the sole use of task 2

%% Throwing in a density minimisation function
t4DensityMinimisation(ballCountByY,subBox,box)
