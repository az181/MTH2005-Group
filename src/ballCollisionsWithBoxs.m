function [collisionForces, listOfCollisions, boxIndexs] = ...
          ballCollisionsWithBoxs(x, ball, box, subBoxSize)

    % Number of boxes (for readability)
    xNum = subBoxSize.x; 
    yNum = subBoxSize.y; 
    % Initalising conditions for this function
    collisionForces = zeros(size(x));
    listOfCollisions = zeros(size(x,2),1);
    subBoxContents = cell(xNum,yNum);
    boxIndexs = boxGen(x, subBoxSize, box);

    % This adds each ball index to the correct subBoxContents cell
    for ix =  1:xNum
        for iy = 1:yNum
            finding =  find( ...
                boxIndexs(1,:) == ix & ...
                boxIndexs(2,:) == iy);
            % This is for the case of no balls in the box
            if (size(finding) == [1,0])
                finding = [];
            end
            subBoxContents{ix,iy} = finding;
        end
    end

    % The adjacent boxes that are being searched (relative to current box)
    adjacentBoxs = [
             1,0;
        1,0; 1,1];

    % The main loop for this function - it loops through each box and 
    % checks its collisions and adds it to the listOfCollisions and 
    % collisionForces variables 
    for ix = 1:xNum
        for iy = 1:yNum 
            adjacent = listAdajcentBoxs(ix,iy,adjacentBoxs, ...
                       subBoxContents,xNum,yNum);
            allTheBallsWeAreLookingAt = ...
                       cat(2,subBoxContents{ix,iy},adjacent);
            pairs = makePairs(allTheBallsWeAreLookingAt);
            [c,l] = ballCollisionCalc(ball,pairs,x,1);
            collisionForces = collisionForces +  c;
            listOfCollisions = listOfCollisions + l;
        end
    end

end