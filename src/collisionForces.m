function [collisionForcesOut, listOfCollisions] = collisionForces(x, ball, isUsingBoxes, smallBoxSize)
    %COLLISIONCALC Summary of this function goes here
    %   Detailed explanation goes here
    if isUsingBoxes == false || nargin < 4
        [collisionForcesOut, listOfCollisions] = ballCollisionNoBoxs(ball, x);
        % put something here me 
        return
    end

    % other things 
end