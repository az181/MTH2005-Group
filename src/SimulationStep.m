function [xnew ,vnew, collisionCount, boxIndex, Fwall] = ...
          SimulationStep(h,x,v,ball,box,usingSubBoxs, subBox,g)

    %% The forces
    [collisionForcesOut, collisionCount, boxIndex] = ...
        collisionForces(x, ball, usingSubBoxs,box,subBox);
    
    Fcollide = collisionForcesOut;      % Particle collision force
    Fwall = WallCollision(x,box,ball) ; % Wall force
    Fgrav = [0;-g] ;                    % Gravitational force
    
    Forces = Fcollide + Fwall + Fgrav ; % Sum of forces
    
    %% Verlet Integration
    xnew = x + h*v + h^2*Forces ;  % Update position
    vnew = (xnew - x)/h ;          % Update velocity

end



