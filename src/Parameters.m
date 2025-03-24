
%% The Simulation

rng(1);
p = 3  ;

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
box = struct('low',L,'up',U,'left',L,'right',U,'tau',10,'a',a) ;
subBox = struct('x', subSize, 'y', subSize); 


%% Experiment Parameters
g = 0.05 ;
vIni = 2.5 ;
nColour = 10 ;

%% Time Parameters
h = 0.01 ;
totalTime = 100 ;

doingTask2 = false;
doingTask3 = true;
moveWalls = true; % (Necessary if doing task3)

pMax = 1.5;
pMax = 4;

