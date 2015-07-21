---
title: "Codebook"
output: html_document
---
Codebook for tidy data (link: https://github.com/erounsavall/getdata-030/blob/master/tidydata.txt)

To read into R, use 
```{r}
tidydata <- read.table("tidydata.txt", header = TRUE, stringsAsFactors = TRUE)
```
##Columns
 
### Subject: 
Integer vector, 30 levels, each representing a person performng an activity.

### Activity: 
Character vector. 6 levels, each of which describes the activity performed:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Measurement: 
Character vector, 66 levels. Mean() and SD() of values calculated from raw accelerometer data along a variety of computational methods and vectors. Excludes features/measurements for which "mean" is a parameter value (e.g., fBodyBodyGyroJerkMag-meanFreq(), angle(X,gravityMean)); rationale being that the intent is to capture mean() and sd() as a method of describing distribution of values of those vectors. 

Measurement levels     | (and a slightly better definition):
-----------------------|--------------------------------
  tBodyAcc-mean()-X	   | time.body.acceleration.x.axis.mean
  tBodyAcc-mean()-Y	   | time.body.acceleration.y.axis.mean
  tBodyAcc-mean()-Z	   | time.body.acceleration.z.axis.mean
  tBodyAcc-std()-X	   | time.body.acceleration.x.axis.std
  tBodyAcc-std()-Y	   | time.body.acceleration.y.axis.std
  tBodyAcc-std()-Z	   | time.body.acceleration.z.axis.std
  tGravityAcc-mean()-X	      | time.gravity.acceleration.x.axis.mean
  tGravityAcc-mean()-Y	      | time.gravity.acceleration.y.axis.mean
  tGravityAcc-mean()-Z	      | time.gravity.acceleration.z.axis.mean
  tGravityAcc-std()-X	        | time.gravity.acceleration.x.axis.std
  tGravityAcc-std()-Y	        | time.gravity.acceleration.y.axis.std
  tGravityAcc-std()-Z	        | time.gravity.acceleration.z.axis.std
  tBodyAccJerk-mean()-X	      | time.body.linear.acceleration.jerk.x.axis.mean
  tBodyAccJerk-mean()-Y	      | time.body.linear.acceleration.jerk.y.axis.mean
  tBodyAccJerk-mean()-Z	      | time.body.linear.acceleration.jerk.z.axis.mean
  tBodyAccJerk-std()-X	      | time.body.linear.acceleration.jerk.x.axis.std
  tBodyAccJerk-std()-Y	      | time.body.linear.acceleration.jerk.y.axis.std
  tBodyAccJerk-std()-Z        | time.body.linear.acceleration.jerk.z.axis.std
  tBodyGyro-mean()-X	        | time.body.gyroscope.x.axis.mean
  tBodyGyro-mean()-Y	        | time.body.gyroscope.y.axis.mean
  tBodyGyro-mean()-Z	        | time.body.gyroscope.z.axis.mean
  tBodyGyro-std()-X	          | time.body.gyroscope.x.axis.std
  tBodyGyro-std()-Y	          | time.body.gyroscope.y.axis.std
  tBodyGyro-std()-Z	          | time.body.gyroscope.z.axis.std
  tBodyGyroJerk-mean()-X	    | time.body.angular.velocity.jerk.x.axis.mean
  tBodyGyroJerk-mean()-Y	    | time.body.angular.velocity.jerk.y.axis.mean
  tBodyGyroJerk-mean()-Z	    | time.body.angular.velocity.jerk.z.axis.mean
  tBodyGyroJerk-std()-X	      | time.body.angular.velocity.jerk.x.axis.xtd
  tBodyGyroJerk-std()-Y	      | time.body.angular.velocity.jerk.y.axis.std
  tBodyGyroJerk-std()-Z	      | time.body.angular.velocity.jerk.z.axis.std
  tBodyAccMag-mean()	        | time.body.acceleration.magnitude.mean
  tBodyAccMag-std()	          | time.body.acceleration.magnitude.std
  tGravityAccMag-mean()	      | time.gravity.acceleration.magnitude.mean
  tGravityAccMag-std()	      | time.gravity.acceleration.magnitude.std
  tBodyAccJerkMag-mean()	    | time.body.linear.acceleration.jerk.magnitude.mean
  tBodyAccJerkMag-std()	      | time.body.linear.acceleration.jerk.magnitude.std
  tBodyGyroMag-mean()	        | time.body.gyroscope.magnitude.mean
  tBodyGyroMag-std()	        | time.body.gyroscope.magnitude.std
  tBodyGyroJerkMag-mean()	    | time.body.angular.velocity.jerk.magnitude.mean
  tBodyGyroJerkMag-std()	    | time.body.angular.velocity.jerk.magnitude.std
  fBodyAcc-mean()-X	          | frequency.body.acceleration.x.axis.mean
  fBodyAcc-mean()-Y	          | frequency.body.acceleration.y.axis.mean
  fBodyAcc-mean()-Z	          | frequency.body.acceleration.z.axis.mean
  fBodyAcc-std()-X	          | frequency.body.acceleration.x.axis.std
  fBodyAcc-std()-Y	          | frequency.body.acceleration.y.axis.std
  fBodyAcc-std()-Z	          | frequency.body.acceleration.z.axis.std
  fBodyAccJerk-mean()-X	      | frequency.body.linear.acceleration.jerk.x.axis.mean
  fBodyAccJerk-mean()-Y	      | frequency.body.linear.acceleration.jerk.y.axis.mean
  fBodyAccJerk-mean()-Z	      | frequency.body.linear.acceleration.jerk.z.axis.mean
  fBodyAccJerk-std()-X	      | frequency.body.linear.acceleration.jerk.x.axis.std
  fBodyAccJerk-std()-Y	      | frequency.body.linear.acceleration.jerk.y.axis.std
  fBodyAccJerk-std()-Z	      | frequency.body.linear.acceleration.jerk.z.axis.std
  fBodyGyro-mean()-X	        | frequency.body.gyroscope.x.axis.mean
  fBodyGyro-mean()-Y	        | frequency.body.gyroscope.y.axis.mean
  fBodyGyro-mean()-Z	        | frequency.body.gyroscope.z.axis.mean
  fBodyGyro-std()-X	          | frequency.body.gyroscope.x.axis.std
  fBodyGyro-std()-Y	          | frequency.body.gyroscope.y.axis.std
  fBodyGyro-std()-Z	          | frequency.body.gyroscope.z.axis.std
  fBodyAccMag-mean()	        | frequency.body.acceleration.magnitude.mean
  fBodyAccMag-std()	          | frequency.body.acceleration.magnitude.std
  fBodyBodyAccJerkMag-mean()  | frequency.body.linear.acceleration.jerk.magnitude.mean
  fBodyBodyAccJerkMag-std()	  | frequency.body.linear.acceleration.jerk.magnitude.std
  fBodyBodyGyroMag-mean()	    | frequency.body.gyroscope.magnitude.mean
  fBodyBodyGyroMag-std()	    | frequency.body.gyroscope.magnitude.std
  fBodyBodyGyroJerkMag-mean()	| frequency.body.angular.velocity.jerk.magnitude.mean
  fBodyBodyGyroJerkMag-std()	| frequency.body.angular.velocity.jerk.magnitude.std

### Mean: 
(Numeric)
  The mean of values for each subject-activity-measurement combination.
  As there are 30 subjects, 6 activities and 66 measurements, there are 11880 possible combinations and thus 11880 rows in the dataset. 

For additional information (extraction methods, approach, etc.): see the readme at https://github.com/erounsavall/getdata-030/blob/master/README.md