function Simulation(nx,ball,box,usingSubBoxs,subBox,g,vIni,h,totalTime,nColour)

timeSteps = totalTime/h ;
xNow=[box.left + rand(1,nx)*(box.right-box.left);...
     box.low + rand(1,nx)*(box.up-box.low)];
vNow = vIni*2*(rand(2,nx)-0.5) ;
collisionCountTotal = zeros(length(nx),1);

plot = scatter(xNow(1,:),xNow(2,:),10,'Filled') ;

grid on
xticks(0:box.right/subBox.x:box.right)
yticks(0:box.right/subBox.y:box.up)

axis([box.left box.right box.low box.up])
axis square

for k = 1:timeSteps
    [xNow,vNow, collisionCount, boxIndex] = SimulationStep(h,xNow,vNow,ball,box,usingSubBoxs,subBox,g) ;
    collisionCountTotal = collisionCount + collisionCountTotal;
    if mod(k,20) == 0 
        %colours = speedColour(vNow,nColour) ;
        colours = boxColour(boxIndex,subBox) ;
        set(plot,'XData',xNow(1,:),'YData',xNow(2,:),"MarkerEdgeColor",'Black','CData',colours)
        drawnow
    end
    % updateGraphs(xNow, vNow, box, k);
    disp(k*h)
end
disp(collisionCountTotal)