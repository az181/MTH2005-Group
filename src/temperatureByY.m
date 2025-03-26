function out = temperatureByY(vs, boxIndex, subBoxSize)
    tempOfYBoxMask = @(i) ((vs(1,:)~=0 | vs(2,:)~=0) & ...
    (boxIndex(1,:)==subBoxSize.x | boxIndex(1,:)==1) & boxIndex(2,:)==i);
    speeds = arrayfun(@(i) norm(vs(:,i)), 1:size(vs,2));
    out = arrayfun(@(i) sum(speeds .* tempOfYBoxMask(i)), 1:subBoxSize.y)';
end