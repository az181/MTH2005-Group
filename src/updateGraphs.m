function [graphData] = updateGraphs(x, v, box, k, graphData, collisionCount, Fwall)
    % Draws the relevant graphs. Will currently draw them all on different
    % figures

    %% Temperature
    if mod(k, 1) == 0
        averageTemp = averageTemperature(x, v, box);
        graphData.temperature(:, end+1) = [k, averageTemp];
    end

    %% Density
    if mod(k, 20) == 0
        averageDens = averageDensity(x, box);
        graphData.density(:, end+1) = [k, averageDens];
    end

    %% Pressure
    leftForces = sum(abs(Fwall(Fwall(1, :)>=0)));
    rightForces = sum(abs(Fwall(Fwall(1, :)<=0)));
    ceilingForces = sum(abs(Fwall(Fwall(2, :)<=0)));
    floorForces = sum(abs(Fwall(Fwall(2, :)>=0)));
    leftPressure = leftForces / (box.up - box.low);
    rightPressure = rightForces / (box.up - box.low);
    ceilPressure = ceilingForces / (box.right - box.left);
    floorPressure = floorForces / (box.right - box.left);

    totalPressure = sum([leftPressure, rightPressure, ceilPressure, floorPressure]);
    graphData.pressure(:, end+1) = [k, totalPressure];


    %% Mean Free Path
    % Keep track of the number of collisions each particle has
    wallCollisionsCount = (Fwall(1, :) ~= 0) | (Fwall(2, :) ~= 0);
    particleCollisionsCount = collisionCount';
    totalCollisionCount = wallCollisionsCount + particleCollisionsCount;
    graphData.collisions = graphData.collisions + totalCollisionCount;

    % Keep track of the distance each particle travels
    oldX = graphData.oldPosition;
    graphData.oldPosition = x;
    
    dist = sqrt((x(1, :)-oldX(1, :)).^2 + (x(2, :) - oldX(2, :)).^2);
    graphData.distance = graphData.distance + dist;
end

