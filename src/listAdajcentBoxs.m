function out = listAdajcentBoxs(ix,iy,adajcentBoxs, particalsByBox, xNum, yNum)
    % this is the current adajcentBoxs will change if diffent (i belleve
    % that there are more affisent searchs)
    % adajcentBoxs = [
    %     -1, -1; -1, 0; -1, 1; 
    %      0, -1;         0, 1; 
    %      1, -1;  1, 0;  1, 1];
    out = []; 
    for i = 1:length(adajcentBoxs)
        ixNew = ix + adajcentBoxs(i,1);
        iyNew = iy + adajcentBoxs(i,2);
        % sorry for the jank
        newIndex = [ixNew,iyNew];
        % checks if the index is in bonuds 
        if all(newIndex >= [1,1] & newIndex < [xNum,yNum])
            out = cat(2,out, particalsByBox{ixNew, iyNew});
        end
    end
end