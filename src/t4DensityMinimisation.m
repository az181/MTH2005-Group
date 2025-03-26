function t4DensityMinimisation(graphData,subBox,box)

% Why is densityByY like that? who knows
density = graphData.ballCountByY ;

% Minimising the distance between our function 1/a+by and the variables.
% Measure distance as the absolute distance.

% Laziness :) Creates an array from y = 0 to the y value below the max.
y = box.up/(2*subBox.y) : box.up/subBox.y : box.up ;
% params are a vector (a,b)
% Then a suitable guess is:
% a is 1/density at 0, because this is 1/a+by at y = 0.
% b is 1/(a+by) = density at box.up rearranged knowing a.

params_guess = [1/density(1),(1/density(end) - 1/density(1))/box.up] ;

f = @(params) sum(abs(density - 1./(params(1)+params(2).*y))) ;

params_min = fminsearch(f,params_guess) ;
disp(params_min)

figure(100)
hold on
plot(y,density,'b')

density_est = 1./(params_min(1) + params_min(2).*y) ;
plot(y,density_est,'r')

hold off
