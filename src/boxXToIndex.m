function [boxIndex] = boxXToIndex (xs, boxSize, bigBoxSize)
dx = bigBoxSize(1) / boxSize(1);
dy = bigBoxSize(2) / boxSize(2);
boxIndex = zeros(size(xs));
for n = 1 : length( xs) + 1
	boxIndex(:,n) = [floor (xs(:,n) / dx), floor (xs(:,n) / dy)]';
end
end
