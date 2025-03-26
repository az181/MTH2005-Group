function t4PressureMinimisation(graphData, subBox, box)

% Transposing the data so it's easier to work with.
pressure = graphData.pressureByY';

% Defining the y values as the midpoints of the y-direction sub-boxes
y = box.up/(2*subBox.y) : box.up/subBox.y : box.up ;

% params are a vector (a,b)
% Then a suitable guess is:
% a is 1/pressure at 0, because this is 1/a+by at y = 0.
% b is 1/(a+by) = pressure at box.up rearranged knowing a.

params_guess = [1/pressure(1), (1/pressure(end) - 1/pressure(1))/box.up];

% A function that represents the sum of the absolute error between our
% estimate and the real values of pressure.

f = @(params) sum(abs(pressure - 1./(params(1) + params(2).*(y))));

% Minimising the function above (and hence error) about our parameters
params_min = fminsearch(f, params_guess);

format long
figure(80)
bar(y,pressure)
xlabel('y value')
ylabel('Average Pressure')

figure(81)
hold on
bar(y,pressure)
pressure_est = 1./(params_min(1) + params_min(2).*(y)) ;
plot(y,pressure_est,'r',linewidth=2)
xlabel('y value')
ylabel('Average Pressure')
legend('Particle Pressure by y','1/a+by approximation')
hold off

end