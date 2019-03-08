function [points] = getRandomPoints(I, alpha)
% Generates random points in the image
% Input:
%   I:                      grayscale image
%   alpha:                  random points
% Output:
%   points:                    point locations
%
	% -----fill in your implementation here --------

    points = zeros(alpha,2);
    
    [m,n,~] = size(I);
    idx = randsample(m*n,alpha);
    [x,y] = ind2sub([m n],idx);

    points = [x,y] ;
    % ------------------------------------------

end

