##Start with download file, gzfile()
##Unzip to a folder 'UCI HAR Dataset' which is a subfolder of the working folder.

run_analysis <- function() {
  library(plyr)
  library(dplyr)
  library(reshape2)
  
## 1.	Merges the training and the test sets to create one data set.
    ## 'features.txt': List of all features. The length of this list 
    ## will be the width of the training and test sets.
    features <- read.csv("UCI HAR Dataset/features.txt", col.names=c("index","feature"), sep=" ",header=FALSE)
    ## 2. Extracting only mean() and SD() features
    MeanStdColumns <- grep(("mean\\(\\)|std\\(\\)"), features$feature, value = FALSE)
    MeanStdFeatures <- features[features$index %in% MeanStdColumns,]
    numfeatures <- nrow(features)
      ## Do we only want the variables representing mean and stdevs?
    
    ## 'train/X_train.txt': Training set. 7352 obs of 561 vars
    X_train <- read.fwf("UCI HAR Dataset/train/X_train.txt",widths=rep(c(16),times=numfeatures),header=FALSE)
    narrX_train <- X_train[,c(MeanStdColumns)]
    colnames(narrX_train) <- MeanStdFeatures[,2]
    Y_train <- read.csv("UCI HAR Dataset/train/Y_train.txt",col.names="label",header=FALSE)
    subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt",col.names="subject",header=FALSE)
    
    narrX_train$subject <- subject_train$subject  ## add subject
    narrX_train$activitylabel <- Y_train$label   ## add activity label
                          
    ## 'test/X_test.txt': Test set. 2947 obs of 561 vars
    X_test <- read.fwf("UCI HAR Dataset/test/X_test.txt", widths=rep(c(16),times=numfeatures),header=FALSE)
    narrX_test <- X_test[,c(MeanStdColumns)]
    colnames(narrX_test) <- MeanStdFeatures[,2]
    Y_test <- read.csv("UCI HAR Dataset/test/Y_test.txt",col.names="label",header=FALSE)
    subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt",col.names="subject",header=FALSE)
    
    narrX_test$subject <- subject_test$subject  ## add subject
    narrX_test$activitylabel <- Y_test$label    ## add activity label
    
    ## merge the two data sets - now we have 10299 obs of 68 vars
    x <- tbl_df(rbind(narrX_train,narrX_test))
    x

## 2.	Extracts only the measurements on the mean and standard deviation for each measurement.
    ## see above
    
## 3.	Uses descriptive activity names to name the activities in the data set
    activitylabels <-  read.csv("UCI HAR Dataset/activity_labels.txt", col.names=c("activitylabel","activityname"), sep=" ",header=FALSE)
    y <- join(x, activitylabels, by = "activitylabel")

## 4.	Appropriately labels the data set with descriptive variable names. 
    yMelt <- melt(y, id=c("subject", "activityname"), measure.vars = MeanStdFeatures[,2]) 
    colnames(yMelt) = c("subject","activityname","measurement","value")

## 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    z <- group_by(yMelt, subject, activityname, measurement)
    tidy <- summarize(y,
                    subject = distinct(subject),
                    activityname = distinct(activityname),
                    measurement = distinct(measurement),
                    mean = mean(value))
                          
}
