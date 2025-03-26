function [collisionForcesOut, listOfCollisions] = ballCollisionCalc( ...
          ball, ballPairs, allBalls, ballsInTheBox)
    %   Calculates the ball forces after ballPairs collide
    %   this is expecting ballPairs to have unique pairs 
    %   (this can be done by unique(sort(ballPairs,2),"rows") 
    %   ballsInTheBox is a binary mask     
    
    % Initialising conditions
    collisionForcesOut = zeros(size(allBalls));   % Preallocate
    listOfCollisions = zeros(size(allBalls,2),1); % Preallocate
    if all(ballsInTheBox == 0) % Early return if no balls in box          
        return
    end
    % Calulate force for each collision
    [row,col] = size(ballPairs);  
    for i = 1:row
        ballA = ballPairs(i,1);
        ballB = ballPairs(i,2);
        A = allBalls(:,ballA);
        B = allBalls(:,ballB);
        [d, alpha] = particleDistanceCalc(A, B);
        % Check if there is a collision
        if (0 < d) && (d < 2 * ball.radius)
            aForce = ball.spring * (2 * ball.radius - d) .* [cos(alpha); sin(alpha)];
            listOfCollisions(ballA) = listOfCollisions(ballA) + 1;
            listOfCollisions(ballB) = listOfCollisions(ballB) + 1;
        else
            aForce = 0;
        end
        bForce = -aForce;
        collisionForcesOut(:,ballA) = aForce + collisionForcesOut(:,ballA);
        collisionForcesOut(:,ballB) = bForce + collisionForcesOut(:,ballB);
    end
    collisionForcesOut = collisionForcesOut .* ballsInTheBox;
    listOfCollisions = listOfCollisions .* ballsInTheBox(:,1);
end