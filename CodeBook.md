Code Book
========================================================

##Summary.txt

This script generates a space delimited data set with row and column names. The row names are simply the record numbers, while the column names are as follows:
- ActivityName: A string that contains a human readable name for the type of activity that was carried out.
- Subject: An integer that identifies the subject(person) who carried out the activity. Names for subjects were not provided in the initial data set.
- *Measurements* The remaining columns are named according to their names inside of the original data set, as documented here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The columns in this file are the means of the measurements in the original file, broken out by ActivityName and Subject. The columns are limited to those columns from the original data set that contain the strings "mean()" or "std()"

