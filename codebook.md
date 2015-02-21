## Code Book ##

This is the code book for the course project of Getting and Cleaning Data (3rd
  part of the Data Science specialization on Coursera).

#### Content ####

This code book provides the following information:

* *Original Data:* Information about the variables in the data set not contained in the tidy data

* *Tidy Data:* Information about the summary choices made

* *Study Design:* Information about the experimental study design used


### Original Data ###

The original data was obtained from the following address:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

All information about the data and variable names is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

To summarize the most relevant parts of describing the original data, the
following text from _features_info.txt_ is copied in here:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
>
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
>
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


### Tidy Data ###

According to the instructions only a subset of the original data set was used.
This subset focuses on measurements on the mean and standard deviation for each
measurement.


### Study Design ###

The study design of the original experiment is described here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The subject of further processing this original data was to get mean and
standard deviation for each measurement grouped by subject and activity. Since
there were 30 participants (= subjects) and 6 activities were tracked the tidy
data set consists of 180 observations.
