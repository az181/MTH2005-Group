close all
clear
%% The Simulation
p = 1   ;
nx = 4^p ; % The upper wall is contingent on nx... so...

%% Box and Ball
ball = struct('spring',250,'radius',0.2) ;
L = 0 ;
U = 10*sqrt(nx) ;
box = struct('low',L,'up',U,'left',L,'right',U) ;

%% Experiment Parameters
g = 0.05 ;
vIni = 2.5 ;
nColour = 10 ;

%% Time Parameters
h = 0.01 ;
totalTime = 100 ;

Simulation(nx,ball,box,g,vIni,h,totalTime,nColour)