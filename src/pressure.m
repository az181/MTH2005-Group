function pressureOfForces = pressure(forces, lengthOfWall)
    %PRESSURE Summary of this function goes here
    %   Detailed explanation goes here
    % outputArg1 = inputArg1;
    % outputArg2 = inputArg2;
    len = size(forces,2);
    % the norm of the forces 
    normOfForces= arrayfun(@(i) norm(forces(:,i)), 1:len); 
    pressureOfForces = sum(normOfForces) / lengthOfWall; 
end