function [xnew ,vnew] = SimulationStep(h,x,v,ball,box,g)

%% The forces
% [collisionForcesOut, ~] = collisionForces(x, ball, false);
Fcollide = 0; %collisionForcesOut; 
Fwall = WallCollision(x,box,ball) ;
Fgrav = [0;-g] ;

Forces = Fcollide + Fwall + Fgrav ;
xnew = x + h*v + h^2*Forces ;
vnew = (xnew - x)/h ;