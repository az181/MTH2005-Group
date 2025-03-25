function pressureInY = pressureByY(boxSize, subBoxSize, boxIndex, Fwall)
dy = (boxSize.up - boxSize.low) / subBoxSize.y;
numberOfWallColisionsInABox = @(i) ((Fwall(1,:)~=0 | Fwall(2,:)~=0) & ...
    (boxIndex(1,:)==subBox.x | boxIndex(1,:)==1) & boxIndex(2,:)==i) / dy;
presuresF = pressure(Fwall);

pressureInY = sum(presuresF .*  arrayfun(numberOfWallColisionsInABox, 1:subBoxSize.y)');
end