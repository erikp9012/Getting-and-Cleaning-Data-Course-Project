############################################
# 1. Download Data and create Data Directory
############################################

library(plyr)
library(dplyr)

######## Clean up workspace ######

rm(list=ls())

####### Set Working Directory to download files to and pull files from #######

setwd("./")

####### Check to see if data directory exists and download data ######

if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCIHARDataset.zip")
unzip("./data/UCIHARDataset.zip", exdir = "./data")

#########################################
# 2. Read data into R and create datasets
#########################################

###### Test Data #######

# Measurements #
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
# Activity #
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
y_train <- rename(y_train, activity = V1)
# Subject #
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subject_train <- rename(subject_train, subject = V1)
# Final train Dataset #
trainData <- cbind(subject_train, y_train, X_train)


###### Train Data ######

# Measurements #
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
# Activity #
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
y_test <- rename(y_test, activity = V1)
# Subject #
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subject_test <- rename(subject_test, subject = V1)
# Final test dataset #
testData <- cbind(subject_test, y_test, X_test)

###### Features and Activity Labels Data ######

features <- read.table("./data/UCI HAR Dataset/features.txt")
features$V2 <- as.character(features$V2)
ActivityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
ActivityLabels$V2 <- as.character(ActivityLabels$V2)

#####################################################################
# 3. Create Combined Dataset with test and train data sets as well as
# variable names and descriptive activity names
#####################################################################

###### Bind testData and trainData ######

AllData <- rbind(testData,trainData)

###### Import Variable Names ######

colnames(AllData) <- c("subject", "activity", features[,2])

###### Assign Descriptive Activity Names ######

AllData$activity <- ActivityLabels$V2[AllData$activity]

###### Change subject and activity into factors ######

AllData$subject <- as.factor(AllData$subject)
AllData$activity <- as.factor(AllData$activity)

##########################################################################
# 4. Extract Only the measurements on  the mean and standard deviation for
# each measurement
##########################################################################

###### Create vector to subset by ######

VariableSubset <- grep("[mM]ean|[sS]td", colnames(AllData[,3:563]))
VariableSubset <- VariableSubset + 2

###### Subset AllData by vector created above ######

AllData <- data.frame(subject = AllData$subject, activity = AllData$activity, AllData[, VariableSubset])

######################################################################
# 5. Appropriately label the data set with descriptive activity names
#####################################################################

colnames(AllData) <- gsub("\\.","",colnames(AllData))
colnames(AllData) <- gsub("[sS]td", "StdDev", colnames(AllData))
colnames(AllData) <- gsub("[mM]ean", "Mean", colnames(AllData))
colnames(AllData) <- gsub("[gG]ravity", "Gravity", colnames(AllData))
colnames(AllData) <- gsub("^(f)", "freq", colnames(AllData))
colnames(AllData) <- gsub("^(t)", "time", colnames(AllData))

######################################################################
# 6. From the data set above, create a second,independent tidy data set 
# with the average of each variable for each activity and each subject
#######################################################################

###### Group the data set by subject and by activity ######

TidyData <- group_by(AllData, subject, activity)
TidyData <- arrange(TidyData, subject)

###### Create data which averages observations by subject and activity ######

TidyData <- summarise_each(TidyData, funs(mean))

###### Write tidy data to text file ######

write.table(TidyData, "TidyData.txt", row.names = FALSE)

