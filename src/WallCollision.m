function wallForce = WallCollision(x,box,ball)
%forces on balls from each walls
Fleft = max(0,ball.radius + box.left - x(1,:))    ;
Fright = max(0,ball.radius - box.right + x(1,:))  ;
Fbot = max(0,ball.radius + box.low - x(2,:))      ;
Fup = max(0,ball.radius - box.up + x(2,:))        ;

wallForce = ball.spring.*[Fleft - Fright;Fbot-Fup] ;%total overall force on ball due to walls