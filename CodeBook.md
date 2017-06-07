# CodeBook

## This file includes the descriptions of the code ** run_analysis.R ** as well as the descriptions of the variables.

## Code step by step:
* 1. Downloading the file and unziping it.
* 1.1. Storing the files in UCI HAR Dataset.
* 2. Reading the files organized by labels: activity and features.
* 3. Extracting the data with the mean and standard deviation.
* 3.1. Loading the datasets: reading the tables by activity and subject.
* 3.2. Binding the data of subjects and activities and storing it in t.
* 3.3. Doing the same for the test part of the code.
* 4. Merging the data of t and t2. Setting new labels in the newly created variable. Applying the function factor. Melting the data.
* 5. Creating the table for the new tidy data.

