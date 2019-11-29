# Getting-and-Cleaning-Data-Course-Project

# ==================================================================
# Human Activity Recognition Using Smartphones Dataset
# Tidy Data Set - Charlotte Collingwood
# ==================================================================

# The final tidy data set:
Dimensions of final data set : 180 68
see codebook.txt for full breakdown of the data.

packages used: Dplyr, data.table

---
The code:
---
The code provided cleans the data from the UCI HAR Dataset.
It begins by merging the test data to create a data frame of subject value, activity and test values
Then it merges the train data in the same way, before binding these together to form one large data set.
Following this, the columns are all given descriptive labels.
Then grep is used to extract only columns including 'mean()' or 'std()' in the column name. To prevent inclusion of meanFreq() columns, these had to be removed using grep again.

Next, the activity ID values are given character/descriptive names by merging them with a data.set of the activity labels text file. This was done using set.key and merge() from the dpylr package.
The column names are then fixed to be descriptive and clear, by removing special characters and clarifying previous simplifications.

Finally, the data is reshaped to have 1 row for each subject/activity combination using group_by and summarise_all, with the mean of each variable as the output.

---
Column names and descriptions:
note: xyz used to denote the 3-axial directions
---
Subject: the subject ID number
Activity: the activity they were recorded doing (walking, walking upstairs, walking downstairs, sittying, standing or laying)

tbodyacc std x/y/z : the average standard deviation of time of body acceleration
tgravityacc mean x/y/z : the average time of gravity acceleration
tgravityacc std x/y/z : the average standard deviation of time of gravity acceleration
tbodyaccjerk mean x/y/z : the average body linear acceleration
tbodyaccjerk std x/y/z : the average standard deviation of body linear acceleration
tbodygyro mean x/y/z : the average time of body gyroscope 
tbodygyro std x/y/z : the average standard deviation of time of body gyroscope
tbodygyrojerk mean x/y/z : the average body angular velocity
tbodygyrojerk std x/y/z : the average standard deviation of body angular velocity
tbodyaccmag mean : the average magnitude of body acceleration
tbodyaccmag std : the average standard deviation of magnitude of body acceleration
tgravityaccmag mean : the average magnitude of gravity acceleration
tgravityaccmag std : the average standard deviation of gravity acceleration
tbodyaccjerkmag mean : the average magnitude of body linear acceleration
tbodyaccjerkmag std : the average standard deviation of magnitude of body linear acceleration
tbodygyromag mean : the average magnitude of body gyroscope
tbodygyromag std : the average standard deviation of magnitude of body gyroscope
tbodygyrojerkmag mean : the average magnitude of angular velocity
tbodygyrojerkmag std : the average standard deviation of magnitude of angular velocity

freq bodyacc mean x/y/z : the frequency domain signals of tbodyacc mean x/y/z
freq bodyacc std x/y/z : the frequency domain signals of tbodyacc std x/y/z          
freq gravityacc mean x/y/z : the frequency domain signals of tgravityacc mean x/y/z
freq gravityacc std x/y/z : the frequency domain signals of tgravityacc std x/y/z
freq bodyaccjerk mean x/y/z : the frequency domain signals of tbodyaccjerk mean x/y/z
freq bodyaccjerk std x/y/z : the frequency domain signals of tbodyaccjerk std x/y/z
freq bodygyro mean x/y/z : the frequency domain signals of tbodygyro mean x/y/z
freq bodygyro std x/y/z : the frequency domain signals of tbodygyro std x/y/z
freq bodygyrojerk mean x/y/z : the frequency domain signals of tbodygyrojerk mean x/y/z
freq bodygyrojerk std x/y/z : the frequency domain signals of tbodygyrojerk std x/y/z
freq bodyaccmag mean : the frequency domain signals of tbodyaccmag mean
freq bodyaccmag std : the frequency domain signals of tbodyaccmag std
freq gravityaccmag mean : the frequency domain signals of tgravityaccmag mean
freq gravityaccmag std : the frequency domain signals of tgravityaccmag std
freq bodyaccjerkmag mean : the frequency domain signals of tbodyaccjerkmag mean
freq bodyaccjerkmag std : the frequency domain signals of tbodyaccjerkmag std
freq bodygyromag mean : the frequency domain signals of tbodygyromag mean
freq bodygyromag std : the frequency domain signals of tbodygyromag std
freq bodygyrojerkmag mean : the frequency domain signals of tbodygyrojerkmag mean
freq bodygyrojerkmag std : the frequency domain signals of tbodygyrojerkmag std
