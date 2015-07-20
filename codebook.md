---
title: "Codebook"
output: html_document
---

Columns:
  Subject-Activity-Measurement-Mean
  

Subject: Integer vector, 30 levels, each representing a person performng an activity.

Activity: Character vector. 6 levels, each of which describes the activity performed:
  WALKING
  WALKING_UPSTAIRS
  WALKING_DOWNSTAIRS
  SITTING
  STANDING
  LAYING

Measurement: (character vector): Mean() and SD() of a selection of vector/features from raw accelerometer data.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Mean: (Numeric)
  The mean of values for each subject-activity-measurement combination.

