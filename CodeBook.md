#Code Book

##About

This document contains information on the original data used, the transformations that were used to produce the final data and the final form of the data including variable names snd structure.

##Original Experiment Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## How the variables were measured

The variables selected for this data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* **Important to note is that the variables are normalized and bounded within [-1,1].**

## Packages needed to run the R script

* plyr
* dplyr

## Important to note before you run the script

You may change line 14 in the script if you wish to modify your working directory

## Modifications that the script performs

* Downloads Data from the original data source and creates a Data Directory to save the data
* Reads the data into R and creates preliminary data sets
* Creates a combined data set with test and train data sets as well as variable names and   descriptive activity names
* Extracts only the measurements on  the mean and standard deviation for
  each measurement
* Appropriately labels the data set with descriptive activity names
* Creates a second, independent tidy data set with the average of each variable for each   activity and each subject
* Writes to TidyData.txt file

## Final Variables in the Data Set

* subject
* activity
* timeBodyAccMeanX
* timeBodyAccMeanY
* timeBodyAccMeanZ
* timeBodyAccStdDevX
* timeBodyAccStdDevY
* timeBodyAccStdDevZ
* timeGravityAccMeanX
* timeGravityAccMeanY
* timeGravityAccMeanZ
* timeGravityAccStdDevX
* timeGravityAccStdDevY
* timeGravityAccStdDevZ
* timeBodyAccJerkMeanX
* timeBodyAccJerkMeanY
* timeBodyAccJerkMeanZ
* timeBodyAccJerkStdDevX
* timeBodyAccJerkStdDevY
* timeBodyAccJerkStdDevZ
* timeBodyGyroMeanX
* timeBodyGyroMeanY
* timeBodyGyroMeanZ
* timeBodyGyroStdDevX
* timeBodyGyroStdDevY
* timeBodyGyroStdDevZ
* timeBodyGyroJerkMeanX
* timeBodyGyroJerkMeanY
* timeBodyGyroJerkMeanZ
* timeBodyGyroJerkStdDevX
* timeBodyGyroJerkStdDevY
* timeBodyGyroJerkStdDevZ
* timeBodyAccMagMean
* timeBodyAccMagStdDev
* timeGravityAccMagMean
* timeGravityAccMagStdDev
* timeBodyAccJerkMagMean
* timeBodyAccJerkMagStdDev
* timeBodyGyroMagMean
* timeBodyGyroMagStdDev
* timeBodyGyroJerkMagMean
* timeBodyGyroJerkMagStdDev
* freqBodyAccMeanX
* freqBodyAccMeanY
* freqBodyAccMeanZ
* freqBodyAccStdDevX
* freqBodyAccStdDevY
* freqBodyAccStdDevZ
* freqBodyAccMeanFreqX
* freqBodyAccMeanFreqY
* freqBodyAccMeanFreqZ
* freqBodyAccJerkMeanX
* freqBodyAccJerkMeanY
* freqBodyAccJerkMeanZ
* freqBodyAccJerkStdDevX
* freqBodyAccJerkStdDevY
* freqBodyAccJerkStdDevZ
* freqBodyAccJerkMeanFreqX
* freqBodyAccJerkMeanFreqY
* freqBodyAccJerkMeanFreqZ
* freqBodyGyroMeanX
* freqBodyGyroMeanY
* freqBodyGyroMeanZ
* freqBodyGyroStdDevX
* freqBodyGyroStdDevY
* freqBodyGyroStdDevZ
* freqBodyGyroMeanFreqX
* freqBodyGyroMeanFreqY
* freqBodyGyroMeanFreqZ
* freqBodyAccMagMean
* freqBodyAccMagStdDev
* freqBodyAccMagMeanFreq
* freqBodyBodyAccJerkMagMean
* freqBodyBodyAccJerkMagStdDev
* freqBodyBodyAccJerkMagMeanFreq
* freqBodyBodyGyroMagMean
* freqBodyBodyGyroMagStdDev
* freqBodyBodyGyroMagMeanFreq
* freqBodyBodyGyroJerkMagMean
* freqBodyBodyGyroJerkMagStdDev
* freqBodyBodyGyroJerkMagMeanFreq
* angletBodyAccMeanGravity
* angletBodyAccJerkMeanGravityMean
* angletBodyGyroMeanGravityMean
* angletBodyGyroJerkMeanGravityMean
* angleXGravityMean
* angleYGravityMean
* angleZGravityMean


