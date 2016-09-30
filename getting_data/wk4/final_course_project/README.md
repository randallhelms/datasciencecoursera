The associated R script file run_analysis.R file contains a full script for answering the Getting and Cleaning Data Course Project, which is part of the Coursera/Johns Hopkins Data Science Specialization.

Everything is in this one script, and it covers all of the necessary steps:

- Downloading and unzipping the data
- Merges the training and test sets into one
- Extracts measurements for mean and standard deviation only
- Appropriately names the activities and the variables
- Creates new and tidy (!) data set with the mean of each variable for each activity and subject

Where necessary, I've also included the relevant navigational commands to help you move through the folders created when you unzip the UCI HAR dataset.

This script requires the following R packages:

* data.table
* plyr

If you don't have one or both of these packages, you can install them with the following commands:

install.packages("data.table")

install.packages("plyr")

Once you have written the final tidy_data.txt file, you can read it back into R using the following script:

tidy_check <- read.table("tidy_data.txt")