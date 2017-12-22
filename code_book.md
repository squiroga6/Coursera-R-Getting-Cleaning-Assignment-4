# Codebook for Run_Analysis.R file
## Week 4 Assignment for Getting and Cleaning Data Course
### Author: Samuel Quiroga

## The following information describes the experiment based on information provided

30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

Measurements captured:
* 3-axial linear acceleration
* 3-axial angular velocity 
Dataset partitioned into two sets:
* 70% the training data
* 30% the test data. 

For each record, it is provided:
* Triaxial acceleration 
* total acceleration 
* body acceleration
* Triaxial Angular velocity 
* A 561-feature vector 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The original dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'subject_train.txt'/'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Features Information:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals:
* tAcc-XYZ : Separated into:
	+tBodyAcc-XYZ
	+tGravityAcc-XYZ
* tGyro-XYZ
* These time domain signals (prefix 't' to denote time).

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
* tBodyAccJerk-XYZ
* tBodyGyroJerk-XYZ
	
Also the magnitude of these three-dimensional signals were calculated
* tBodyAccMag, 
* tGravityAccMag, 
* tBodyAccJerkMag, 
* tBodyGyroMag, 
* tBodyGyroJerkMag

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing a frequency dependant variable "f"
* fBodyAcc-XYZ, 
* fBodyAccJerk-XYZ, 
* fBodyGyro-XYZ, 
* fBodyAccJerkMag, 
* fBodyGyroMag, 
* fBodyGyroJerkMag. 

## The following information describes the workflow that was performed to clean and gather the data into a tidy dat set:

### Loading the data files: Read the training and test sets with respective subject and activity:

**Rename the input files with meaningful names:**

* train_set ("X_train.txt")
* test_set  ("X_test.txt")
* activity_train  ("y_train.txt")
* activity_test   ("y_test.txt")
* subject_train ("subject_train.txt")
* subject_test  ("subject_test.txt")

### 1. Merges the training and the test sets to create one data set. 

**Combine each data set**

* training_data: combine the columns of the train
* test_data: combine the columns of test data

**merge both data sets into one**

merged_df

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

* features : The set of variables that were estimated from the signals
* toMatch : the list of strings used to identify the mean and standard deviation
* matches : extracts the column indices for this the mean and standard deviation correspond to
* all_matches : list "matches" plus inlcudes the name of the subjects (their id #) and the activity
* simplified_df : data frame that extracts desired columns based on all_matches (for mean and std)

### 3. Uses descriptive activity names to name the activities in the data set

* activity_labels ("activity_labels.txt")

* labelled_df : create a column with the activity labels, this uses the sapply function and the mutate function
* ordered_df: order the columns in toder to have the subject and activity labels in the first two columns

### 4. Appropriately labels the data set with descriptive variable names.

* feature_labels : uses the list "toMatch" to extract the list of variable names with mean and standard deviation

* column_labels : appends the subject ID and activity label to the above list

* clean up naming character strings using piping operator: replace "-" with ".", remove "()"

After replacing "t" with "time" and "f" with "Freq", we also replace dashes and parenthesis to make the variables easier to read.

### Based on the above informationThe final tidy data set contains the following variables

* 1 Subject.ID
* 2 Activity
* 3 time.BodyAcc.mean.X
* 4 time.BodyAcc.mean.Y
* 5 time.BodyAcc.mean.Z
* 6 time.BodyAcc.std.X
* 7 time.BodyAcc.std.Y
* 8 time.BodyAcc.std.Z
* 9 time.GravityAcc.mean.X
* 10 time.GravityAcc.mean.Y
* 11 time.GravityAcc.mean.Z
* 12 time.GravityAcc.std.X
* 13 time.GravityAcc.std.Y
* 14 time.GravityAcc.std.Z
* 15 time.BodyAccJerk.mean.X
* 16 time.BodyAccJerk.mean.Y
* 17 time.BodyAccJerk.mean.Z
* 18 time.BodyAccJerk.std.X
* 19 time.BodyAccJerk.std.Y
* 20 time.BodyAccJerk.std.Z
* 21 time.BodyGyro.mean.X
* 22 time.BodyGyro.mean.Y
* 23 time.BodyGyro.mean.Z
* 24 time.BodyGyro.std.X
* 25 time.BodyGyro.std.Y
* 26 time.BodyGyro.std.Z
* 27 time.BodyGyroJerk.mean.X
* 28 time.BodyGyroJerk.mean.Y
* 29 time.BodyGyroJerk.mean.Z
* 30 time.BodyGyroJerk.std.X
* 31 time.BodyGyroJerk.std.Y
* 32 time.BodyGyroJerk.std.Z
* 33 time.BodyAccMag.mean
* 34 time.BodyAccMag.std
* 35 time.GravityAccMag.mean
* 36 time.GravityAccMag.std
* 37 time.BodyAccJerkMag.mean
* 38 time.BodyAccJerkMag.std
* 39 time.BodyGyroMag.mean
* 40 time.BodyGyroMag.std
* 41 time.BodyGyroJerkMag.mean
* 42 time.BodyGyroJerkMag.std
* 43 freq.BodyAcc.mean.X
* 44 freq.BodyAcc.mean.Y
* 45 freq.BodyAcc.mean.Z
* 46 freq.BodyAcc.std.X
* 47 freq.BodyAcc.std.Y
* 48 freq.BodyAcc.std.Z
* 49 freq.BodyAcc.meanFreq.X
* 50 freq.BodyAcc.meanFreq.Y
* 51 freq.BodyAcc.meanFreq.Z
* 52 freq.BodyAccJerk.mean.X
* 53 freq.BodyAccJerk.mean.Y
* 54 freq.BodyAccJerk.mean.Z
* 55 freq.BodyAccJerk.std.X
* 56 freq.BodyAccJerk.std.Y
* 57 freq.BodyAccJerk.std.Z
* 58 freq.BodyAccJerk.meanFreq.X
* 59 freq.BodyAccJerk.meanFreq.Y
* 60 freq.BodyAccJerk.meanFreq.Z
* 61 freq.BodyGyro.mean.X
* 62 freq.BodyGyro.mean.Y
* 63 freq.BodyGyro.mean.Z
* 64 freq.BodyGyro.std.X
* 65 freq.BodyGyro.std.Y
* 66 freq.BodyGyro.std.Z
* 67 freq.BodyGyro.meanFreq.X
* 68 freq.BodyGyro.meanFreq.Y
* 69 freq.BodyGyro.meanFreq.Z
* 70 freq.BodyAccMag.mean
* 71 freq.BodyAccMag.std
* 72 freq.BodyAccMag.meanFreq
* 73 freq.BodyBodyAccJerkMag.mean
* 74 freq.BodyBodyAccJerkMag.std
* 75 freq.BodyBodyAccJerkMag.meanFreq
* 76 freq.BodyBodyGyroMag.mean
* 77 freq.BodyBodyGyroMag.std
* 78 freq.BodyBodyGyroMag.meanFreq
* 79 freq.BodyBodyGyroJerkMag.mean
* 80 freq.BodyBodyGyroJerkMag.std
* 81 freq.BodyBodyGyroJerkMag.meanFreq

named_df: create new data frame and change column names of the new data frame

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_df : group by Subject.ID, then group by Activity, then summarize each subject-activity pair with the mean for each variable

Outputs tidy file as a text.file called "Run_Analysis_Averages.txt"	


