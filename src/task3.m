function graphData = task3(nx, ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls,aVector)
%% In updateGraphs, make sure to assign mod(k,x) as x = 1 so that temp is recorded at every timestep.

% Just making a bunch of a's for fun.
a = aVector ;

%{
These are both calculated within wallMove
tau1T = box.tau/h ; 
tau2T = (box.tau + 5*sqrt(nx)/box.a)/h ;
%}

for i = 1:size(a,2)
    clf
    rng(1)
    box.a = a(i) ;
    tau3 = box.tau + 10*sqrt(nx)/box.a ;
    tau4 = box.tau + 20*sqrt(nx)/box.a ;
    tau3Tidx = (tau3)/h ;
    tau4Tidx = (tau4)/h ;
    disp(tau3Tidx)
    disp(tau4Tidx)
    totalTime = tau4 ;
    graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour,moveWalls, true) ;
    t3Temp(i) = mean(graphData.temperature(2,tau3Tidx:tau4Tidx)) ;
    t3Pres(i) = mean(graphData.pressure(2,tau3Tidx:tau4Tidx)) ;
end

graphData.t3Temp = t3Temp ;
graphData.t3Pres = t3Pres ;

% So, the relevant information is in graphData or a.
% t3Temp, t3Pres in graphdata are the means of the temperature and pressure
% across tau3 to tau4
% a is just a vector of our a values.
% Perhaps we should adjust tau3 to instead be a longer wait period between
% tau2 to tau3 so it can equilibriate.

%{
pressure and gamma change accordingly
Calculating work done based upon change in pressure and volume and
temperature/energy

Minimising function

P*(1/2)^7/5 = const
%}