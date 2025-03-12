function Simulation(nx,ball,box,g,vIni,h,totalTime,nColour)

timeSteps = totalTime/h ;
xNow=[box.left + rand(1,nx)*(box.right-box.left);...
     box.low + rand(1,nx)*(box.up-box.low)];
vNow = vIni*2*(rand(2,nx)-0.5) ;
collisionCountTotal = zeros(length(nx),1);

plot = scatter(xNow(1,:),xNow(2,:),10,'Filled') ;
axis([box.left box.right box.low box.up])
% xlim([box.left box.right]);
% ylim([box.low box.up]);
axis square

graphData = struct('temperature', [], 'density', [], 'distance', zeros(1, length(xNow)), ...
    'oldPosition', xNow, 'collisions', zeros(1, length(xNow)));

for k = 1:timeSteps
    [xNow,vNow, collisionCount, Fwall] = SimulationStep(h,xNow,vNow,ball,box,g) ;
    collisionCountTotal = collisionCount + collisionCountTotal;
    if mod(k,20) == 0 
        colours = speedColour(vNow,nColour) ;
        set(plot,'XData',xNow(1,:),'YData',xNow(2,:),"MarkerEdgeColor",'Black','CData',colours)
        drawnow 
    end
    graphData = updateGraphs(xNow, vNow, box, k, graphData, collisionCountTotal, Fwall);
    disp(k*h)
end

disp(collisionCountTotal)
drawGraphs(graphData)