function t4TemperatureMinimisation(graphData, subBox, box)

% Transposing the data so it's easier to work with.
temperature = graphData.temperatureByY';

% Defining the y values as the midpoints of the y-direction sub-boxes
y = box.up/(2*subBox.y) : box.up/subBox.y : box.up ;

% params are a vector (a,b)
% Then a suitable guess is:
% a is 1/temperature at 0, because this is 1/a+by at y = 0.
% b is 1/(a+by) = temperature at box.up rearranged knowing a.

params_guess = [1/temperature(1), (1/temperature(end) - 1/temperature(1))/box.up];

% A function that represents the sum of the absolute error between our
% estimate and the real values of temperature.

f = @(params) sum(abs(temperature - 1./(params(1) + params(2).*(y.^3))));

% Minimising the function above (and hence error) about our parameters
params_min = fminsearch(f, params_guess);

format long
figure(80)
bar(y,temperature)
xlabel('y value')
ylabel('Average Temperature')

figure(81)
hold on
bar(y,temperature)
temperature_est = 1./(params_min(1) + params_min(2).*(y.^3)) ;
plot(y,temperature_est,'r',linewidth=2)
xlabel('y value')
ylabel('Average Temperature')
legend('Particle Temperature by y','1/a+by^3 approximation')
hold off

end