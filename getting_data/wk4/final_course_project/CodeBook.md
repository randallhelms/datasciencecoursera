run_analysis.R takes the UCI HAR dataset and transforms it per the Course Project instructions.

This means that the final data set provides means (averages) in numeric format for a set of 66 measurement variables for each 6 activities performed by each of 30 subjects.

The dimensions of the final data set are thus 68 columns and 180 rows of numeric data.

Activity Data

Activity data comes from y_train.txt and x_train.txt, and the run_analysis.R script replaces the initial integer values with string values for the activity names, taken from the activity_labels.txt file

Subject Data

The subject data is an integer taken from the subject_train.txt and subject_test.txt files; there are no transformations done to this data.

Measurement variable data

From the original 561 variables in the test and training sets, I have extracted the 66 mean() and std() variables, per the course project instructions. I have NOT included any meanFreq() or angle() variables (i.e. angle(X,gravityMean)) as these are not covered by the instruction "Extracts only the measurements on the mean and standard deviation for each measurement."

This data is in numeric format and remains as such through all transformations.

These variables are taken from the x_test.txt and x_train.txt files.

After being merged, each variable was initially renamed using the variable names from the features.txt file before being transformed a second time into an easier-to-read (and tidier!) format. 

Here is a full list of the pre-transformation names of the variables used:

 [1] "tBodyAcc-mean()-X"          
 [2] "tBodyAcc-mean()-Y"          
 [3] "tBodyAcc-mean()-Z"          
 [4] "tBodyAcc-std()-X"           
 [5] "tBodyAcc-std()-Y"           
 [6] "tBodyAcc-std()-Z"           
 [7] "tGravityAcc-mean()-X"       
 [8] "tGravityAcc-mean()-Y"       
 [9] "tGravityAcc-mean()-Z"       
[10] "tGravityAcc-std()-X"        
[11] "tGravityAcc-std()-Y"        
[12] "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"      
[14] "tBodyAccJerk-mean()-Y"      
[15] "tBodyAccJerk-mean()-Z"      
[16] "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"       
[18] "tBodyAccJerk-std()-Z"       
[19] "tBodyGyro-mean()-X"         
[20] "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"         
[22] "tBodyGyro-std()-X"          
[23] "tBodyGyro-std()-Y"          
[24] "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"     
[26] "tBodyGyroJerk-mean()-Y"     
[27] "tBodyGyroJerk-mean()-Z"     
[28] "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"      
[30] "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"         
[32] "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"      
[34] "tGravityAccMag-std()"       
[35] "tBodyAccJerkMag-mean()"     
[36] "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"        
[38] "tBodyGyroMag-std()"         
[39] "tBodyGyroJerkMag-mean()"    
[40] "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"          
[42] "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"          
[44] "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"           
[46] "fBodyAcc-std()-Z"           
[47] "fBodyAccJerk-mean()-X"      
[48] "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"      
[50] "fBodyAccJerk-std()-X"       
[51] "fBodyAccJerk-std()-Y"       
[52] "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"         
[54] "fBodyGyro-mean()-Y"         
[55] "fBodyGyro-mean()-Z"         
[56] "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"          
[58] "fBodyGyro-std()-Z"          
[59] "fBodyAccMag-mean()"         
[60] "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()" 
[62] "fBodyBodyAccJerkMag-std()"  
[63] "fBodyBodyGyroMag-mean()"    
[64] "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()"
[66] "fBodyBodyGyroJerkMag-std()"