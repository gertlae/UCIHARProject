#This is the codebook.
## This code book describes the variables, the data, and any transformations or work performed to clean up the data 

##There are in total 68 variables in TidyUCIHar.csv
1 Subject  
    - integer between 1 and 30  
    - id of the subject that did the activity  
2 Activity  
    - string  
    - factor with 6 different label of the activity: LAYING, SITTING, etc.  
3	tBodyAcc_mean_X  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the X-axis of the body acceleration signal in the time domain (hence t at front)   
4	tBodyAcc_mean_Y  
    - same as 3 but Y-axis  
5	tBodyAcc_mean_Z  
    - same as 3 but Z-axis  
6	tGravityAcc_mean_X  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the X-axis of the gravity acceleration signal in the time domain (hence t at front)   
7	tGravityAcc_mean_Y  
    - same as 6 but Y-axis  
8	tGravityAcc_mean_Z  
    - same as 6 but Z-axis  
9	tBodyAccJerk_mean_X  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the Jerk signal obtained by deriving the body linear acceleration in time    
10	tBodyAccJerk_mean_Y  
    - same as 9 but Y-axis  
11	tBodyAccJerk_mean_Z  
    - same as 9 but Z-axis  
12	tBodyGyro_mean_X  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the X-axis of the body gyroscope signal in the time domain (hence t at front)   
13	tBodyGyro_mean_Y  
    - same as 12 but Y-axis  
14	tBodyGyro_mean_Z  
    - same as 12 but Z-axis  
15	tBodyGyroJerk_mean_X  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the Jerk signal obtained by deriving the angular velocity in time  
16	tBodyGyroJerk_mean_Y  
    - same as 15 but Y-axis  
17	tBodyGyroJerk_mean_Z  
    - same as 15 but Z-axis  
18	tBodyAccMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the magnitude of the Body Acceleration signal in the time domain (hence t at front)  
19	tGravityAccMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the magnitude of the Gravity Acceleration signal in the time domain (hence t at front)  
20	tBodyAccJerkMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the magnitude of the Body Acceleration Jerk signal in the time domain (hence t at front)      
21	tBodyGyroMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the magnitude of the Body gyroscope signal in the time domain (hence t at front)  
22	tBodyGyroJerkMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the magnitude of the Body gyroscope Jerk signal in the time domain (hence t at front)  
23	fBodyAcc_mean_X  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the X-axis of the Fourrier transformation of the body acceleration signal, f means frequency domain      
24	fBodyAcc_mean_Y  
    - same as 23 but Y-axis  
25	fBodyAcc_mean_Z  
    - same as 23 but Z-axis  
26	fBodyAccJerk_mean_X  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the X-axis of the Fourrier transformation of the body acceleration jerk signal, f means frequency domain  
27	fBodyAccJerk_mean_Y  
    - same as 26 but Y-axis  
28	fBodyAccJerk_mean_Z  
    - same as 26 but Z-axis  
29	fBodyGyro_mean_X  
    - numeric   
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the X-axis of the Fourrier transformation of the body gyroscpe signal, f means frequency domain  
30	fBodyGyro_mean_Y  
    - same as 29 but Y-axis  
31	fBodyGyro_mean_Z  
    - same as 29 but Z-axis  
32	fBodyAccMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the Fourrier transformation of the magnitude of the Body Acceleration signal, f means frequency domain     
33	fBodyBodyAccJerkMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable
    - variable is the Fourrier transformation of the magnitude of the Body Acceleration Jerk signal, f means frequency domain    
34	fBodyBodyGyroMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the Fourrier transformation of the magnitude of the Body Gyroscope signal, f means frequency domain    
35	fBodyBodyGyroJerkMag_mean_  
    - numeric  
    - contains the mean grouped by Subject and Activity of the estimated mean value of the variable  
    - variable is the Fourrier transformation of the magnitude of the Body Gyroscope Jerk signal, f means frequency domain    
36  tBodyAcc_std_X  
    - same as 3 but for the standard deviation  
37	tBodyAcc_std_Y  
    - same as 4 but for the standard deviation  
38	tBodyAcc_std_Z  
    - same as 5 but for the standard deviation  
39	tGravityAcc_std_X  
    - same as 6 but for the standard deviation  
40	tGravityAcc_std_Y  
    - same as 7 but for the standard deviation  
41	tGravityAcc_std_Z  
    - same as 8 but for the standard deviation  
42	tBodyAccJerk_std_X  
    - same as 9 but for the standard deviation  
43	tBodyAccJerk_std_Y  
    - same as 10 but for the standard deviation  
44	tBodyAccJerk_std_Z  
    - same as 11 but for the standard deviation  
45	tBodyGyro_std_X  
    - same as 12 but for the standard deviation  
46	tBodyGyro_std_Y  
    - same as 13 but for the standard deviation  
47	tBodyGyro_std_Z  
    - same as 14 but for the standard deviation  
48	tBodyGyroJerk_std_X  
    - same as 15 but for the standard deviation  
49	tBodyGyroJerk_std_Y  
    - same as 16 but for the standard deviation  
50	tBodyGyroJerk_std_Z  
    - same as 17 but for the standard deviation  
51	tBodyAccMag_std_  
    - same as 18 but for the standard deviation  
52	tGravityAccMag_std_  
    - same as 19 but for the standard deviation  
53	tBodyAccJerkMag_std_  
    - same as 20 but for the standard deviation  
54	tBodyGyroMag_std_  
    - same as 21 but for the standard deviation  
55	tBodyGyroJerkMag_std_  
    - same as 22 but for the standard deviation  
56	fBodyAcc_std_X  
    - same as 23 but for the standard deviation  
57	fBodyAcc_std_Y  
    - same as 24 but for the standard deviation  
58	fBodyAcc_std_Z  
    - same as 25 but for the standard deviation  
59	fBodyAccJerk_std_X  
    - same as 26 but for the standard deviation  
60	fBodyAccJerk_std_Y  
    - same as 27 but for the standard deviation  
61	fBodyAccJerk_std_Z  
    - same as 28 but for the standard deviation  
62	fBodyGyro_std_X  
    - same as 29 but for the standard deviation  
63	fBodyGyro_std_Y  
    - same as 30 but for the standard deviation  
64	fBodyGyro_std_Z  
    - same as 31 but for the standard deviation  
65	fBodyAccMag_std_  
    - same as 32 but for the standard deviation  
66	fBodyBodyAccJerkMag_std_  
    - same as 33 but for the standard deviation  
67	fBodyBodyGyroMag_std_  
    - same as 34 but for the standard deviation  
68	fBodyBodyGyroJerkMag_std_  
    - same as 35 but for the standard deviation  



## The data

The experiments have been carried out with a group of 30 volunteers (aka subjects) within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.  
(Source:  Readme.txt of the original UCI HAR dataset   
 more info on  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )  

## Transformations & cleaning

- Data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, which was unzipped to working directory.

- Train and Test sets were read using the variable names aka features provided in features.txt  

- Addtional variables Subject and Activity were added to Train and Test respectively. Reasonable assumption is that order of Subject (subject_train.txt and subject_test.txt) and Activity (from y_train.txt and y_test.txt) variables was the same as the one in the X_Train.txt and X_Test.txt containing the actual data sets.  

- Train and Test data sets were merged  

- Activity variable was replaced by descriptive data label from activity_labels.txt  

- Only std and mean variables were kept, and grouped by Subject and Activity.

- The mean was taken over that grouping.

