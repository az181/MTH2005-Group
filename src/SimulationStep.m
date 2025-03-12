function [xnew ,vnew, collisionCount, Fwall] = SimulationStep(h,x,v,ball,box,g)

%% The forces
[collisionForcesOut, collisionCount] = collisionForces(x, ball, false); % true, struct('x', 4, 'y', 4));
Fcollide = collisionForcesOut; 
Fwall = WallCollision(x,box,ball) ;
Fgrav = [0;-g] ;

Forces = Fcollide + Fwall + Fgrav ;
xnew = x + h*v + h^2*Forces ;
vnew = (xnew - x)/h ;