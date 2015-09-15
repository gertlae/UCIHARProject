# Readme file for UCI HAR Project

## This file explains the files in the repo. For more details about how the scripts work see section below
- activity_labels.txt  
  Input file form the UCI HAR Dataset containing the activity labels  

-	Codebook.md
  Codebook file for data in TidyUCIHAR.txt 

-	ExploratoryAnalysis.R  
  File contains code to get to know the provided data and construct the requested data set. It illustrates my thinking.

-	features.txt  
  Input file form the UCI HAR Dataset containing

-	features_info.txt  
  Input file form the UCI HAR Dataset containing

- run_analysis.R  
  Contains the R code to generate the tidy data set in TidyUCIHAR.txt  
  
- subject_test.txt  
  Input file form the UCI HAR Dataset containing the subject variable for test dataset

-	subject_train.txt  
  Input file form the UCI HAR Dataset containing the subject variable for train dataset

- TidyUCIHAR.txt  
  Output file containing the tidy data set

- X_test.txt  
  Input file form the UCI HAR Dataset containing the test data set without subject and activity variables

- X_train.txt  
  Input file form the UCI HAR Dataset containing the train data set without subject and activity variables

- y_test.txt  
  Input file form the UCI HAR Dataset containing the activity variable for test dataset

- y_train.txt  
  Input file form the UCI HAR Dataset containing the activity variable for train dataset

## How was TidyUCIHAR created with the run_analysis.R ?

The final tidy data set Har was written to file
```
write.table(Har, file ="TidyUCIHAR.txt", row.names = F )
```
The merged train and test data set called Har was grouped by Subject and Activity, and the mean was taken of all means. The standard deviations were removed before the mean of the grouping was taken.

```
Har <- select(Har,1:2, contains("mean"))
Har <- group_by(Har, Subject, Activity)
Har <- summarise_each(Har, funs(mean))
```
In the merged train and test data, Har, the activity id was replaced by the descriptive label, by joining the merged data frame with the activities data fram from activities_labels.txt. For this a left join was performed by Activity between the merged data frame Har and the activities dataframe. The original column was then overwritten by the labels.

```
activities <- read.table("activity_labels.txt", header = F, col.names = c("Activity", "ActLabel"))
activities$Activity <-as.factor(activities$Activity)
Har <- left_join(Har, activities, by = "Activity")
Har <- mutate(Har,Activity = ActLabel)
Har <- select(Har, -ActLabel)
```
From the merged train and test data in Har data frame all variables that were not mean or stand deviations were removed.
Used the dplyr package select, inlcuded [.] in contains to remove function such as meanFreq() which is a Weighted average and not a mean

```
library(dplyr)
Har <- select(Har,1:2, contains(".mean."), contains(".std."))
```
The train and test data were merged into Har data frame. To save memory Train was loaded into Har data fram and Test was subsequently appended.
```
library(dplyr)
Har <- bind_rows(Har,Tst)
```

Before merging the train and test data set, they were each transformed:  
- the Subjects from subject_test/train.txt were added to the dataset were used to enrich X_test/train.txt  
- the Activities from y_test/y_train were also added  
Features.txt was used to load the variable names so they get descriptive names. Assumption taken is that the order of the obeservations is the same in the resp test/train files.
Code example for train data set. 

```
features <- readLines("features.txt")
subjects <- readLines("subject_train.txt")
y <- readLines("y_train.txt")
x <- read.table("x_train.txt", header = F,col.names = features)

Trn <-  data.frame(Subject = as.integer(subjects), Activity = y, x)
```
  