function [boxIndex] = boxGen (xs, smallBoxSize, bigBoxSize)
% Generates Sub-Boxes

dx = (bigBoxSize.right - bigBoxSize.left) / smallBoxSize.x;
dy = (bigBoxSize.up - bigBoxSize.low) / smallBoxSize.y;
boxIndex = zeros(size(xs));
for n = 1 : size( xs, 2)
    boxIndex(:,n) = [floor(xs(1,n) / dx + 1); floor(xs(2,n) / dy + 1)];
end
end
