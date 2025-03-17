function  pairs = makePairs(A)
    % makes a list of all the pairs of element in A 
    l = length(A);
    % nchoosek brakes if inupt is 0 so this is for that case 
    if l < 2
        pairs = [];
        return 
    end
    pairs = zeros(nchoosek(l,2),2);
    n = 0;
    for i = 1:l
        for j = (i+1):l
            n = n + 1;
            pairs(n,:) = [i,j];
        end
    end
end