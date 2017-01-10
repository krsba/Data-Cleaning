# Data-Cleaning
Readme File for Generating the Final_Dataset.txt

Step 1 -

Set the correct working directory

Step 2 -

Read all the necessary input files. The head function is being used to get information about the variables in the activity_label and features test file so that can be used in processing the next steps.

Step 3 -

Combine the train and test data for Subject files. Dimension are checked to understand the data and also the lone variable in the data set is given a unique name SubjectID, so as to help in merge operations later on. This is necessary as same variable names repeat in subject, X & y dataset.

Step 4 -

Combine the train and test data for Y files. Dimension are checked to understand the data and also the lone variable in the data set is given a unique name ActivityID, so as to help in merge operations later on. This is necessary as same variable names repeat in subject, X & y dataset.

Step 5 -

Combine the train and test data for X files. The combined file is assigned variable names using the second variable of features dataset.

Step 6 -

Create the new data set using the combined subject, X and y data sets.

Step 7 -

Extracting out only the columns which either contain a mean or standard deviation value. The grep function is used to get the index position from features dataset for variable which containmean or standard deviation values. The result vector is incremented by 2 as the firt two postions of the combined New_Dataset is occupied by subject ID and Activity ID values. Next we take subset of New_Dataset and assign it to New_Dataset2

Step 8 -

Change the value of activty ID column with test values using the data from Activity_label dataset.

Step 9 -

Cleaning up Variable names of New_dataset2

Step 10 -

Installing and loading the reshap2 package. Installation step is commented out in order to avoid warning messages during during execution.

Step 11 -

Using Melt and dcast function to take the mean of variable for the each activity and subject combination.

Step 12 -

Writing the output file
