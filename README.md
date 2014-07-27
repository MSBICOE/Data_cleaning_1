Data Cleaning Coursera - Assignment
===================================

Assignment Repo for Coursera data cleaning course

This is week 3 of data cleaning course assignment. The main purpose of this assignment is to combine the 2 datasets
together: train dataset and test dataset. After dataset is combined, the proper variable names need to be given based
on the variable name list from another variable list file (feature.txt file).

The data set can be downloaded from the below site:

[Human Activity Recognition Using Smartphones Dataset](<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>)

There are a few files in the zip file but only the files list below are relative to this assignment:
  - 'features_info.txt': Shows information about the variables used on the feature vector.
  - 'features.txt': List of all features.
  - 'activity_labels.txt': Links the class labels with their activity name.
  - 'train/X_train.txt': Training set.
  - 'train/y_train.txt': Training labels.
  - 'train/subject_train.txt'
  - 'test/X_test.txt': Test set.
  - 'test/y_test.txt': Test labels.
  - 'test/subject_test.txt'

R script called run_analysis.R in this Repo that does the following:
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement. 
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive variable names. 
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  
The script will write out a text file at the working directory.
