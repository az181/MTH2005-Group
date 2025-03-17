function box = wallMove(t,nx,box)

moveFunc = @(t) 10*sqrt(nx) - box.a*(t-box.tau) ;
tau2 = box.tau + 5*sqrt(nx)/box.a ;

% This is so lazy lmao

if t > box.tau && t <= tau2
    box.up = moveFunc(t) ;
end

if t == tau2
    hold on 
    plot([box.left box.right],[box.up box.up],'black')
    hold off
end

end