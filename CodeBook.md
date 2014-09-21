CodeBook for the R Script for the course project "Getting and Cleaning Data"
==
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
This is already done in Step 1, right after rowbinding all the tables.
While there could be a way to make the variable names more readable, like
"fBodyAcc-std()-x" into "Frequency Body Acceleration Standard Deviation - X Axis"
this might cause downstream errors. Also those very long variable names would
make it hard to read via the head() function, because there are 79 variable names.
The variable names provided by the features.txt are sufficient enough to be 
readable AND short.
Therefore the original variable names will be used. Which is already done in step 1.
 
Additional Notes:
"BodyBody" seems to be an error in the names of the variables. Therefore this script replaces every instance of "BodyBody" with "Body"
