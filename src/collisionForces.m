function [collisionForcesOut, listOfCollisions, boxIndex] = ... 
          collisionForces(x, ball, isUsingBoxes, bigBoxSize, smallBoxSize)

    % Determines which method to calculate the collisions
    if nargin < 5 || isUsingBoxes == false 
        % When not using boxes
        [collisionForcesOut, listOfCollisions] = ... 
            ballCollisionCalc(ball,makePairs(1:size(x,2)),x,1);
        boxIndex = ones(size(listOfCollisions));
    else
        % When using boxes
        [collisionForcesOut, listOfCollisions, boxIndex] = ...
        ballCollisionsWithBoxs(x,ball,bigBoxSize,smallBoxSize);
    end
end