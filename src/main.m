close all
clear
Parameters

if doingTask2
    graphData = task2(ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls, pMax);
else
    graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour,moveWalls);
end

drawGraphs(graphData, doingTask2)
if savingGraphs
    saveGraphs(p, box, g, vIni, h, totalTime, moveWalls)
end