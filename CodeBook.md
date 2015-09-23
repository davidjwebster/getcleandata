---
title: "Code Book"
author: "David Webster"
date: "23 September 2015"
output: html_document
---

This is the Code Book describing the process used to clean the 'Human Activity Recognition Using Smartphones' dataset.

1. The raw data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip The raw dataset contains a test set of 7352 observations and a training set of 2947 observations. In both sets, there is data for 561 variables.

2. The size of the dataset was reduced by selecting only the 86 variables relating to the mean and standard deviation of various parameters (as described below).

3. Using the information provided in activity_labels.txt and subject_train.txt/subject_test.txt, the data was labelled according to activity  and subject. There were 30 different subjects and 6 different activities.

4. For each of the 180 combinations of subject and activity, the mean of each variable was taken.

5. The resulting table with 88 columns corresponding to the 86 variables relating to the mean and standard_deviations was output to cleandat.txt.

The first row of the table contains the variable labels. The columns are as follows:

Column 1 - Activity ('LAYING','SITTING','STANDING','WALKING','WALKING DOWNSTAIRS','WALKING UPSTAIRS')

Column 2 - Subject (1-30)

Columns 3-88. The data variables corresponding to the mean and standard deviation in three dimensions as described in features_info.txt (provided in the raw data download and also in this repo).