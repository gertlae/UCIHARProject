## set environment variables: working directory & packages
ProjectWD = "C:/EDS/DSS/GetandCleanData/UCIHARProject"
DatasetGenWD = "C:/EDS/DSS/GetandCleanData/UCIHARProject"
DatasetTstWD = "C:/EDS/DSS/GetandCleanData/UCIHARProject"
DatasetTrnWD = "C:/EDS/DSS/GetandCleanData/UCIHARProject"
library(dplyr)


## 0. Read the input files.
##########################
setwd(DatasetGenWD)
## Read names of variables aka features
features <- readLines("features.txt")

setwd(DatasetTstWD)
## read the test data,  with the variable names aka features
x <- read.table("x_test.txt", header = F, col.names = features)
## read the subjects test variable subject_test.txt
subjects <- readLines("subject_test.txt")
## read the activities variable from y_test.txt
y <- readLines("y_test.txt")
## add subjects and activity variables to test data frame
Tst <-  data.frame(Subject = as.integer(subjects), Activity = y, x)

setwd(DatasetTrnWD)
## read the train  data,  with the variable names aka features
## store into Har immediately to save memory later
Har <- read.table("x_train.txt", header = F,col.names = features)
## read the subjects train variable
subjects <- readLines("subject_train.txt")
## read the activities variable
y <- readLines("y_train.txt")
## add subjects and activity variables to Har data frame
Har <-  data.frame(Subject = as.integer(subjects), Activity = y, Har)


setwd(DatasetGenWD)
## Read the labels for the activities
activities <- read.table("activity_labels.txt", header = F, col.names = c("Activity", "ActLabel"))
activities$Activity <-as.factor(activities$Activity)

## 1. Merges the training and the test sets to create one data set.
#####################################################################
## append Tst to Har saving memory
Har <- bind_rows(Har,Tst)
dim(Har)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
############################################################################################
## inlcude [.] in contains to remove functions such as meanfreq() which is weighted average
Har <- select(Har,1:2, contains(".mean."), contains(".std."))

## 3. Use descriptive activity names to name the activities in the data set.
############################################################################
Har <- left_join(Har, activities, by = "Activity")
Har <- mutate(Har,Activity = ActLabel)
Har <- select(Har, -ActLabel)

## 4. Appropriately labels the data set with descriptive variable names.
#######################################################################
## remove the Xnnn. from column names
Cols = colnames(Har)
Cols[-(1:2)] = substr(gsub("^.*?[.]","[.]",Cols[-(1:2)]),4, stop=100L)
## replace ... with _ , .. with and , . with _
Cols = gsub("[.][.][.]","_", Cols)
Cols = gsub("[.][.]","_", Cols)
Cols = gsub("[.]","_", Cols)
## update the col names in the data frame
colnames(Har) <- Cols
  
## 5. From the data set obtained before, create a second, independent tidy data set.
####################################################################################
## with the average of each variable for each activity and each subject
## Take the mean per Subject and Activity
Har <- group_by(Har, Subject, Activity)
Har <- summarise_each(Har, funs(mean))

setwd(ProjectWD)
## write the tidy dataset to disk
write.table(Har, file ="TidyUCIHAR.txt", row.names = F )

#########THE END############
