
%% The Simulation

rng(1);
p = 4  ;

nx = 4^p ; % The upper wall is contingent on nx... so...
usingSubBoxs = true; 
save = false;

%% Box and Ball

ball = struct('spring',250,'radius', 0.2) ;
L = 0 ;
U = 10*sqrt(nx) ;
subSize = ceil(U/10);

% Genuinely the stupidest thing I've done so far. But necessary for the vision.
% It'll be something I resolve when I neaten the code tuesday/wednesday
aVector = [1 2 3 4 5] ;
box = struct('low',L,'up',U,'left',L,'right',U,'tau',10,'a',aVector(1)) ;
subBox = struct('x', subSize, 'y', subSize); 


%% Experiment Parameters
g = 0.05 ;
vIni = 2.5 ;
nColour = 10 ;

%% Time Parameters
h = 0.01 ;
totalTime = 100 ;

doingTask2 = false; % finding variance for multiple values of N
doingTask3 = false;
moveWalls = false; % (Necessary if doing task3)

pMax = 4;

