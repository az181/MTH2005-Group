function density = densityByY(boxIndex, subBoxSize)
% Calculates vertical density 

filterByIndex = @(i) length(find(boxIndex(2,:) == i));
density = arrayfun(filterByIndex, 1:subBoxSize.y )';
end
