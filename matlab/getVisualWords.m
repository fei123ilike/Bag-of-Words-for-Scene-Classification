function [wordMap] = getVisualWords(I, dictionary, filterBank)
% Convert an RGB or grayscale image to a visual words representation, with each
% pixel converted to a single integer label.   
% Inputs:
%   I:              RGB or grayscale image of size H * W * C
%   filterBank:     cell array of matrix filters used to make the visual words.
%                   generated from getFilterBankAndDictionary.m
%   dictionary:     matrix of size 3*length(filterBank) * K representing the
%                   visual words computed by getFilterBankAndDictionary.m
% Outputs:
%   wordMap:        a matrix of size H * W with integer entries between
%                   1 and K

    % -----fill in your implementation here --------

    [H,W, ~] = size(I);
    filterResponses = extractFilterResponses(I, filterBank);

%     wordMap = zeros(H,W);
%     for i = 1:H
%         for j = 1:W
%              filterResponses_2D((i-1)*W+j,:) = filterResponses(i,j,:);
%              
%         end
%     end
     filterResponses_2D = reshape(filterResponses,[H*W,60]);
    dist = pdist2(dictionary,filterResponses_2D);
    [~,idx] = min(dist);  
    wordMap = reshape(idx,size(I,1),size(I,2)); 

%     for i = 1:H
%          for j = 1:W
%             wordMap(i,j) = idx((i-1)*W+j);
%              
%          end
%     end
    % ------------------------------------------
end
