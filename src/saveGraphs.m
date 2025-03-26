function saveGraphs(p, box, g, vIni, h, totalTime, wallMove, doingSD, ...
    doingTask3)
    % This code is out of date
    % All the relevant variables to be appended to the filename for clarity
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

    % Save Mean Free Path
    figure(6)
    saveas(gcf, "../Graphs/mfp__" + params)

    if doingSD
        % Save Temperature Standard Deviation
        figure(7)
        saveas(gcf, "../Graphs/tempSD__" + params)
    
        % Save Temperatrue standard Deviation (log-log)
        figure(10)
        saveas(gcf, "../Graphs/tempSD_log__" + params)
    end

    % Save Speed histogram
    figure(8)
    saveas(gcf, "../Graphs/speed__" + params)

    if doingTask3
        figure(10)
        saveas(gcf, "../Graphs/a_against__" + params)
    end

    % Save Density Minimisation graph
    figure(100)
    saveas(gcf, "../Graphs/density_min__" + params)

    % Save Pressure Minimisation
    figure(81)
    saveas(gcf, "../Graphs/pressure_min__" + params)

    % Save Temperature minimisation
    figure(71)
    saveas(gcf, "../Graphs/temperature_min__" + params)

end