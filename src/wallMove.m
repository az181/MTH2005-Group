function box = wallMove(t,nx,box,wall)

moveFunc = @(t) 10*sqrt(nx) - box.a*(t-box.tau) ;
tau2 = box.tau + 5*sqrt(nx)/box.a ;

% This is so lazy lmao

if t > box.tau && t <= tau2
    box.up = moveFunc(t) ;
    set(wall,'YData',[box.up box.up])
end

end