function [collisionForcesOut, listOfCollisions] = collisionForces( ...
    x, ball, isUsingBoxes, bigBoxSize, smallBoxSize)
    %COLLISIONCALC Summary of this function goes here
    %   Detailed explanation goes here
    if nargin < 5 || isUsingBoxes == false 
        [collisionForcesOut, listOfCollisions] = ... 
            ballCollisionCalc(ball,makePairs(x),x,1);
            % ballCollisionNoBoxs(ball, x);
    else
        [collisionForcesOut, listOfCollisions] = ...
        ballCollisionsWithBoxs(x,ball,bigBoxSize,smallBoxSize);
    end
end