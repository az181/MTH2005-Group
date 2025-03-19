function [xnew ,vnew, collisionCount, boxIndex, Fwall] = SimulationStep(h,x,v,ball,box,usingSubBoxs, subBox,g)

%% The forces
[collisionForcesOut, collisionCount, boxIndex] = collisionForces(x, ball, usingSubBoxs,box,subBox);

Fcollide = collisionForcesOut; 
Fwall = WallCollision(x,box,ball) ;
Fgrav = [0;-g] ;

Forces = Fcollide + Fwall + Fgrav ;

xnew = x + h*v + h^2*Forces ;
vnew = (xnew - x)/h ;

%{ 
Jan's Method:
xnew = x + h*v + h^2*Forces
...  = x + h*(v + h*Forces)

vnew = (xnew - x)/h
...  = (x + h*v + h^2*Forces - x)/h
...  = (h*v + h^2*Forces)/h
...  = v + h*Forces (things we already know)

Symplectic:
vnew = v + h*g(tn,xn)
xnew = x + h*f(tn,vn+1)


dx/dt = f(t,v) and dv/dt = g(t,x) btw.
Surely g(tn,xn) is Forces. Since it's the acceleration at our current step.
f(tn,vn+1) HAS to just be vn+1.

so vnew = v + h*Forces
   xnew = x + h*vnew
%}