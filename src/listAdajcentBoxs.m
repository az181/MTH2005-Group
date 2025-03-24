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
        
        % checks if the index is in bonuds 
        if all([ixNew,iyNew] >= [1,1] & [ixNew,iyNew] <= [xNum,yNum])
            out = [out, particalsByBox{ixNew, iyNew}];
        end
    end
end