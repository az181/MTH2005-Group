function [boxIndex] = boxGen (xs, boxSize, bigBoxSize)
dx = (bigBoxSize.right - bigBoxSize.left) / boxSize.x;
dy = (bigBoxSize.up - bigBoxSize.down) / boxSize.y;
boxIndex = zeros(size(xs));
for n = 1 : length( xs) + 1
    boxIndex(:,n) = [floor (xs(:,n) / dx), floor (xs(:,n) / dy)]';
end
end
