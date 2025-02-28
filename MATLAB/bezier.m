%% Function Name: bezier
%
% Description: A function for computing n Bezier polynomial curves of order
%   m-1. Heavily uses nchoosek(N,K) (see MATLAB documentation)
%   
% Inputs:
%   coeff: Matrix of n polynomials with order m-1
%   tau: Point of the curve is evaluated at P(s)
%
% Outputs:
%   fcn: The Bezier polynomials evaluated at tau. 

function fcn = bezier(coeff,tau) 
 
    if iscolumn(coeff)
        warning('First input (coeff) must be a matrix or a row');
    end
    if ~isvector(tau)
        warning('Second input (tau) must be a scalar or vector');
    end
    
    [n,m] = size(coeff); %n outputs for an Bth order Bezier (with m=B+1 coefficients)
    y = length(tau);
    
    B=m-1; %Bezier polynomials have m terms for m-1 order
    
    fcn = zeros(n,y);
    for k = 0:1:B
        fcn = fcn + coeff(:,k+1) .* singleterm_bezier(B,k,tau);
    end

end

% Function for facilitating the evaluation of each polynomial separately.
function val = singleterm_bezier(m,k,s)
  
    if (k == 0)
        val = nchoosek(m,k).*(1-s).^(m-k);
    elseif (m == k)
        val = nchoosek(m,k).*s.^(k);
    else
        val = nchoosek(m,k).*s.^(k).*(1-s).^(m-k);
    end

end