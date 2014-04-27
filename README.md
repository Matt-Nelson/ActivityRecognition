ActivityRecognition
===================

## Description
This script grabs a local copy of the data described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and transforms it to assign human readable activity names and subjects to each measurement record. It then reduces the amount of information to those measurements that contain the strings 'mean()' or 'std()' in their names, and summarizes the measurements of the unique combinations of the activity name and the subjects by taking the mean of each of the measurements.

## Usage
The script assumes that your working directory is the "UCI HAR Datasets" directory that is extracted from the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip archive. In order for this script to work, you must first download the archive, unzip it, and change your working directory to the "UCI HAR Datasets" directory contained in the zip.

Once you have set your working directory, simply sourcing the run_analysis.R file will carry out the necessary steps, creating a "Summary.txt" file in your working directory that contains a tidy data set with the summary of the data. For more information on the contents of the Summary.txt file, please refer to the CodeBook.md.

## Arguments
As this is implemented as a script and not a function, there are no arguments, and the script will begin running as soon as the file is sourced.

## Required Packages
This script requires that the data.tables package has been installed in order to function correctly.