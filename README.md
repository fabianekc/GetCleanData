## Course Project - Getting and Cleaning Data ##

A repository containing all files for the course project of Getting and
Cleaning Data (3rd part of the Data Science specialization on Coursera).

#### Content ####
* README.md: this general description
* codebook.md: documentation of all variables in the output
* run_analysis.R: R script that processes the Samsung data set

#### Analysis Documentation ####
This section describes the steps performed in run_analysis.R.

1. Download & Extract Data

  This section is optional and includes the steps to download and unzip the
  Samsung data into the sub directory _data_.


2. Read Data Into R data.tables

  This section assumes that the Samsung data set is in the sub directory _data_
  of the working directory and loads the following fragments:

   * activity_names: name of the six activities from
     _UCI HAR Dataset/activity_labels.txt_

   * header_names: original variable names from _UCI HAR Dataset/features.txt_

   * test data set

     * test_subject: identification of each subject for each observation in the
        test data set from _UCI HAR Dataset/test/subject_test.txt_

     * test_data: actual data from _UCI HAR Dataset/test/X_test.txt_

     * test_activity: identification of the activity for each observation in the
         test data set from _UCI HAR Dataset/test/y_test.txt_

   * trainig data set

     * train_subject: identification of each subject for each observation in the
        training data set from _UCI HAR Dataset/test/subject_train.txt_

     * train_data: actual data from _UCI HAR Dataset/train/X_train.txt_

     * train_activity: identification of the activity for each observation in the
         training data set from _UCI HAR Dataset/train/y_train.txt_


3. Task 1: merges the training and the test sets to create one data set

  A complete set consits of subject id, activity number, and actual data. Those
  three items are combined with <code>cbind</code> and afterwards the complete
  test and training set are merged with <code>rbind</code>.


4. Task 4: appropriately labels the data set with descriptive variable names

  Task 4 is moved right after task 1 to have header names available for filtering
  the columns in task 2. Here is a short description of the used column names
  (for a detailed description look at the codebook):

    1. subject: unique id for each of the 30 subjects

    2. activity: identifies on of the six activities

    3. all following columns: data as provided in the original data using the
       header names as provided in _features.txt_ but reformatted in the following
       way:

         * any special characters <code>-()</code>   are removed

         * "mean" is replaced by "Mean"

         * "std" for standard deviation is replaced by "Sd" (following the R
           Syntax)


5. Task 2: extracts only the measurements on the mean and standard deviation
   for each measurement

  Since column names are already available we can extract now the relevant columns
  by subsetting the data frame using string comparison:

   * since only measurement are relevant, only columns starting with
     <code>t</code> are used

   * next we filter for mean and standard deviation

   * and finally we need to include the activity and subject columns

  all this put together leads to the following regular expression:
  <code>(^t.*(Sd|Mean))|(activity|subject)</code>


6. Task 3: uses descriptive activity names to name the activities in the data
   set

  This is simply done by replacing the activity ids with the actual names provided
  in _activity_lables.txt_ using <code>factor</code>.


7. Task 5: writes tidy data set with the average of each variable for each
   activity & subject

  The package <code>dplyr</code> provides here an elegant way to group the data
  set by subject and activity and calculate then mean and standard deviation.
  Since the instructions state that the tidy data set can be either in wide or
  long form and <code>dplyr</code> already provides everything in a wide form the
  output is directly written with <code>write.table</code>.

  (Note: I have read the forum posts arguing why the long form is better but
    converting the result in an additional step does not add any value in my
    opinion - I hope you agree :-) )
