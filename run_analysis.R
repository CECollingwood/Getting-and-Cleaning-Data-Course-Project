##Libraries
library(dplyr)
library(data.table)

##Merges the training and test sets
##  Read in Data
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/x_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/x_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

##  Merge Tables
testdata <- cbind(subjecttest, ytest, xtest)
traindata <-cbind(subjecttrain, ytrain, xtrain)
data <-rbind (testdata, traindata)

##  Label Columns
features <- read.table("./UCI HAR Dataset/features.txt")
xlabels <- as.character(features[,2])
colnames(data) <- c("subject", "actid", xlabels)
  
##Extracts only the measurements of the mean and standard deviation for each measurement
subset <- data[,c("subject", "actid", colnames(data)[grep("mean()|std()",colnames(data))])]
subset <- subset[,-grep("meanFreq()", colnames(subset))]

##Uses descriptive activity names to name the activities in the data set
ActivityLookUp <- read.table("./UCI HAR Dataset/activity_labels.txt")
ActivityLookUp <- data.table(ActivityLookUp)
colnames(ActivityLookUp) <- c("actid", "activity")
gsub("_", " ", ActivityLookUp$activity)
subset <- data.table(subset)
setkey(ActivityLookUp,actid)
setkey(subset, actid)
data2<-merge(ActivityLookUp, subset)
data2$actid <- NULL


##Appropriately labels with descriptive variable names

colnames(data2) <- tolower(names(data2))
colnames(data2) <- gsub("-", " ", names(data2))
colnames(data2) <- gsub("\\(|\\)", "", names(data2))
colnames(data2) 8<- sub("^t", "time ", names(data2))
colnames(data2) <- sub("f", "freq ", names(data2))

##Createsand independent tidy data set with the average of each variable 
#for each activity and each subject


tidydata <- data2 %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(tidydata, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE)