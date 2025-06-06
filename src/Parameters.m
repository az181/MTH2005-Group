%% Parameters

% basic rules
rng(1);    % set seed
p = 4;     % number of particles is 4^p
nx = 4^p; % used when something depends on number of particles



pMax = 4;  % maximum p for standard deviation in task 2

usingSubBoxs = true; 
savingGraphs = false; 
isCalculatingPressure = true;
iWantGraphs = true ; 

%% Box and Ball
ball = struct('spring',250,'radius', 0.2) ;
L = 0;                 % bottom left corner is (L,L)
U = 10*sqrt(nx);       % top right corner is (U,U)
subSize = ceil(U/10);  % number of sub boxes adjusts with box size

% values of a for task 3

aVector = [1 2 4 5 8] ;
box = struct('low',L,'up',U,'left',L,'right',U,'tau',10,'a',aVector(1)) ;
subBox = struct('x', subSize, 'y', subSize); 


%% Experiment Parameters
g = 0.00 ;       % gravity
vIni = 2.5;      % maximum initial velocity
nColour = 10;    % number of colours for speed

%% Time Parameters
h = 0.01 ;        % time step 
totalTime = 50 ; % total time


doingSD = false; % finding standard deviation for multiple values of N
doingTask3 = true; % 
moveWalls = true; % (Necessary if doing task3)


