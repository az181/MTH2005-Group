function colours = speedColour(vNow,nColour)

% A vector of speeds
speed = sqrt(vNow(1,:).^2 + vNow(1,:).^2)' ;

% Scaling these speeds relatively from 0 to 1, then from 1 to nColour (an index)
speed = round((nColour-1)*(speed/max(speed))) + 1 ;

% A vector of colours of size nColour, then mapping speeds to this.
cMap = gray(nColour) ;
colours = cMap(speed,:) ;
