parpool('local', 6);
load('traintest.mat','all_imagenames');
imgPaths = all_imagenames;
alpha = 600;
K = 125;
dictionary = getDictionary(imgPaths, alpha, K, 'harris');
save('dictionaryHarris.mat','dictionary');
save('filterBank');

parpool('local', 6);
load('traintest.mat','all_imagenames');
imgPaths = all_imagenames;
alpha = 500;
K = 125;
dictionary = getDictionary(imgPaths, alpha, K, 'random');
save('dictionaryRandom.mat','dictionary');
save('filterBank');