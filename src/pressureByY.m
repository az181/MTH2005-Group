function pressureInY = pressureByY(boxSize, subBoxSize, boxIndex, Fwall)
dy = (boxSize.up - boxSize.low) / subBoxSize.y;
% this makes a mask of the wall colisteons in the Y sub box of index i 
numberOfWallColisionsInABox = @(i) ((Fwall(1,:)~=0 | Fwall(2,:)~=0) & ...
    (boxIndex(1,:)==subBoxSize.x | boxIndex(1,:)==1) & boxIndex(2,:)==i);
% presuresF = pressure(Fwall);

% this calculates the pressure in each y box 
pressureInY = arrayfun(@(i) pressure( ...
    numberOfWallColisionsInABox(i) .* Fwall, dy * 2), 1:subBoxSize.y)';
end