close all
clear
%% The Simulation
p = 3   ;
nx = 4^p ; % The upper wall is contingent on nx... so...

%% Box and Ball
ball = struct('spring',250,'radius',0.2) ;
L = 0 ;
U = 10*sqrt(nx) ;

% I know how stupid this looks this is temporary, my brain isnt working
tau = 0 ;
a = 1 ;
moveFunc = @(t) 10*sqrt(nx) - a*(t-tau) ;

box = struct('low',L,'up',U,'left',L,'right',U, 'moveFunc', moveFunc,'tau',tau,'a',a) ;

%% Experiment Parameters
g = 0.05 ;
vIni = 2.5 ;
nColour = 10 ;

%% Time Parameters
h = 0.01 ;
totalTime = 100 ;

Simulation(nx,ball,box,g,vIni,h,totalTime,nColour)

saveGraphs(p, box, g, vIni, h, totalTime)