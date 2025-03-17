function [collisionForces, listOfCollisions, boxIndexs] = ballCollisionsWithBoxs(x, ball, box, subBoxSize)
    % this is for readbility
    xNum = subBoxSize.x; 
    yNum = subBoxSize.y; 
    % initalising conditions for this function
    collisionForces = zeros(size(x));
    listOfCollisions = zeros(size(x,2),1);
    subBoxContents = cell(xNum,yNum);
    boxIndexs = boxGen(x, subBoxSize, box);

    % this adds each ball index to the correct subBoxContents cell
    for ix =  1:xNum
        for iy = 1:yNum
            finding =  find( ...
                boxIndexs(1,:) == ix & ...
                boxIndexs(2,:) == iy);
            % this is for the case of no balls in the box
            if (size(finding) == [1,0])
                finding = [];
            end
            subBoxContents{ix,iy} = finding;
        end
    end

    % the adjacent boxs that are being searched (relitive to the current
    % box)
    adjacentBoxs = [-1,-1;-1,0;-1,1;0,-1;0,1;1,-1;1,0;1,1];
    
    % the main loop for this function
    % it loops through each box and checkes it's colisions and adds it to
    % the listOfCollisions and collisionForces veriabls 
    for ix = 1:xNum
        for iy = 1:yNum 
            currentBoxMask = boxIndexs(1,:) == ix & boxIndexs(2,:) == iy;
            adajcent = listAdajcentBoxs(ix,iy,adjacentBoxs, subBoxContents,xNum,yNum);
            pairs = makePairs(cat(2,subBoxContents{ix,iy},adajcent));
            [c,l] = ballCollisionCalc(ball,pairs,x,currentBoxMask);
            collisionForces = collisionForces +  c;
            listOfCollisions = listOfCollisions + l;
        end
    end

end