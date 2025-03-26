close all
clear

%% Main
Parameters % call parameters

% run simulation based on relevant task
if doingSD 
    graphData = task2(ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls, pMax);
elseif doingTask3
    graphData = task3(nx, ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls,aVector) ;
else
    graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour,moveWalls);
end

%% Draw Graphs
iWantGraphs = true ; 
if iWantGraphs
    drawGraphs(graphData, doingSD, doingTask3)
end

if savingGraphs
    saveGraphs(p, box, g, vIni, h, totalTime, moveWalls)
end