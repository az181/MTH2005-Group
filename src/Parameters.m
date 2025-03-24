close all
clear
%% The Simulation

rng(1);
p = 2  ;

nx = 4^p ; % The upper wall is contingent on nx... so...
usingSubBoxs = true; 
save = true;
%% Box and Ball
ball = struct('spring',250,'radius',0.2) ;
L = 0 ;
U = 10*sqrt(nx) ;

% I know how stupid this looks this is temporary, my brain isnt working
a = 1 ;
box = struct('low',L,'up',U,'left',L,'right',U,'tau',10,'a',a) ;
subBox = struct('x', 13, 'y', 13); 


%% Experiment Parameters
g = 0.05 ;
vIni = 2.5 ;
nColour = 10 ;

%% Time Parameters
h = 0.01 ;
totalTime = 50 ;

doingTask2 = false;
doingTask3 = true;
moveWalls = true; % (Necessary if doing task3)

pMax = 1.5;
if doingTask2
    graphData = task2(ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls, pMax);
else
    graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour,moveWalls)
end

if doingTask3
    % Return graphData with a matrix
    graphData = task3(nx, ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls)
end

drawGraphs(graphData, doingTask2, doingTask3)
if save 
    saveGraphs(p, box, g, vIni, h, totalTime, moveWalls)
end

