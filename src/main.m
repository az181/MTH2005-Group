close all
clear
Parameters

if doingTask2 
    graphData = task2(ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls, pMax);
elseif doingTask3
    graphData = task3(nx, ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls,aVector);
else
    graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour,moveWalls,isCalculatingPressure);
end


%% AHAHHAHAHHHHHHHHHHHHHHH GO AWAY this is a iestyn sanity measure atm
iWantGraphs = true ; % 
if iWantGraphs
    drawGraphs(graphData, doingTask2, doingTask3)
end

if savingGraphs
    saveGraphs(p, box, g, vIni, h, totalTime, moveWalls)
end