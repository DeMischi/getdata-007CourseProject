CodeBook for the R Script for the course project "Getting and Cleaning Data"
============================================================================
This script uses data collected from accelerometers from the Samsung Galays S smartphone. The data is intended for human activity recognition using smartphones by the UCI Machine Learning Repository.

The original source is:

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 

> Smartlab - Non Linear Complex Systems Laboratory 

> DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 

> activityrecognition '@' smartlab.ws 

> www.smartlab.ws 

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Full description of the data: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data can be downloaded here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Details per step:
-----------------

Step 1:
The data must be stored in your working directory. Otherwise it will not find the data to import.
Please make sure you've downloaded the data from the source above, unzipped it and stored it in your working directory.
It will also label the data appropriatly.

Step 2:
Only variable names that contain "mean" or "std" will be kept.
Every other variable will be stripped.

Step 3:
The acitivity names are stored in "UCI HAR Dataset/activity_labels.txt". 
 According to this list, the labels are the following:
  * 1 WALKING
  * 2 WALKING_UPSTAIRS
  * 3 WALKING_DOWNSTAIRS
  * 4 SITTING
  * 5 STANDING
  * 6 LAYING
Every number in the dataset in the column "Activity" will be replaced with the corresponding activity.

Step 4: Appropriately labels the data set with descriptive variable names. 
This is already done in Step 1, right after rowbinding all the tables. While there could be a way to make the variable names more readable, like
"fBodyAcc-std()-x" into "Frequency Body Acceleration Standard Deviation - X Axis" this might cause downstream errors. Also those very long variable names would
make it hard to read via the head() function, because there are 79 variable names. The variable names provided by the features.txt are sufficient enough to be readable AND short.

Therefore the original variable names will be used. This labeling is already done in step 1.
 
Step 5: 
To create a tidy data set, the data table is melted and the column means are calculated.

Important: The output is a list with the coulmn means where each column represents a variable, every entry in the list a subject, containing the variables per activity.

The output is stored in this file: getdata-007_tidy_data.txt 
 
Additional Notes:
"BodyBody" seems to be an error in the names of the variables. Therefore this script replaces every instance of "BodyBody" with "Body"

Information about the variables from the original source:
---------------------------------------------------------
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation