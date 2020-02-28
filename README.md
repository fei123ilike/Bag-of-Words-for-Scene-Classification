# Bag-of-Words-for-Scene-Classification
Implementation of scene classification system using Harris detector and Bag of words method.
## Introduction 

This project implements a scene classification system using traditional detector and descriptor approach, which is bag of visual words instead of Neural Networks. The classification system has been tested on SUN Image database consisting of 8 secene categories including campus, bedroom, etc. The current accuracy is 42.75% with Harris detector, chi-square distance methods.  
* Notice, the SOTA Deep Network Model can easily achieve 90% accuracy, nevertheless,this is still a practice tounderstanding the fundamental computer vision algorithm.*

## Pipeline
### Build a dictionary with visual words
Keypoint detection using Harris detector, detect the corner mostly.

**Example**
![alt-text-1](pic/500%20harris%20points_3.jpg "harris detector")


Extracte the responses from a series filter banks.

**Example**
<img src="https://github.com/fei123ilike/Bag-of-Words-for-Scene-Classification/blob/master/pic/response_12.jpg" width=200>  
<img src="https://github.com/fei123ilike/Bag-of-Words-for-Scene-Classification/blob/master/pic/response_24.jpg" width=200> 
<img src="https://github.com/fei123ilike/Bag-of-Words-for-Scene-Classification/blob/master/pic/response_36.jpeg" width=200> 

### Build a word map
Construct a wordmap, in which each pixel maps to the closest word in visual dictionary(calsulate by pdist2).


**Example**
![alt-text-1](pic/sun_aferisdmjeibigjh_wordMap.jpg "wordmap")

# Scene Classifycation and Evaluation
Run EvaluateRecognitionSystem.m
