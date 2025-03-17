close all
clear
%% The Simulation
rng(1);
p = 2  ;
nx = 4^p ; % The upper wall is contingent on nx... so...

%% Box and Ball
ball = struct('spring',250,'radius',0.2) ;
L = 0 ;
U = 10*sqrt(nx) ;

% I know how stupid this looks this is temporary, my brain isnt working
a = 1 ;
box = struct('low',L,'up',U,'left',L,'right',U,'tau',0,'a',a) ;

%% Experiment Parameters
g = 0.05 ;
vIni = 2.5 ;
nColour = 10 ;

%% Time Parameters
h = 0.01 ;
totalTime = 50 ;

moveWalls = true;
Simulation(nx,ball,box,g,vIni,h,totalTime,nColour, moveWalls)

saveGraphs(p, box, g, vIni, h, totalTime, moveWalls)