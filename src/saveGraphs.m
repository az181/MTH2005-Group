function [none] = saveGraphs(p, box, g, vIni, h, totalTime, wallMove)
    params = "p=" + p + "_g-" + g + "_vIni-" + vIni + ...
        "_h-" + h + "_totalTime-" + totalTime + "_boxwidth-" + ...
        (box.right - box.left) + "_boxheight-" + (box.up - box.low) + ...
        "_wallMoves-" + wallMove + ".png";

    % Save Temperature
    figure(2)
    saveas(gcf, "../Graphs/temperature__" + params)

    figure(3)  % Save Temperature Histogram
    saveas(gcf, "../Graphs/temperature_histogram__" + params)

    % Save Density
    figure(4)
    saveas(gcf, "../Graphs/density__" + params)

    % Save Pressure
    figure(5)
    saveas(gcf, "../Graphs/pressure__" + params)
end