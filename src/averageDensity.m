function averageDens = averageDensity(x, region)
    % Takes the positions of the balls and the box to average the density
    % over in the same form as the box struct in the main simulation
    n = 0;
    for i = 1:size(x,2)
        if x(1, i) > region.left && x(1, i) < region.right && ...
                x(2, i) > region.low && x(2, i) < region.up

            n = n + 1;
        end
    end

    averageDens = n / ((region.right - region.left) * (region.up - region.low));
end