close all
clear
%% The Simulation

rng(2);
p = 4  ;

nx = 4^p ; % The upper wall is contingent on nx... so...
usingSubBoxs = true; 
save = false;
%% Box and Ball

ball = struct('spring',250,'radius', 0.2) ;
L = 0 ;
U = 10*sqrt(nx) ;
subSize = ceil(U/10);

% I know how stupid this looks this is temporary, my brain isnt working
a = 1 ;
box = struct('low',L,'up',U,'left',L,'right',U,'tau',0,'a',a) ;
subBox = struct('x', subSize, 'y', subSize); 


%% Experiment Parameters
g = 0.05 ;
vIni = 2.5 ;
nColour = 10 ;

%% Time Parameters
h = 0.01 ;
totalTime = 100 ;

moveWalls = false;

doingTask2 = false;

pMax = 1.5;
if doingTask2
    graphData = task2(ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls, pMax);
else
    graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour,moveWalls)
end

drawGraphs(graphData, doingTask2)
if save 
    saveGraphs(p, box, g, vIni, h, totalTime, moveWalls)
end

