% trajectoryCalc - this function uses parameters like e, a, b, n, p, E, and
%     trajectoryfunc to calculate the trajectory and store the x and y
%     values in an array
%     function [x, y] = trajectoryCalc(e, a, b, n, p, trajectoryfunc)
%
%    i=1;
%    for t = 0:0.01:p
%        M = n * t;
%        E = secantMethod(M, e, 2, 3, 10, 10^-6, trajectoryfunc);
%        x(i) = a * (cos(E) - e);
%        y(i) = b * (sin(E));  
%        
%        i = i + 1;
%    end
% 
% Syntax: [E] = trajectoryCalc(e, a, b, n, p, trajectoryfunc)
%
% Inputs: e is the eccentricity (which has no units), a and b are factors
%     (AU^2), n is the average speed in radians per day required for a body
%     to complete one orbit around a central body, p is the orbital period
%     measured in earth days, and trajectoryfunc which contains E, e, M.
%
% Outputs: x and y data points mapping out the trajectory of each of the
%     planets.

function [x, y] = trajectoryCalc(e, a, b, n, p, trajectoryfunc)

    i=1;
    for t = 0:0.01:p
        M = n * t;
        E = secantMethod(M, e, 2, 3, 10, 10^-6, trajectoryfunc);
        x(i) = a * (cos(E) - e);
        y(i) = b * (sin(E));  
        
        i = i + 1;
    end
end
