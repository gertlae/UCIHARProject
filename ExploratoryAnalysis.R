setwd("C:/EDS/DSS/GetandCleanData/UCIHARProject")
## first analyse test data set because it is smaller
## 3 files in test
## smallest first; subject_test.txt
## contains id of the subjects
subjects <- readLines("subject_test.txt")
str(subjects)
print(table(subjects))
##retruns the following:
##chr [1:2947] "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" "2" ...
##subjects
##10  12  13  18   2  20  24   4   9 
##294 320 327 364 302 354 381 317 288 
##Second smallest y test
y <- readLines("y_test.txt")
str(y)
print(table(y))
##retruns the following:
## chr [1:2947] "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" "5" ...
## y
## 1   2   3   4   5   6 
## 496 471 420 491 532 53

## third file is the dataset
x <- read.table("x_test.txt", header = F)
dim(x)
summary(x[1:3])
## [1] 2947  561
##       V1                V2                 V3          
## Min.   :-0.5920   Min.   :-0.36288   Min.   :-0.57618  
## 1st Qu.: 0.2621   1st Qu.:-0.02496   1st Qu.:-0.12116  
## Median : 0.2771   Median :-0.01697   Median :-0.10846  
## Mean   : 0.2740   Mean   :-0.01786   Mean   :-0.10839  
## 3rd Qu.: 0.2881   3rd Qu.:-0.01014   3rd Qu.:-0.09712  
## Max.   : 0.6719   Max.   : 0.24611   Max.   : 0.49411 


## names of variables aka features

features <- readLines("features.txt")
str(features)

## read the x data with the variable names

x <- read.table("x_test.txt", header = F, col.names = features)
str(x[1:3])
## returns
##'data.frame':  2947 obs. of  3 variables:
## $ X1.tBodyAcc.mean...X: num  0.257 0.286 0.275 0.27 0.275 ...
## $ X2.tBodyAcc.mean...Y: num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
## $ X3.tBodyAcc.mean...Z: num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...

## find the labels for the activities

activities <- read.table("activity_labels.txt", header = F, col.names = c("Activity", "ActLabel"))
activities$Activity <-as.factor(activities$Activity)
## activties contains:
##   V1                 V2
## 1  1            WALKING
## 2  2   WALKING_UPSTAIRS
## 3  3 WALKING_DOWNSTAIRS
## 4  4            SITTING
## 5  5           STANDING
## 6  6             LAYING
actlabels = as.character(activities$V2)
str(actlabels)
## returns
## chr [1:6] "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" "STANDING" "LAYING"

## add subjects and activity variables to test and train (2 extra columns)
Tst <-  data.frame(Subject = as.integer(subjects), Activity = y, x)
Tst[45:47,1:4]

## returns:
##    Subject Activity X1.tBodyAcc.mean...X X2.tBodyAcc.mean...Y
## 45       2        4            0.2854029          0.002355779
## 46       2        4            0.2704725         -0.008937364
## 47       2        4            0.2802245         -0.028037933

## now do the same for train 

subjects <- readLines("subject_train.txt")
y <- readLines("y_train.txt")
x <- read.table("x_train.txt", header = F,col.names = features)

Har <-  data.frame(Subject = as.integer(subjects), Activity = y, x)
Har[45:47,1:4]

## returns
## as.integer.subjects. Activity X1.tBodyAcc.mean...X X2.tBodyAcc.mean...Y
## 45                    1        4            0.2785991          -0.01991014
## 46                    1        4            0.2732814          -0.01112721
## 47                    1        4            0.2785381          -0.01617343


## Merges the training and the test sets to create one data set.
## append Tst to Har using dplyr package
library(dplyr)
dim(Har)
## returns
## [1] 7352  563
Har <- bind_rows(Har,Tst)
dim(Har)
## returns
## [1] 10299   563


## Extracts only the measurements on the mean and standard deviation for each measurement. 
## using dplyr package select, inlcude . in contains to remove functions using mean and std
Har <- select(Har,1:2, contains(".mean."), contains(".std."))

## Uses descriptive activity names to name the activities in the data set
Har <- left_join(Har, activities, by = "Activity")
Har <- mutate(Har,Activity = ActLabel)
Har <- select(Har, -ActLabel)
Har[1:3,1:6]
##returns 
## Source: local data frame [3 x 6]
## 
## as.integer.subjects. Activity X1.tBodyAcc.mean...X X2.tBodyAcc.mean...Y X3.tBodyAcc.mean...Z X41.tGravityAcc.mean...X
## (int)   (fctr)                (dbl)                (dbl)                (dbl)                    (dbl)
## 1                    1 STANDING            0.2885845          -0.02029417           -0.1329051                0.9633961
## 2                    1 STANDING            0.2784188          -0.01641057           -0.1235202                0.9665611
## 3                    1 STANDING            0.2796531          -0.01946716           -0.1134617                0.9668781


## 4. Appropriately labels the data set with descriptive variable names.
## remove the Xnnn. from column names
Cols = colnames(Har)
Cols[-(1:2)] = substr(gsub("^.*?[.]","[.]",Cols[-(1:2)]),4, stop=100L)
## replace ... with _ , .. with and , . with _
Cols = gsub("[.][.][.]","_", Cols)
Cols = gsub("[.][.]","_", Cols)
Cols = gsub("[.]","_", Cols)

## update the col names in the data frame
            
colnames(Har) <- Cols
View(Har)            
            
## From the data set obtained before, create a second, independent tidy data set 
## with the average of each variable for each activity and each subject

Har <- group_by(Har, Subject, Activity)
Har <- summarise_each(Har, funs(mean))
View(Har)

## write to csv

write.table(Har, file ="TidyUCIHAR.txt", row.names = F )

