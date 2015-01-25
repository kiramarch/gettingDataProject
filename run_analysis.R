run_analysis <- function() {
## This function completes the assignment from the Getting and Cleaning Data
## course. See the readme file for context.  
  
## Load the required packages, as noted in the readme file.
library(data.table)
library(reshape2)

## Read  the relevant data files from the dataset
features <- read.table("UCI HAR Dataset/features.txt", as.is = 2) ## reads file with variable names (as characters)
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt", as.is = 2) ## reads file with activity labels (as characters)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")

## Add colum names where they don't exist
colnames(x_train) <- features$V2
colnames(subject_train) <- "subject"
colnames(y_train) <- "activityNumber"

colnames(x_test) <- features$V2
colnames(subject_test) <- "subject"
colnames(y_test) <- "activityNumber"

## Combine ID and variable data, so there is one complete table for each group
traindf <- cbind(subject_train, y_train, "train", x_train)
names(traindf)[3]<-"group"

testdf <- cbind(subject_test, y_test, "test", x_test)
names(testdf)[3]<-"group"

## Combine data from the train and test group into one table
dt <- data.table(rbind(testdf, traindf))

## Adds a new column with text labels for the activity types
dt[, activityLabel:={tmp<-activityNumber; act_labels[tmp,2]}]

## Selects only the needed columns
scol <- grepl("mean|std", colnames(dt))
msdt <- data.table(subset(dt, select =  c(TRUE, FALSE, TRUE, scol[4:564], TRUE)))

## Remove unnecessary punctuation from the column names
## Remove repeated word error from column names
oldnames <- names(msdt)
newnames <- gsub("([-])|[[:punct:]]", "\\1", oldnames)
newnames <- gsub("BodyBody", "Body", newnames)
setnames(msdt, oldnames, newnames)
setcolorder(msdt, c(1, 82, 2, 3:81))

## Melt and cast the data, with only the means of each variable included
dtmelt <- melt(msdt, id=c("subject", "activityLabel"), measure.vars = c(4:82))
meandata <- dcast(dtmelt, subject + activityLabel ~ ..., mean)

## write the table with the specificed parameters
write.table(meandata, file="Tidy UCI HAR Dataset.txt", row.name=FALSE)

}