function box = wallMove(t,nx,box)

tau2 = box.tau + 5*sqrt(nx)/box.a ;

% So i'm not meant to be moving the upper corner, i'm moving the upper LINE.
% So I'm meant to move box.up only tbh
if t > box.tau && t < tau2
    box.right = box.moveFunc(t) ;
    box.up = box.moveFunc(t) ;
end

end