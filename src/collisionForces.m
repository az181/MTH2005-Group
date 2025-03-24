function [collisionForcesOut, listOfCollisions, boxIndex] = collisionForces( ...
    x, ball, isUsingBoxes, bigBoxSize, smallBoxSize)
    %COLLISIONCALC Summary of this function goes here
    %   Detailed explanation goes here
    if nargin < 5 || isUsingBoxes == false 
        [collisionForcesOut, listOfCollisions] = ... 
            ballCollisionCalc(ball,makePairs(1:size(x,2)),x,1);
        boxIndex = ones(size(listOfCollisions));
    else
        [collisionForcesOut, listOfCollisions, boxIndex] = ...
        ballCollisionsWithBoxs(x,ball,bigBoxSize,smallBoxSize);
    end
end