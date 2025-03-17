function [xnew ,vnew, collisionCount, boxIndex, Fwall] = SimulationStep(h,x,v,ball,box,usingSubBoxs, subBox,g)

%% The forces
[collisionForcesOut, collisionCount, boxIndex] = collisionForces(x, ball, usingSubBoxs,box,subBox);

Fcollide = collisionForcesOut; 
Fwall = WallCollision(x,box,ball) ;
Fgrav = [0;-g] ;

Forces = Fcollide + Fwall + Fgrav ;
xnew = x + h*v + h^2*Forces ;
vnew = (xnew - x)/h ;