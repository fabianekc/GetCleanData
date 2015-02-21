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
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

All information about the data and variable names is available here:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]


### Tidy Data ###

According to the instructions only a subset of the original data set was used.
This subset focuses on measurements on the mean and standard deviation for each
measurement.


### Study Design ###

The study design of the original experiment is described here:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

The subject of further processing this original data was to get mean and
standard deviation for each measurement grouped by subject and activity. Since
there were 30 participants (= subjects) and 6 activities were tracked the tidy
data set consists of 180 observations.
