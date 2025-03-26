function pressureOfForces = pressure(forces, lengthOfWall)
    %PRESSURE Summary of this function goes here
    %   Detailed explanation goes here
    % outputArg1 = inputArg1;
    % outputArg2 = inputArg2;
    len = size(forces,2);
    % this aproximeats the norm of the forces it only losses accurelse for
    % the edeg case were the ball hits a corner.
    normOfForces= arrayfun(@(i) abs(forces(1,i)) + abs(forces(2,i)), 1:len); 
    pressureOfForces = sum(normOfForces) / lengthOfWall; 
end