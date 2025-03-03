function [collisionForces, listOfCollisions] = ballCollisionNoBoxs(ball, allBalls)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    l = length(allBalls);
    ballPairs = zeros((l-1) * l, 2);
    n = 0;
    for i = 1:l
        for j = 1:l
            if i ~= j
                n = n + 1;
                ballPairs(n,:) = [j, i];
            end
        end
    end
    ballPairs = unique(sort(ballPairs,2),"rows"); 
    [collisionForces, listOfCollisions] = ballCollisionCalc(ball, ballPairs, allBalls, 1);
end