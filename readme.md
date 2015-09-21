# Readme file for UCI HAR Project

## This file explains the files in the repo. For more details about how the scripts work see section below

This repo contains the following files:  


- activity_labels.txt  
  Input file form the UCI HAR Dataset containing the activity labels  

-	**Codebook.md  
  Codebook file for data in TidyUCIHAR.txt** 

-	ExploratoryAnalysis.R  
  File contains code to get to know the provided data and construct the requested data set. It illustrates my thinking.

-	features.txt  
  Input file form the UCI HAR Dataset containing

-	features_info.txt  
  Input file form the UCI HAR Dataset containing
  
- **readme.md  
  This file**

- **run_analysis.R  
  Contains the R code to generate the tidy data set in TidyUCIHAR.txt** 
  
- subject_test.txt  
  Input file form the UCI HAR Dataset containing the subject variable for test dataset

-	subject_train.txt  
  Input file form the UCI HAR Dataset containing the subject variable for train dataset

- **TidyUCIHAR.txt  
  Output file containing the tidy data set created for this assignment**

- X_test.txt  
  Input file form the UCI HAR Dataset containing the test data set without subject and activity variables

- X_train.txt  
  Input file form the UCI HAR Dataset containing the train data set without subject and activity variables

- y_test.txt  
  Input file form the UCI HAR Dataset containing the activity variable for test dataset

- y_train.txt  
  Input file form the UCI HAR Dataset containing the activity variable for train dataset

## How does run_analysis.R work?

Before merging the train and test data set (loaded from resp. X_train.txt and X_test.txt), they were each enriched by combining the input files:  
- the Subjects from respectively subject_train.txt and subject_test.txt were added as first variable  
- the Activities from respectively y_train.txt and y_test.txt were also added as the second variable   
- Features.txt was used to load the variable names so they get descriptive names. 

Below the code example for train data set is given (similar code was used for test data set). 
  
```
features <- readLines("features.txt")
subjects <- readLines("subject_train.txt")
y <- readLines("y_train.txt")
x <- read.table("x_train.txt", header = F,col.names = features)

Har <-  data.frame(Subject = as.integer(subjects), Activity = y, x)
```
The rest of the data wrangling is now done using the dplyr library. The train and test data were merged into the target Har data frame. To save memory Train was loaded into Har data frame and Test was subsequently appended.  
  
```
library(dplyr)
Har <- bind_rows(Har,Tst)
```  
From the merged data (Har) all variables that were not mean or standard deviations were removed by selecting only variabeles that contain mean or std in their name. This was done by using the dplyr package select function. Note that [.] was included in the contains() function to avoid keeping variables such as meanFreq which is a weighted average and not a mean.  
```
library(dplyr)
Har <- select(Har,1:2, contains(".mean."), contains(".std."))
```  
In the merged data (Har), the activity id was replaced by the descriptive label, by joining the merged data frame with the activities data fram from activities_labels.txt. For this a left join was performed by Activity between the merged data frame Har and the activities dataframe. The original column was then overwritten by the labels.The intermediate variable containing the labels, Actlabel was then dropped.  
```
activities <- read.table("activity_labels.txt", header = F, col.names = c("Activity", "ActLabel"))
activities$Activity <-as.factor(activities$Activity)
Har <- left_join(Har, activities, by = "Activity")
Har <- mutate(Har,Activity = ActLabel)
Har <- select(Har, -ActLabel)
```  
The merged data (Har) was grouped by Subject and Activity, and the mean was taken of all variables except the Subject and Activity variables by which the data was grouped (this is a feature of summarise_each). 

```  
Har <- group_by(Har, Subject, Activity)
Har <- summarise_each(Har, funs(mean))
```  
The final tidy data set Har was written to file TidyUCIHAR.txt using write.table and without the variable names as requested.
```  
write.table(Har, file ="TidyUCIHAR.txt", row.names = F )
```  


## How does the ExploratoryAnalysis.R work?

Same as run_analsysis.R but was used to get to know the data and experiment with it and as such illustrates my thinking.