function [graphData] = updateGraphs(x, v, box, k, graphData, collisionCount, Fwall, ballCountByY)
% Draws the relevant graphs. Will currently draw them all on different
% figures

%% SORRY
% I've changed the mod below to 1 so that it tracks it at every timestep, for task 3. Lord forgive me.

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

%% Density By y boxes
% graphData.ballCountByY = ballCountByY;


%% Pressure

% totalPressure = verticalWallPressure + horizontlWallPressure;
totalPressure = pressure(Fwall, 2 *((box.up - box.low) + (box.right - box.left)));
graphData.pressure(:, end+1) = [k, totalPressure];

%% Pressure by y boxes 

%% Mean Free Path
% Keep track of the number of collisions each particle has
wallCollisionsCount = (Fwall(1, :) ~= 0) | (Fwall(2, :) ~= 0);
particleCollisionsCount = collisionCount';
% count collisions
totalCollisionCount = 0*wallCollisionsCount + particleCollisionsCount;
graphData.collisions = graphData.collisions + totalCollisionCount;

% Keep track of the distance each particle travels
oldX = graphData.oldPosition;
graphData.oldPosition = x;

dist = sqrt((x(1, :)-oldX(1, :)).^2 + (x(2, :) - oldX(2, :)).^2);
graphData.distance = graphData.distance + dist;
end

