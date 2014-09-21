###You should create one R script called run_analysis.R that does the following. 

###Step 1: Merges the training and the test sets to create one data set.

# read all tables
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# cbind test and training tables
x_train_test_combined <- rbind.data.frame(x_test, x_train)
y_train_test_combined <- rbind.data.frame(y_test, y_train)
subject_train_test_combined <- rbind.data.frame(subject_test, subject_train)

# row bind all the tables to one data frame
complete_tables <- cbind.data.frame(x_train_test_combined, y_train_test_combined,subject_train_test_combined)

# add variable names to the columns
variable_names <- read.table("UCI HAR Dataset/features.txt")
only_variable_names <- as.character(variable_names[,2])
names(complete_tables) <- c(only_variable_names, "Activity", "Subject")

# "BodyBody" seems to be an error in the names of the variables. 
# Replacing every instance of "BodyBody" with "Body"
sub("BodyBody", "Body", names(complete_tables))


###Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Find all Columnnames with "mean"
mean_list <- grep("mean", names(complete_tables))
# Find all Columnnames with "std"
std_list <- grep("std", names(complete_tables))
# subset the data table with the columns that contain "mean" or "std"
mean_std_subset <- complete_tables[,c(mean_list, std_list)]

###Step 3: Uses descriptive activity names to name the activities in the data set
# Acitivity names are stored in "UCI HAR Dataset/activity_labels.txt". Using 
# this list to label the activities

# According to the Activity List, the labels are as following:
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

# replacing numbers in the dataset in the column "Activity" with the corresponding
# activity label from the activity_labels.txt
for (i in 1:length(complete_tables$Activity)) {
        if (complete_tables[i,562] == 1) {complete_tables[i,562] <- "WALKING"}
        if (complete_tables[i,562] == 2) {complete_tables[i,562] <- "WALKING_UPSTAIRS"}
        if (complete_tables[i,562] == 3) {complete_tables[i,562] <- "WALKING_DOWNSTAIRS"}
        if (complete_tables[i,562] == 4) {complete_tables[i,562] <- "SITTING"}
        if (complete_tables[i,562] == 5) {complete_tables[i,562] <- "STANDING"}
        if (complete_tables[i,562] == 6) {complete_tables[i,562] <- "LAYING"}
}


###Step 4: Appropriately labels the data set with descriptive variable names. 
# NOTE: This is already done in Step 1, right after rowbinding all the tables.
# While there could be a way to make the variable names more readable, like
# "fBodyAcc-std()-x" into "Frequency Body Acceleration Standard Deviation - X Axis"
# this might cause downstream errors. Also those very long Variable Names would
# make it hard to read via the head() function, because there are 79 variable names.
# The Variable Names provided by the features.txt are sufficient enough to be 
# readable AND short.
# Therefore no need for extra code here.

###Step 5: From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

# Splitting the Data Frame via the Subject AND Activity using split()
splitted_complete_tables <- split(complete_tables, list(complete_tables$Subject, complete_tables$Activity))

#mapply(colMeans(splitted_complete_tables))
# compute the mean per Activity per Subject
# loading the reshape2 library
library(reshape2)
melted_table <- melt(splitted_complete_tables, id=c("Subject","Activity"))
x_melted_table <- split(melted_table,melted_table[,1]) 
tidy_table <- lapply(x_melted_table, dcast, Activity ~variable, mean)
#writing the table with the tidy data
write.table(tidy_table,file="getdata-007_tidy_data.txt", row.name=FALSE)
#DONE