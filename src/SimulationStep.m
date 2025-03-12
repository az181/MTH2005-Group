function [xnew ,vnew, collisionCount] = SimulationStep(h,x,v,ball,box,usingSubBoxs, subBox,g)

%% The forces
[collisionForcesOut, collisionCount] = collisionForces(x, ball, usingSubBoxs,box,subBox);
Fcollide = collisionForcesOut; 
Fwall = WallCollision(x,box,ball) ;
Fgrav = [0;-g] ;

Forces = Fcollide + Fwall + Fgrav ;
xnew = x + h*v + h^2*Forces ;
vnew = (xnew - x)/h ;