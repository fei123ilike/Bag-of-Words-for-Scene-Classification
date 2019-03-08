function [dictionary] = getDictionary(imgPaths, alpha, K, method)
% Generate the filter bank and the dictionary of visual words
% Inputs:
%   imgPaths:        array of strings that repesent paths to the images
%   alpha:          num of points
%   K:              K means parameters
%   method:         string 'random' or 'harris'
% Outputs:
%   dictionary:         a length(imgPaths) * K matrix where each column
%                       represents a single visual word
    % -----fill in your implementation here --------

    filterBank = createFilterBank();
    [~,T] = size(imgPaths);
    [n,~] = size(filterBank);
    pixelResponses = zeros(alpha*T,3*n);
    
    for i = 1:T
         img = imread(imgPaths{i});
%          [h,w,~] = size(img);
%          filterResponses = zeros(h,w,3*n);
        
         %check if the image is grayscale, if not transform it to grayscale
         if (ndims(img) == 3)
             I_g = rgb2gray(img);
         elseif (ndims(img) == 1)
             I_g = img;
          end
         I = im2double(I_g);
         
         filterResponses = extractFilterResponses(I, filterBank);
         
         
%        choose method to get different pixelResponse matrix
         for j = 1:(3*n)
             if method == 'random'
                Ponits = getRandomPoints(I, alpha);
                for k = 1:alpha
                    m_rand = Ponits(k,1);
                    n_rand = Ponits(k,2);
                    pixelResponses(alpha*(i-1)+k,j) = filterResponses(m_rand,n_rand,j);
                end
             end
             
             if method == 'harris'
                  Ponits = getHarrisPoints(I, alpha, 0.05);
                  for k = 1:alpha
                      m_harris = Ponits(k,1);
                      n_harris = Ponits(k,2);
                      pixelResponses(alpha*(i-1)+k,j) = filterResponses(m_harris,n_harris,j);
                  end
             end
         end
    end
    
     [~, dictionary] = kmeans(pixelResponses, K, 'EmptyAction', 'drop','MaxIter',500);
   
    
    

    % ------------------------------------------
    
end
