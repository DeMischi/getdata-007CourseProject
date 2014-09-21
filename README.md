ReadMe: R Script for the course project "Getting and Cleaning Data"
===================================================================

About this Script
-----------------

Note: You need the reshape2 package installed. Use install.packages("reshape2) to install the package.

This R Script does the following:

* Step 1: Merges the training and the test sets to create one data set, called complete_tables.
* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
* Step 3: Uses descriptive activity names to name the activities in the data set
* Step 4: Appropriately labels the data set with descriptive variable names.
* Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output will be stored in a file called: getdata-007_tidy_data.txt

The Output will be a list, where each element of the list corresponds to a subject, containing the means of all variables for that specific subject.

For more information about the input and the output, please refer to the CodeBook.

Michael Lichtsinn
Darmstadt, 21.09.2014