function [boxIndex] = boxGen (xs, smallBoxSize, bigBoxSize)
dx = (bigBoxSize.right - bigBoxSize.left) / smallBoxSize.x;
dy = (bigBoxSize.up - bigBoxSize.down) / smallBoxSize.y;
boxIndex = zeros(size(xs));
for n = 1 : length( xs) + 1
    boxIndex(:,n) = [floor (xs(:,n) / dx), floor (xs(:,n) / dy)]';
end
end
