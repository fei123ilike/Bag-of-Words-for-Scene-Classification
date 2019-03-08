function [h] = getImageFeatures(wordMap, dictionarySize)
% Convert an wordMap to its feature vector. In this case, it is a histogram
% of the visual words
% Input:
%   wordMap:            an H * W matrix with integer values between 1 and K
%   dictionarySize:     the total number of words in the dictionary, K
% Outputs:
%   h:                  the feature vector for this image


	% -----fill in your implementation here --------
%     [H,W] = size(wordMap);
%     h_temp = zeros(dictionarySize,1);
%     for i = 1:H
%         for j = 1:W
%             if wordMap(i,j) == dictionary(i,j)
%                 h_temp(i) = h_temp(i) + 1;
%                 
%             end
%         end
%     end
%     
%     n = norm(h_temp,1);
%     h(i) = h_temp(i)/n;
    
    


     h_temp = histcounts(wordMap(:),dictionarySize);
    % Normalize the histogram to have a magnitude of 1.
     h_norm = h_temp/norm(h_temp,1);
     h = h_norm;
     
    % ------------------------------------------

end
