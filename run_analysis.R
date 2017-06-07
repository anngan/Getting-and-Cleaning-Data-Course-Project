##1. Downloading the file and unziping it. Note: I am using Windows hence I do not need the method argument in download.file.
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

##Storing the files in UCI HAR Dataset.
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

##2. Reading the files organized by labels: activity, subject and features.
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

##3. Binding them by rows (again: by subject, activity and features).
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

##Setting the new labels/names.
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

##Combining the components so that they are merged (binding by columns). The result is stored in dat.
combined <- cbind(dataSubject, dataActivity)
dat <- cbind(dataFeatures, combined)

##3. Subsetting in order to get the mean and standard deviation. 
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
dat <- subset(dat,select=selectedNames)

##4. Setting new labels.
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

##Introducing new names for variables in order to label the data in a descriptive way.
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("accel", "Accelerometer", names(Data))
names(Data)<-gsub("gyro", "Gyroscope", names(Data))
names(Data)<-gsub("magna", "Magnitude", names(Data))
names(Data)<-gsub("bod", "Body", names(Data))

##5. Creating a new table in order to store the new tidy data set.
library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
