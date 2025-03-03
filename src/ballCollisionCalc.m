function [collisionForces, listOfCollisions] = ballCollisionCalc(ball, ballPairs, allBalls, ballsInTheBox)
    %Calculates the ball forces affter ballPairs collide
    %   Detailed explanation goes here
    %   this is expecting ballPairs to have unique pairs ( this can be done
    %   by unique(sort(ballPairs,2),"rows") 
    %   ballsInTheBox is a binary mask
    %   
    collisionForces = zeros(size(allBalls));
    listOfCollisions = zeros(length(allBalls));
    for i = ballPairs
        A = allBalls(i(1));
        B = allBalls(i(2));
        [d, alpha] = particleDistanceCalc(A, B);
        if (0 < d) && (d < 2 * ball.radius)
            aForce= ball.spring * (2 * ball.radius - d) .* [cos(alpha); sin(alpha)];
        else
            aForce = 0;
        end
        bForce = -aForce;
        collisionForces(i(1)) = aForce + collisionForces(i(1));
        collisionForces(i(2)) = bForce + collisionForces(i(2));
    end
    collisionForces = collisionForces .* ballsInTheBox;
end