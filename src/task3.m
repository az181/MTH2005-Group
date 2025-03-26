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
    clf % Aesthetics
    rng(1) % Resetting the rng before each simulation
    box.a = a(i) ;

    % tau3 is the time for which we start measuring, tau4 for stop
    % measuring. 
    tau3 = box.tau + 10*sqrt(nx)/box.a ;
    tau4 = box.tau + 20*sqrt(nx)/box.a ;#

    % The timestep/indices corresponding to tau3 and tau4.
    tau3Tidx = (tau3)/h ;
    tau4Tidx = (tau4)/h ;
    
    % Unneccessary, but setting totalTime (The end of each simulation) as tau4.
    totalTime = tau4 ;
    graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour,moveWalls, true) ;

    % Taking the mean of pressure and temperature between tau3 and tau4.
    t3Temp(i) = mean(graphData.temperature(2,tau3Tidx:tau4Tidx)) ;
    t3Pres(i) = mean(graphData.pressure(2,tau3Tidx:tau4Tidx)) ;
end

% Storing them in graphData.
graphData.t3Temp = t3Temp ;
graphData.t3Pres = t3Pres ;
