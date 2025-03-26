function t4DensityMinimisation(graphData,subBox,box)

% Transposing the data so it's easier to work with.
density = graphData.ballCountByY' ;

% Defining the y values as the midpoints of the y-direction sub-boxes
y = box.up/(2*subBox.y) : box.up/subBox.y : box.up ;

% params are a vector (a,b)
% Then a suitable guess is:
% a is 1/density at y=0, because this is 1/a+by at y = 0.
% b is 1/(a+by) = density at box.up rearranged knowing a.

params_guess = [1/density(1),(1/density(end) - 1/density(1))/box.up] ;

% A function that represents the sum of the absolute error between our
% estimate and the real values of density.
f = @(params) sum(abs(density - 1./(params(1)+params(2).*(y.^2)))) ;

% Minimising the function above (and hence error) about our parameters
params_min = fminsearch(f,params_guess) ;
disp(params_min)


figure(99)
bar(y,density)
xlabel('y value')
ylabel('Average Density')

figure(100)
hold on
bar(y,density)
density_est = 1./(params_min(1) + params_min(2).*(y.^2)) ;
plot(y,density_est,'r',linewidth=2)
xlabel('y value')
ylabel('Average Density')
legend('Particle density by y','1/a+by^2 approximation')
hold off
