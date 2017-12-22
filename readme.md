## Cleaning and Getting Data - Assignment 4
### Author: Samuel Quiroga

This document describes the workflow performed on the exercise data for the Assignment 4 in the Getting and Cleaning Data Course. 

To read the final tidy data set in R, type: read.table("Run_Analysis_Averages.txt")

### Loading the data files: Read the training and test sets with respective subject and activity:
* In this step we use the read.table function to read the data into R

### 1. Merges the training and the test sets to create one data set. 

**Combine each data set**
* Use the cbind function to combine the columns of the respective train and test data sets

**merge both data sets into one**
* Use the rbind function to merge the data sets into one merged data set

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* Using the features.txt file, we use grep to extract the vector positions of features that have "mean" and "std"
* Since the subject and activity columns appear first in the merged data frame, we add two to each of the indices from the previous step
* We se the final vector positions (a numeric vector telling us wich columns we need) to subset the merged data in a "simplified_df" data frame

### 3. Uses descriptive activity names to name the activities in the data set
* We load the activity labels file ("activity_labels.txt") into R
* Use mutate and sapply to add a column with descriptive activity names
* Then we re-order the columns so that the Subject and Activity are in the first colunm

### 4. Appropriately labels the data set with descriptive variable names.
* In this step we use grep function again but this time extrat the actual label names for each feature
* We add a label to the Subject ID and to the Activity Name
* Finally, we use gsub to replace character strings in order to make the labels easier to read
* Use the colnames function to change tha names of the columns

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* In this final step we group the data by Subject, then by Activity, and then summarize the variables to obtain the mean of each
* We end with one observation for each subject-activity pair: a total of 180 observations for 30 subjects and 6 activities