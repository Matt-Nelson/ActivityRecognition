## this file assumes that your current working directory contains the test and training folders

## for a given directory, read in the data, activity codes, and subjects
## combine the subjects and codes with the data, then merge to the activityLookups
## in order to populate the actual activity names.
readAndMerge <- function(folder){
	data <- read.table(paste("./", folder, "/X_", folder, ".txt", sep=""))
	activityCodes <- read.table(paste("./", folder, "/y_", folder, ".txt", sep=""))
	subjects <- read.table(paste("./", folder, "/subject_", folder, ".txt", sep=""))
	
	## Add the subject data and activityCode data to the data frame.
	data <- cbind(subjects, data)
	data <- cbind(activityCodes, data)
	
	## Add names to the combined data.
	names(data) <- featureNames
	
	## Get the activity names based on the activity codes. Assume that the name of the activity code column
	## is the same in both activityLookups and data.
	merge(activityLookups, data)
}

## Read the feature names from the features file.
featureNames <- read.table("features.txt")
featureNames <- as.character(featureNames[, "V2"])
## Add the names that the readAndMerge method will be cbinding to the beginning of the data frame.
featureNames <- c("ActivityCode", "Subject", featureNames)

## Read the activity lookups (tells us that this code = this activity name).
activityLookups <- read.table("activity_labels.txt")
names(activityLookups) <- c("ActivityCode", "ActivityName")

## Find all featureNames that contain "mean()" or "std()", then add ActivityName and Subject as
## the list of columns to keep.
keepNames <- featureNames[c(grep("*mean()*", featureNames, ignore.case = TRUE), 
							grep("*std()*", featureNames, ignore.case = TRUE))]
keepNames <- c("ActivityName", "Subject", keepNames)

## Assume that the current working directory contains the test and train folders.
## Use the readAndMerge function to read and transform both data sets.
rawData <- readAndMerge("train")
test <- readAndMerge("test")

## Append the test set to the training(rawData) set
rawData <- rbind(rawData, test)

## Subset the data based on the column names we decided to keep earlier.
rawData <- rawData[, keepNames]

## Use the data.table functionality to take the mean of each column grouped by
## ActivityName and Subject.
library(data.table)
data.dt <- data.table(rawData)
setkey(data.dt, ActivityName)
summary <- data.dt[, lapply(.SD, mean), by = list(ActivityName, Subject)]
write.table(summary, "Summary.txt")
summary