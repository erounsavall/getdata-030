# ReadMe
Script for reading raw accelerometer data across many files, cleaning it, and producing a tidy data set. 

## Files included in this repo 
### run_analysis.R
Script for analyzing data. 
link: https://github.com/erounsavall/getdata-030/blob/master/run_analysis.R
Assumes data is in a subfolder 'UCI HAR Dataset' of the current working directory 
                
### codebook.md
Describes the tidy dataset output by the script and how to read the script back into R
link: https://github.com/erounsavall/getdata-030/blob/master/codebook.md
                
### tidydata.txt
The tidy dataset output by the script
link: https://github.com/erounsavall/getdata-030/blob/master/tidydata.txt
                

## Instructions for use: 
  1. Download source data to working directory.
        (link:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  2. Download and run run_analysis.R. 
  3. Required packages: plyr, dplyr, reshape2, tidyr

## Extraction Method: 
 1. File is downloaded and unzipped to a directory 'UCI HAR Dataset' which is a subfolder of the current working directory.
 2. Data files in the raw data set:
  * 'features_info.txt': Description of the variables used on the feature vector.
  * 'features.txt': List of all features. 561 observations of 2 variables. 
  * 'activity_labels.txt': Links the class labels with their activity name. 6 observations of 2 variables.
  * 'train/X_train.txt': Training set. 7352 observations of 561 variables.
  * 'train/y_train.txt': Training labels. 7352 observations of 1 variable.
  * 'test/X_test.txt': Test set. 2947 observations of 561 variables.
  * 'test/y_test.txt': Test labels. 2947 observations of 1 variable.
  * 'train/subject_train.txt': Subject label. 7352 observations of 1 variable. 
  * 'test/subject_test.txt': Subject label. 2947 observations of 1 variable.
 3. Approach:
  * Read in feature list and grep to find mean() and SD() measurements.
  * Read in X_train and Y-train as fixed-width files. In initial read, these are 561-column dataframes (the full list of features).
  * Extract only mean() and SD() columns (shrinking data set size significantly)
  * Append subject label columns. 
  * Append activity label columbs.
  * Rbind to create one master data set with 10299 observations of 69 variables.
  * Join with activity lookup to get activity names.
  * 'Melt' to put measurement names in rows (the measurement values will be in a column). This is tidier data.
  Creates large data set with 679734 observations of 4 variables.
  * ddply to summarize by subject, activity name and measurement. 11880 observations of 4 variables. 

Why this is tidy: Single row for each observation, each variable in a column. We were asked to summarize 'the mean of each measurement'. Therefore, I have assumed that 'measurement' is a variable with 66 levels (tBodyAcc-mean()-X, etc), each of which is in its own row.  (The codebook definition of measurement goes into more detail about why I chose those 66 levels and not the angle() variables.)

```
 subject1, activity1, measurement 1 name, value
 subject1, activity1, measurement 2 name, value
 ...
 subject1, activity1, measurement N name, value
 subject1, activity2, measurement 1 name, value
 subject1, activity2, measurement 2 name, value
 ...
 subject30, activity6, measurement N name, value
```
(Note: this is the long form; as mentioned in the rubric, either long or wide form is acceptable, see https://class.coursera.org/getdata-030/forum/thread?thread_id=107 for discussion

                                                   
