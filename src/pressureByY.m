function [outputArg1,outputArg2] = pressureByY(boxIndex, subBoxSize, Fwall)
    horizontlWallForces = sum(abs(Fwall(2, :)));
filterByIndex = @(i) length(find(boxIndex(2,:) == i));
density = arrayfun(filterByIndex, 1:subBoxSize.y )';
end