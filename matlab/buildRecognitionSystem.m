

function buildRecognitionSystem(dictionaryType)

load ('traintest.mat');
load('filterBank');
K =125;
m = numel(train_imagenames);
n = numel(test_imagenames);
trainFeatures = zeros(m,K);
testFeatures = zeros(n,K);
source = '../data/';
labels1 = train_labels;
labels2 = test_labels;

if dictionaryType == 'harris'
    load('dictionaryHarris.mat','dictionary');
    [dictionarySize,~] = size(dictionary);
    
    %read each image wordmap from training image, and output the training feature  
    for i = 1:m
        train_wordMap(i) = load([source, strrep(train_imagenames{i},'.jpg','.mat')]);
        train_temp = cell2mat(struct2cell(train_wordMap(i)));
        h_train = getImageFeatures(train_temp, dictionarySize);
        trainFeatures(i,:) = h_train;
        train_labels = labels1;
        
    end
    %read each image wordmap from testing image, and output the testing feature     
    for j = 1:n
          test_wordMap(j) = load([source, strrep(test_imagenames{j},'.jpg','.mat')]);
          test_temp = cell2mat(struct2cell(test_wordMap(j)));
          h_test = getImageFeatures(test_temp, dictionarySize);
          testFeatures(j,:) = h_test;
          test_labels = labels2;
          
    end
save('visionHarris.mat','train_labels','trainFeatures','test_labels','testFeatures');
   
end


if dictionaryType == 'random'
    load('dictionaryRandom.mat','dictionary');
    [dictionarySize,~] = size(dictionary);
   
    %read each image wordmap from training image, and output the training feature 
     for i = 1:m
        train_wordMap(i) = load([source, strrep(train_imagenames{i},'.jpg','.mat')]);
        train_temp = cell2mat(struct2cell(train_wordMap(i)));
        h_train = getImageFeatures(train_temp, dictionarySize);
        trainFeatures(i,:) = h_train;
        train_labels = labels1;
     end
     %read each image wordmap from testing image, and output the testing feature  
     for j = 1:n
          test_wordMap(j) = load([source, strrep(test_imagenames{j},'.jpg','.mat')]);
          test_temp = cell2mat(struct2cell(test_wordMap(j)));
          h_test = getImageFeatures(test_temp, dictionarySize);
          testFeatures(j,:) = h_test;
          test_labels = labels2;
     end
 save ('visionRandom.mat','train_labels','trainFeatures','test_labels','testFeatures');
end




