function [collisionForces, listOfCollisions] = ballCollisionNoBoxs(ball, allBalls)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    % ballPairs = makePairs(allBalls); 
    [collisionForces, listOfCollisions] = ballCollisionCalc(ball, makePairs(allBalls), allBalls, 1);
end