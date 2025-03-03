function [d, alpha] = particleDistanceCalc(A, B)
    %PARTICALDISTENSCALC calcs the distens and angle of A and B
    %   AB is expected to be 2d vectors of the 2d vectors 
    %   (so it's a 2x2 matrix). 
    d = norm(A -  B);
    alpha = atan2(A,B);
end