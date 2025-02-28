%% Function Name: dbezier
%
% Description: A function for computing the first derivative of a set of
%   Bezier polynomials.
%   
% Inputs:
%   coeff: Matrix of n polynomials with order m-1
%   s: Point of the curve is evaluated at P(s)
%
% Outputs:
%   fcn: The first derivative of the Bezier polynomials at s. 
% ________________________________________

function fcn = dbezier(coeff,s,T)

    dcoeff = differentiateBezierCoefficients(coeff);
    fcn = bezier(dcoeff,s)*(1/T);
    
end