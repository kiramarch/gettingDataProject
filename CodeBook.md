The data file "Tidy UCI HAR Dataset.txt" is a transformation of a much richer dataset, which can be found it in entirety at this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This explanation covers ONLY the changes made in this summary dataset. The file README.txt in the original bundle supplies complete information about the subjects, experiment structure and observations. 

## ROWS
Each row contains measurements for one activity by one subject -- for example, subject 6's measurements while walking. 

## COLUMNS
The columns are a subset of the columns in the original dataset -- they are *only* the columns with either "mean" or "std" in their names. 

I did minimal cleanup to the variable names -- the original codebook contained such detailed documentation that significant changes would have been unnecessarily confusing. I simply removed the parentheses and corrected some minor mis-naming. I considered writing out the abbreviations (for example, "time" instead of "t") but decided that because the names were already so long, adding more letters would make them harder to read. 

The definitions of each variable are found in the file features_info.txt in the original data package. 

## VALUES
The values are the mean of all the observations for the subject, activity and variable.

