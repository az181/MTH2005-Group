function box = wallMove(t,nx,box,wall)

% A function that generates the wall's position at time t
moveFunc = @(t) 10*sqrt(nx) - box.a*(t-box.tau) ;

% The time at which the wall needs to stop, based upon a
tau2 = box.tau + 5*sqrt(nx)/box.a ;

% Setting the wall's plot position as it moves.
if t > box.tau && t <= tau2
    box.up = moveFunc(t) ;
    set(wall,'YData',[box.up box.up])
end

end

