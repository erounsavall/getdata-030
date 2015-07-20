# getdata-030
Course project for Getting Data Coursera course.

ReadMe
Script for pulling accelerometer data, cleaning it, and producing a tidy data set. 
Assumes data is in a subfolder 'UCI HAR Dataset' of the current working directory 
Instructions for use: download and run run_analysis.R

Refer to Code Book (link) for information on the step-by-step method as well as the description of the resulting tidy data set. 

Tidy data set which is output of this script may be found here: [link]
(and how to read this back into R)


this is the long form as mentioned in the rubric as either long or wide form is acceptable, see https://class.coursera.org/getdata-030/forum/thread?thread_id=107 for discussion

Why this is tidy: Single row for each observation, each variable in a column

narrow (grouped by subject, activity):  Size: rows: 30 * 6 * N, columns: 4

subject1, activity1, measurement 1 name, value
subject1, activity1, measurement 2 name, value
...
subject1, activity1, measurement N name, value
subject1, activity2, measurement 1 name, value
subject1, activity2, measurement 2 name, value
...
subject30, activity6, measurement N name, value

Where 'measurement' is either the mean() or std() of various accelerometer measurements, described below. 

Extraction Method:
1. File was downloaded and unzipped to a directory 'UCI HAR Dataset' which is a subfolder of the current working directory
2. Data files used:
  - 'features_info.txt': Description of the variables used on the feature vector.
  - 'features.txt': List of all features. 561 observations of 2 variables. 
  - 'activity_labels.txt': Links the class labels with their activity name. 6 observations of 2 variables.
  - 'train/X_train.txt': Training set. 7352 observations of 561 variables.
  - 'train/y_train.txt': Training labels. 7352 observations of 1 variable.
  - 'test/X_test.txt': Test set. 2947 observations of 561 variables.
  - 'test/y_test.txt': Test labels. 2947 observations of 1 variable.
  - 'train/subject_train.txt': Subject label. 7352 observations of 1 variable. 
  - 'test/subject_test.txt': Subject label. 2947 observations of 1 variable.
3. Approach:
  Read in feature list and grep to find mean() and SD() measurements.
  Read in X_train and Y-train as fixed-width files. 
  Extract only mean() and SD() columns (shrinking data set size significantly)
  Append subject label columns. 
  Append activity label columbs.
  Rbind to create one master data set with 10299 observations of 69 variables.
  Join with activity lookup to get activity names.
  'Melt' to put measurement names in rows (the measurement values will be in a column). This is tidier data.
  Replace activity labels with descriptive activity names.
4.                                                              
