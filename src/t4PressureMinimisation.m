function t4PressureMinimisation(graphData, subBox, box)

pressure = graphData.pressureByY;

y = box.up/(2*subBox.y) : box.up/subBox.y : box.up ;

params_guess = [1/pressure(1), (1/pressure(end) - 1/pressure(1))/box.up];

f = @(params) sum(abx(pressure - 1./params(1) + params(2).y));

params_min = fminsearch(f, params_guess);

figure(80)
bar(y,pressure)
xlabel('y value')
ylabel('Average Pressure')

figure(81)
hold on
bar(y,pressure)
pressure_est = 1./(params_min(1) + params_min(2).*(y.^2)) ;
plot(y,pressure_est,'r',linewidth=2)
xlabel('y value')
ylabel('Average Pressure')
legend('Particle Pressure by y','1/a+by^2 approximation')
hold off

end