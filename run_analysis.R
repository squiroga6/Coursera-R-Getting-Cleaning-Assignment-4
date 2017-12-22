library(dplyr)
library(tidyr)
# 1. Merges the training and the test sets to create one data set. 
# along with the respective subject and activity data.

# Read the training and test sets with respective subject and activity:
train_set <-read.table("X_train.txt")
test_set  <-read.table("X_test.txt")

activity_train <-read.table("y_train.txt")
activity_test  <-read.table("y_test.txt")

subject_train <-read.table("subject_train.txt")
subject_test  <-read.table("subject_test.txt")

# Use cbind() to combine the columns of the train and test data
training_data <-cbind(subject_train, activity_train,train_set)
test_data     <-cbind(subject_test, activity_test,test_set)
# Use rbind() to merge both data sets into one
merged_df<-rbind(training_data, test_data)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Make a vector that identidies the column numbers containing "mean" and "std" from the features
features<-read.table("features.txt")

toMatch<-c("mean", "std")

matches<-grep(paste(toMatch, collapse = "|"),features$V2) + 2 # adds 2 to account for new columns added

all_matches<-append(c(1,2), matches) # adds the columns with subject ID and activity ID

simplified_df<-subset(merged_df, select = all_matches) # extract desired columns

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table("activity_labels.txt")

# create a column with the activity labels
labelled_df<-mutate(simplified_df, Activity = 
                            sapply(simplified_df$V1.1, function(x){activity_labels[x,2] }))
# order the columns in toder to have the subject and activity labels in the first two columns
ordered_df<-select(labelled_df,c(1,82,2:81), -2)

# 4. Appropriately labels the data set with descriptive variable names.
feature_labels<-grep(paste(toMatch, collapse = "|"),features$V2, value = TRUE)

column_labels<-append(c("Subject.ID","Activity"), feature_labels)

# clean up naming character strings
fixed_col_labels<-column_labels %>% 
        gsub(pattern = "-", replacement = ".") %>% 
        gsub(pattern = "\\(", replacement = "") %>% 
        gsub(pattern = "\\)", replacement = "") %>% 
        sub(pattern = "^t", replacement = "time.") %>% 
        sub(pattern = "^f", replacement = "freq.")
# create new data frame
named_df<-ordered_df
# change column names of the new data frame
colnames(named_df) <- fixed_col_labels

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

tidy_df<- named_df %>% 
        group_by(Subject.ID, Activity) %>% 
        summarise_at(vars(time.BodyAcc.mean.X:freq.BodyBodyGyroJerkMag.meanFreq), mean)

write.table(tidy_df, file = "Run_Analysis_Averages.txt", sep = "\t", row.names = FALSE)