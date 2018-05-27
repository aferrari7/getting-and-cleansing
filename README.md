# Getting and Cleansing Data Peer review

Attached is the r code (run_analysis.r), the code to put together and tidy up. Below is a description of the data set, pulled straight from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


The purpose of the project is to combine the data from multiple sources into one tidy data set. For the test data set, x_test.txt contains the raw numbers, y_test.txt contains the activity data, and subject_test.txt contains the actual subject who performed the task. All files can be thought of as single columns, and all can be combined into one data set. The training data has a corresponding file for each set of data. There is one more file, activity labels, which allows you to translate the activity data (numerically coded 1-6) into actual activities (ex. activity 1 is walking).  
