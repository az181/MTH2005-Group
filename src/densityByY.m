function density = densityByY(boxIndex, subBoxSize)
filterByIndex = @(i) length(find(boxIndex(2,:) == i));
density = arrayfun(filterByIndex, 1:subBoxSize.y )';
end
