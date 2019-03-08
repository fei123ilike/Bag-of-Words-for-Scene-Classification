% evaluateRecognitionSystem.m
% This script evaluates nearest neighbour recognition system on test images
% load traintest.mat and classify each of the test_imagenames files.
% Report both accuracy and confusion matrix

load ('traintest.mat');
% load('dictionaryHarris.mat','dictionary');
% load('visionHarris.mat');
load('dictionaryRandom.mat','dictionary');
load('visionRandom.mat');


m = numel(train_imagenames);
n = numel(test_imagenames);

[dictionarySize,~] = size(dictionary);
dist = zeros(m,n);
%compute the disdance using euclidean or chisq method 
for i = 1:m
    for j = 1:n
        dist(i,j) = getImageDistance(testFeatures(j,:),trainFeatures(i,:), 'euclidean');
    end
end


[~,idx] = min(dist);
predict_labels = train_labels(idx);      
%calculate the confusion matrix and accuracy 
C = zeros(8,8);
for i = 1:n
     if test_labels(i) == predict_labels(i)
        C(test_labels(i),predict_labels(i)) = C(test_labels(i),predict_labels(i)) + 1;
     end
      if test_labels(i) ~= predict_labels(i)
        C(test_labels(i),predict_labels(i)) = C(test_labels(i),predict_labels(i)) + 1;  
      end
end
    
accuracy = trace(C) / n;
fprintf('Accuracy of this Recognition System: %.2f%% \n', accuracy*100);
disp(C);




