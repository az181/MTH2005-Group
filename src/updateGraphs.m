function [graphData] = updateGraphs(x, v, box, k, graphData, collisionCount, Fwall)
    % Draws the relevant graphs. Will currently draw them all on different
    % figures

    %% Temperature
    if mod(k, 20) == 0
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
    % dist = zeros(1, length(x));
    % for i = length(x)
    %     [dist(i), ~] = particleDistanceCalc(x(:, i), graphData.oldPosition(:, i));
    % end
    % dist = sqrt((a(1, :)-b(1, :)).^2 + (a(2, :) - b(2, :)).^2);
    % graphData.distance = graphData.distance + dist;
    % graphData.oldPosition = x;
    % graphData.collisionCount = collisionCount;
end

