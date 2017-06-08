# CodeBook

## This file includes the steps of the code run_analysis.R as well as the list of the variables.


## Variables:
1. *test/train*: the downloaded data.
2. *subject*: assigned to each of the participants in the study (overall: 30)
3. *activity*: it is the action that the subject was taking when being tested. In this variable, different labels can be distinguished. **walking, walking_upstairs, walking_downstairs, sitting, standing, laying**. 
4. *features*: the measurements used that include **standard deviation, mean or frequency**: 

**tBodyAccMeanX, tBodyAccMeanY, tBodyAccMeanZ, tBodyAccStdX, tBodyAccStdY, tBodyAccStdZ, tGravityAccMeanX, tGravityAccMeanY, tGravityAccMeanZ, tGravityAccStdX, tGravityAccStdY, tGravityAccStdZ, tBodyAccJerkMeanX, tBodyAccJerkMeanY, tBodyAccJerkMeanZ, tBodyAccJerkStdX, tBodyAccJerkStdY, tBodyAccJerkStdZ, tBodyGyroMeanX, tBodyGyroMeanY, tBodyGyroMeanZ, tBodyGyroStdX, tBodyGyroStdY, tBodyGyroStdZ, tBodyGyroJerkMeanX, tBodyGyroJerkMeanY, tBodyGyroJerkMeanZ, tBodyGyroJerkStdX, tBodyGyroJerkStdY, tBodyGyroJerkStdZ, tBodyAccMagMean, tBodyAccMagStd, tGravityAccMagMean, tGravityAccMagStd, tBodyAccJerkMagMean, tBodyAccJerkMagStd, tBodyGyroMagMean, tBodyGyroMagStd, tBodyGyroJerkMagMean, tBodyGyroJerkMagStd, fBodyAccMeanX, fBodyAccMeanY, fBodyAccMeanZ, fBodyAccStdX, fBodyAccStdY, fBodyAccStdZ, fBodyAccMeanFreqX, fBodyAccMeanFreqY, fBodyAccMeanFreqZ, fBodyAccJerkMeanX, fBodyAccJerkMeanY, fBodyAccJerkMeanZ, fBodyAccJerkStdX, fBodyAccJerkStdY, fBodyAccJerkStdZ, fBodyAccJerkMeanFreqX, fBodyAccJerkMeanFreqY, fBodyAccJerkMeanFreqZ, fBodyGyroMeanX, fBodyGyroMeanY, fBodyGyroMeanZ, fBodyGyroStdX, fBodyGyroStdY, fBodyGyroStdZ, fBodyGyroMeanFreqX, fBodyGyroMeanFreqY, fBodyGyroMeanFreqZ, fBodyAccMagMean, fBodyAccMagStd, fBodyAccMagMeanFreq, fBodyBodyAccJerkMagMean, fBodyBodyAccJerkMagStd, fBodyBodyAccJerkMagMeanFreq, fBodyBodyGyroMagMean, fBodyBodyGyroMagStd, fBodyBodyGyroMagMeanFreq, fBodyBodyGyroJerkMagMean, fBodyBodyGyroJerkMagStd, fBodyBodyGyroJerkMagMeanFreq**.


## Code step by step:
* 0. The code used requires loading 'reshape' package.
* 1. Downloading the file and unziping it. Note: I am using Windows hence I do not need the 'method' argument in 'download.file'.
* 1.1. Storing the files in UCI HAR Dataset. Listing the downloaded files and storing them in 'files'.
* 2. Reading the files organized by labels: activity and features.
* 3. Extracting the data with the mean and standard deviation.
* 3.1. Loading the datasets for 'train': reading the tables by activity and subject. 
* 3.2. Binding the data of subjects and activities and storing it in 't'.
* 3.3. Doing the same (as in steps 3.1. and 3.2.) for the 'test'. Storing the result in 't2'.
* 4. Merging the data of 't' and 't2'. Setting new labels in the newly created variable. Applying the function factor. Melting the data.
* 5. Creating the table for the new tidy data.
