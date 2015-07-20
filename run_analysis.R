##See README at link: https://github.com/erounsavall/getdata-030/blob/master/README.md

run_analysis <- function() {
  library(plyr)
  library(dplyr)
  library(reshape2)
  library(tidyr)
  
## 1.	Merges the training and the test sets to create one data set.
## 2.	Extracts only the measurements on the mean and standard deviation for each measurement.  
    ## 'features.txt': List of all features. The length of this list 
    ## will be the original width of the training and test sets before they are narrowed.
    ## (In other words, the 'features' list represents the columns of the raw training and test data sets)
    features <- read.csv("UCI HAR Dataset/features.txt", col.names=c("index","feature"), sep=" ",header=FALSE)
    numfeatures <- nrow(features)
    
    ## Extracting only mean() and SD() features - will later narrow the training and test sets
    ## by selecting only these columns. 
    MeanStdColumns <- grep(("mean\\(\\)|std\\(\\)"), features$feature, value = FALSE)
    MeanStdFeatures <- features[features$index %in% MeanStdColumns,]
    
    ## Read in the 'train/X_train.txt': Training set. 7352 obs of 561 vars
    X_train <- read.fwf("UCI HAR Dataset/train/X_train.txt",widths=rep(c(16),times=numfeatures),header=FALSE)
    
    ## Subset to pull only the mean() and std() columns we identified above, and apply column names.
    ## Note: if we applied the full list of column names now, THEN joined and subsetted by grepping column names later
    ## it would be suboptimal because of duplicate items in the 'features' list which we do not use anyway.
    ## Also this reduces amount of data to manipulate thereby reducing  processing time. 
    narrX_train <- X_train[,c(MeanStdColumns)]
    colnames(narrX_train) <- MeanStdFeatures[,2]
    
    ##Get the list of activity labels and apply them to the dataframe
    Y_train <- read.csv("UCI HAR Dataset/train/Y_train.txt",col.names="label",header=FALSE)
    narrX_train$activitylabel <- Y_train$label   
    
    ##And get the list of subject labels and apply them to the data frame
    subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt",col.names="subject",header=FALSE)
    narrX_train$subject <- subject_train$subject  
                              
    ## 'test/X_test.txt': Test set. 2947 obs of 561 vars. Repeat the whole process we did for the training set.
    X_test <- read.fwf("UCI HAR Dataset/test/X_test.txt", widths=rep(c(16),times=numfeatures),header=FALSE)
    narrX_test <- X_test[,c(MeanStdColumns)]
    colnames(narrX_test) <- MeanStdFeatures[,2]
    
    Y_test <- read.csv("UCI HAR Dataset/test/Y_test.txt",col.names="label",header=FALSE)
    narrX_test$activitylabel <- Y_test$label    ## add activity label
    
    subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt",col.names="subject",header=FALSE)
    narrX_test$subject <- subject_test$subject  ## add subject
    
    ## merge the two data sets - now we have 10299 obs of 69 vars
    x <- tbl_df(rbind(narrX_train,narrX_test))
   
## 3.	Uses descriptive activity names to name the activities in the data set
    ## Using a 'join' to add the column of activity names from the activity_labels file, matching by the activitylabel 
    ## index number. Creates data set y with 10299 observations of 70 variables.
    activitylabels <-  read.csv("UCI HAR Dataset/activity_labels.txt", col.names=c("activitylabel","activityname"), sep=" ",header=FALSE)
    y <- join(x, activitylabels, by = "activitylabel")

## 4.	Appropriately labels the data set with descriptive variable names. 

## 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    ## First, use 'melt' (reshape2) to pull feature names (the vector being measured) into rows instead of columns. 
    ## Each observation is in one row and each variable is in one column. I assume 'measurement' is a variable with 66 levels.
    ## This is "long form" tidy data. See the 'read me' file for more on why this is tidy.
    
    yMelt <- melt(y, id=c("subject", "activityname"), measure.vars = MeanStdFeatures[,2]) 
    colnames(yMelt) = c("subject","activityname","measurement","value")
    yMelt
    
    ## Then, summarize the mean of each measurement for each activity and subject. 
    ## 11880 rows; to cross check, this is 66 measurements for each of 30 subjects and 6 activities.
    ## 66*30*6 = 11880
    tidy <- ddply(yMelt, c("subject", "activityname","measurement"), summarize,
                   mean = mean(value))
    ## write.table(tidy,"tidydata.txt")              
    tidy                     
}
