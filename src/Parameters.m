close all
clear
%% The Simulation
p = 2 ;
nx = 4^p ; % The upper wall is contingent on nx... so...
usingSubBoxs = true; 
%% Box and Ball
ball = struct('spring',250,'radius',0.2) ;
L = 0 ;
U = 10*sqrt(nx) ;
box = struct('low',L,'up',U,'left',L,'right',U) ;
subBox = struct('x', 4, 'y', 4); 

%% Experiment Parameters
g = 0.0 ;
vIni = 2.5 ;
nColour = 10 ;

%% Time Parameters
h = 0.01 ;
totalTime = 100 ;

Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour)