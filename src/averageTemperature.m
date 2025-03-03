function averageTemp = averageTemperature(x, v, region)
    % Takes the positions of the balls, the velocity of the balls and the
    % region to average the temperature over.
    % region will be a struct of the same form as the box struct in the
    % main simulation
    n = 0;
    tempSum = 0;
    for i = 1:length(x)
        if x(1, i) > region.left && x(1, i) < region.right && ...
            x(2, i) > region.low && x(2, i) < region.up

            n = n + 1;
            tempSum = tempSum + (v(1, i)^2 + v(2, i)^2)/2;
        end
    end

    averageTemp = tempSum / n;
end