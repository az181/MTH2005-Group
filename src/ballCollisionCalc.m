function [collisionForcesOut, listOfCollisions] = ballCollisionCalc(ball, ballPairs, allBalls, ballsInTheBox)
    %Calculates the ball forces affter ballPairs collide
    %   Detailed explanation goes here
    %   this is expecting ballPairs to have unique pairs ( this can be done
    %   by unique(sort(ballPairs,2),"rows") 
    %   ballsInTheBox is a binary mask
    %   
    
    collisionForcesOut = zeros(size(allBalls));
    listOfCollisions = zeros(length(allBalls),1);
    [row,col] = size(ballPairs);
    for i = 1:row
        index = @(x) ballPairs(i,x);
        A = allBalls(:,index(1));
        B = allBalls(:,index(2));
        [d, alpha] = particleDistanceCalc(A, B);
        if (0 < d) && (d < 2 * ball.radius)
            aForce= ball.spring * (2 * ball.radius - d) .* [cos(alpha); sin(alpha)];
            listOfCollisions(index(1)) = listOfCollisions(index(1)) + 1;
            listOfCollisions(index(2)) = listOfCollisions(index(2)) + 1;
        else
            aForce = 0;
        end
        bForce = -aForce;
        collisionForcesOut(:,index(1)) = aForce + collisionForcesOut(:,index(1));
        collisionForcesOut(:,index(2)) = bForce + collisionForcesOut(:,index(2));
    end
    collisionForcesOut = collisionForcesOut .* ballsInTheBox;
    listOfCollisions = listOfCollisions .* ballsInTheBox(:,1);
end