# 0. This code requires loading 'reshape' package.
# 1. Downloading the file and unziping it. Note: I am using Windows hence I do not need the 'method' argument in 'download.file'.
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# 1.1. Storing the files in UCI HAR Dataset. Listing the downloaded files and storing them in 'files'.
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

# 2. Reading the files organized by labels: activity and features.
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# 3. Extracting the data with the mean and standard deviation.
features2 <- grep(".*mean.*|.*std.*", features[,2])
features2.names <- features[features2,2]
features2.names = gsub('-mean', 'MEAN', features2.names)
features2.names = gsub('-std', 'STD', features2.names)
features2.names <- gsub('[-()]', '', features2.names)

# 3.1. Loading the datasets for 'train': reading the tables by activity and subject. 
train <- read.table("UCI HAR Dataset/train/X_train.txt")[features2]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# 3.2. Binding the data of subjects and activities and storing it in 't'.
t <- cbind(trainSubjects, trainActivities, t)

# 3.3. Doing the same (as in steps 3.1. and 3.2.) for the 'test'. Storing the result in 't2'.
test <- read.table("UCI HAR Dataset/test/X_test.txt")[features2]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
t2 <- cbind(testSubjects, testActivities, t2)

# 4. Merging the data of 't' and 't2'. Setting new labels in the newly created variable. Applying the function factor. Melting the data.
Data <- rbind(t, t2)
colnames(Data) <- c("subject", "activity", features2.names)
Data$activity <- factor(Data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
Data$subject <- as.factor(Data$subject)

Data.melted <- melt(Data, id = c("subject", "activity"))
Data.mean <- dcast(Data.melted, subject + activity ~ variable, mean)

# 5. Creating the table for the new tidy data.
write.table(Data.mean, "tidydata.txt", row.names = FALSE, quote = FALSE)
