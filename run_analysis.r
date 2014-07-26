# create a folder for wk3assignment
if(!file.exists("./wk3assignment")) {dir.create("./wk3assignment")}
# download file from the web
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="wk3assignment/w3.zip")

# unzip the downloaded file
unzip("wk3assignment/w3.zip",exdir="wk3assignment")

# set new working directory
setwd("./wk3assignment/UCI HAR Dataset")

# get feature list
feature <-read.delim("features.txt",head=FALSE,sep="",as.is=T)

# 1. Merges the training and the test sets to create one data set.
train <-read.delim("train/x_train.txt",head=FALSE,sep="",as.is=T)
trainsub <-read.delim("train/subject_train.txt",head=FALSE,sep="",as.is=T)
colnames(trainsub)[1] <- "subject"
trainlabel <-read.delim("train/y_train.txt",head=FALSE,sep="",as.is=T)
colnames(trainlabel)[1] <- "activityid"
trainset <- cbind(train,trainsub,trainlabel)

test <-read.delim("test/x_test.txt",head=FALSE,sep="",as.is=T)
testsub <-read.delim("test/subject_test.txt",head=FALSE,sep="",as.is=T)
colnames(testsub)[1] <- "subject"
testlabel <-read.delim("test/y_test.txt",head=FALSE,sep="",as.is=T)
colnames(testlabel)[1] <- "activityid"
testset <- cbind(test,testsub, testlabel)

combset <- rbind(trainset, testset)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_sd_only <- combset[,sort(c(grep("[-]mean[()]",feature[[2]]),grep("[-]std[()]",feature[[2]])))]

# 3. Uses descriptive activity names to name the activities in the data set


# 3.1 get activity label list
activity <- read.delim("activity_labels.txt",head=FALSE,sep="",as.is=T)
colnames(activity) <- c("activityid","activity")
combset <-merge(combset, activity, by.x="activityid", by.y="activityid") # Get activity description from activity label file
combset$activityid <- NULL # remove the ID column for the activity as the description is merged


# 4. Appropriately labels the data set with descriptive variable names. 
colnames(combset)[1:nrow(feature)] <- feature[,2] # get descriptive label from feature file

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
output <- aggregate( do.call("cbind",combset[,1:nrow(feature)]) ~ subject + activity,combset, mean)
write.table(output,"wk3assignment_tidydata.txt",sep="")
