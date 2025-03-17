function colours = boxColour(boxIndex,subBox) 

% Laziest colour scheme of your life
% First row scales colour based on x index, from 0 to 1.
% Second along y index, from 0 to 1.
% Third row is just 1's so that we get 1 1 1.
colours = [1 - (boxIndex(1,:)-1)./(subBox.x-1) ; 1 - (boxIndex(2,:)-1)./(subBox.y-1) ; 1 + zeros(1,length(boxIndex))]' ;

end