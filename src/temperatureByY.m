function out = temperatureByY(vs, boxIndex, subBoxSize)
    tempOfYBoxMask = @(i) ((vs(1,:)~=0 | vs(2,:)~=0) & ...
    (boxIndex(1,:)==subBoxSize.x | boxIndex(1,:)==1) & boxIndex(2,:)==i);
    tempOfYBox = @(i) norm(vs(:,i) * tempOfYBoxMask(i));
    out = arrayfun(tempOfYBox, 1:subBoxSize.y);
end