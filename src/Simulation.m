function Simulation(nx,ball,box,g,Colours,vIni,h,totalTime)

timeSteps = totalTime/h ;
xNow=[box.left + rand(1,nx)*(box.right-box.left);...
     box.low + rand(1,nx)*(box.up-box.low)];
vNow = vIni*2*(rand(2,nx)-0.5) ;

plot = scatter(xNow(1,:),xNow(2,:),10,'Filled') ;
axis([box.left box.right box.low box.up])

for k = 1:timeSteps
    [xNow,vNow] = SimulationStep(h,xNow,vNow,ball,box,g) ;
    if mod(k,10) == 0 
        set(plot,'XData',xNow(1,:),'YData',xNow(2,:),"MarkerEdgeColor",'Black','MarkerFaceColor',Colours(k,:))
        drawnow
    end
end

