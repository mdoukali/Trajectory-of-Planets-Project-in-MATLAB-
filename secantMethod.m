% secantMethod - this function uses parameters M, e, xInitial, xFinal,
%     maxIter, toleranceFunctional, and secantfunc in order to calculate
%     the correct E number (or position of the celestial body)
% 
% function [xFinal] = secantMethod(M, e, xInitial, xFinal, maxIter, toleranceFunctional, secantfunc)
%    count = 1;
%    tolerance = 1;
%    while count < maxIter &&  abs(tolerance) >= toleranceFunctional
%        oldXFinal = xFinal;
%        xFinal = xInitial - secantfunc(xInitial, e, M) * ((xFinal-xInitial)/(secantfunc(xInitial, e, M) * secantfunc(xFinal, e, M)));
%        tolerance = secantfunc(xFinal, e, M);        
%        count = count + 1;
%        xInitial = oldXFinal;
%    end
%
% end
%
% Syntax: [xRoot] = secantMethod(M, e, xInitial, xFinal, maxIter, toleranceFunctional, secantfunc)
%
% Inputs: M is the angle (in radians) that starts from the center of the
%     central body and is connected to the orbital body (the orbital body's
%     M ranges from 0 to 2pi, as that range signifies one full rotation); e is the
%     eccentricity which has no units (it dictates the shape of the path of
%     orbit); and xInitial and xFinal are the users guesses for E (E is
%     called the eccentric anomaly and its units are in radians), maxIter
%     is the variable used to store the number of iterations allowed within
%     our calculations, toleranceFunctional is the provided tolerance;
%     finally, secantfunc is the anonymous function containing parameters M, e, and 
%     E and the equation E - e * sin(E) - M so that f(E) can be calculated
%
% Outputs: xFinal is the root found after going through multiple iterations of the same 
%     function until meeting the threshold of having the function with the root as an input 
%     be less than the tolerance

function [xFinal] = secantMethod(M, e, xInitial, xFinal, maxIter, toleranceFunctional, secantfunc)
    count = 1;
    tolerance = 1;
    while count < maxIter &&  abs(tolerance) >= toleranceFunctional
        oldXFinal = xFinal;
        xFinal = xInitial - secantfunc(xInitial, e, M) * ((xFinal-xInitial)/(secantfunc(xInitial, e, M) * secantfunc(xFinal, e, M)));
        tolerance = secantfunc(xFinal, e, M);        
        count = count + 1;
        xInitial = oldXFinal;
    end

end

