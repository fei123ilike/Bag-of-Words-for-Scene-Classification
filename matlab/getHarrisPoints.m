function [points] = getHarrisPoints(I, alpha, k)
% Finds the corner points in an image using the Harris Corner detection algorithm
% Input:
%   I:                      grayscale image
%   alpha:                  number of points
%   k:                      Harris parameter
% Output:
%   points:                    point locations
%
    % -----fill in your implementation here --------
    
    %Initialize image I, img, and response function R in matrix form
    [m,n,~] = size(I);
    img = zeros(m,n);
    points = zeros(alpha,2);
    R_m = zeros(m,n);
    
    % check if I is grayscale image
    if (ndims(I) == 3)
        img = rgb2gray(I);
    end
    if (ndims(I) == 1)
        img = I;
    end
    
    %paddle the image
    pad_rows = 1;
    pad_cols = 1;
    pad_img = padarray(img,[pad_rows pad_cols],'replicate','both');
    
    %Sobel kernal to detect edge
     Sy = [1,2,1;0,0,0;-1,-2,-1]./8;
     Sx = [1,0,-1;2,0,-2;1,0,-1]./8;
     
     
     %Define derivative Ix, Iy
     Ix = imfilter(pad_img, Sx, 'conv');
     Iy = imfilter(pad_img, Sy,'conv' );
     Ix2 = Ix.^2;
     Ixx = imgaussfilt(Ix2);
     Iy2 = Iy.^2;
     Iyy = imgaussfilt(Iy2);
     IxIy = Ix.*Iy;
     Ixy = imgaussfilt(IxIy);
     R_m = (Ixx.*Iyy - (Ixy).^2) - k*((Ixx+Iyy).^2);
     %compute the gradiant covariance for each pixel in 3*3 window
    
     
%      for i = 2:m-1
%          for j= 2:n-1
%              Ixx = Ix(i:i+2,j:j+2).*Ix(i:i+2,j:j+2);
%              Iyy = Iy(i:i+2,j:j+2).*Iy(i:i+2,j:j+2);
%              Ixy = Ix(i:i+2,j:j+2).*Iy(i:i+2,j:j+2);
%              
%              
%              Ixx_sum = sum(Ixx(:));
%              Iyy_sum = sum(Iyy(:));
%              Ixy_sum = sum(Ixy(:));
%              
%              
%              det = Ixx_sum * Iyy_sum - Ixy_sum * Ixy_sum;
%              trace = Ixx_sum + Iyy_sum;
%              R = det - k*trace*trace;
%              R_func(i,j) = R;
%              
%          end
%      end
     
    %find the biggest alpha elements and return their index
    %merge m*n matrix(every column) as 1-row array and sort in descend order
    %reuse code from assignment 1, myHoughLines.m
    k =zeros(1,m*n);
    for i = 1:m
        for j = 1:n
        k((i-1)*n+j) = R_m(i,j);
        end
    end

    [~, sort_index] = sort(k, 'descend');
     %return the original location of the matix
    for i = 1:alpha
         points(i,1) =  ceil(sort_index(i)/n);
         points(i,2) = (sort_index(i) - (points(i,1) - 1)*n);
     end
     
    % ------------------------------------------

end
