# Getting-and-Cleaning-Data
Course project for Coursera

## How the Script works

The script **run_analysis.R** follows the same logical structure of the question 1.

Code is divided into 5 steps which matches the each step in the question.

1. *I merge the training and the test sets to create one data set.* I read the tables with the 'read.table' table function. Then I used the 'rbind' function to combine the train and test sets
2. *I extract only the measurements on the mean and standard deviation for each measurement.* I apply the 'sbind' function to derive the mean and std of each variable.
3. *I used descriptive activity names to name the activities in the data set.* Similar to the first part, I used the 'read.table' function the read the labels and in the next step I joined these labels to the 'data.frame'
4. *I appropriately labeled the data set with descriptive variable names.* Using the labels from the previous step, I labeled the data while utilizing 'join' function from the library 'plyr'
5. *From the data set in step 4, I created a second, independent tidy data set with the average of each variable for each activity and each subject.* For this part I used the 'aggregate'function to find the means of each category. This changed the order of columns so I reordered the columns afterwards.

##Code Book

In this part, I will describe the variables created while running the script **run_analysis.R**

###Data
* *X_main*: This is the joined table storing X-values for train and test sets
* *Y_main*: This is the joined table storing y-values for train and test sets
* *x_test*: Raw data for X-test
* *x_train*: Raw data for X-train
* *y_test*: Raw data for y-test
* *y_train*: Raw data for y-train
* *y_labels*: Raw data for the labels of the **y** variable.
* *Y_modified*: The joined table combining **Y_main** with **X_main**
* *data*: The main table joining both the **X** and the **Y** variables.
* *data2*: This is the second main table where the data from the table *data* is aggregated with respect to means of each column

###Values
* *features*: labels directly extracted from the raw data
* *m*: mean of the each varible in X_main
* *s*: standard deviation of each variable in X_main
* *col*: interim matrix storing all the column names for the labels of each activity for **Y** variable.
