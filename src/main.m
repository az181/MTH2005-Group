close all
clear
Parameters

if doingTask2 
    graphData = task2(ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls, pMax);
elseif doingTask3
    graphData = task3(nx, ball, box, usingSubBoxs, subBox, g, vIni, h, totalTime, nColour, moveWalls) ;
else
    graphData = Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour,moveWalls);
end


drawGraphs(graphData, doingTask2, doingTask3)
if save 
    saveGraphs(p, box, g, vIni, h, totalTime, moveWalls)
end