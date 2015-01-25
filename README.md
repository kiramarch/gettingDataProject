This set of files completes the course project for Getting and Cleaning data by processing a data set and documenting the changes. Included are:

1. This readme file, which explains what the other files are.
2. The file run_analysis.R, which contains the script that does the data processing. Detailed comments in the script explain each step in the processing. 
3. The tidy output, in this file: Tidy UCI HAR Dataset.txt
4. CodeBook.md, which explains the contents of the datafile.

To execute the script:

* Make sure packages data.table and reshape2 are installed (the script will load them)
* Unzip the project dataset (found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), which creates a folder called *UCI HAR Dataset*. 
* Place the file *run_analysis.R* in the same directory as the dataset folder --  the file must be on the same level as the folder "UCI HAR Dataset"
* At the R prompt, source the file using this command: source("run_analysis.R")
* Execute the script using this command: run_analysis()
* The tidy data file will be created in the same directory, and it will be called *Tidy UCI HAR Dataset.txt*.  

In that file will be a data.frame with 180 observations of 81 variables. To read the created datafile into R, use this command:  
dt <- read.table("Tidy UCI HAR Dataset.txt", header = TRUE)