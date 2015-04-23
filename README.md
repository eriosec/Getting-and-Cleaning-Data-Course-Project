---
title: "Codebook for Getting and Cleaning Data Project"
author: "Eric Osorio"
date: "4/26/15"
output: average of all the measured features for a merged set of training and test data in a tidy data set format
  keep_md: yes
---
 
## Project Description
This project manipulates a number of raw data files to create a scriipt that accomplishes these 5 things:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.  For this step, only the subject and measurements are used to calculate the means and standard deviation of all the variables. The "Activity" variable is added later.
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 
## Project Description

This information was compiled from the original README.txt and features_info.txt files that were in the downloaded zipped files from the project site specified under the Collection of Raw Data section below:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

 
###Collection of the raw data
 All the raw data was downloaded from this website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and downloaded in a zip file through this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Once it is downloaded and unzipped, read the README.txt file and open up the following files: 
	subject_test.txt,
	X_test.txt
	y_test.txt
	subject_train.txt
	X_train.txt
	y_train.txt
	activity_labels.txt
	features.txt
Load them into R tables and look at the dimensions of each to make sure that you understand how the different files are related to each other. You should find that the subject_test.txt, X_test.txt  and the y_test.txt files have the same number of rows(2947). Similarly, the X_train.txt, y_train.txt and subject_train.txt files have the same number of rows (7352). The features.txt file has 561 rows which is the same number of columns as in the X_test.txt and the X_train.txt files. From this we can conclude that the feature.txt file holds the names for each of the columns in the X_train.txt and the X_test.txt files; the subject_train.txt holds each of subjects for the observations in the X_train.txt file; and the subject_test.txt holds each of the subjects for the observations in the X_test.txt file. Furthermore, looking at the contents of y_test.txt and y_train.txt we notice that the values are between 1 and 6 which correspond to the activities specified in the activity_labels.txt and so we see that the activities in y_test.txt has a one-to-one correspondance to the observations in the X_test .txt file and similarly, the activities in y_train.txt has a one-to-one correspondance to the observations in the X_train.txt file. Thus, from all these files a Test Set table with dimensions of 2947 by 563 can be created which will have all the observations of the test set and all the measured features(561) plus a column for the subjects and a column for the activity. Similarly, a Train Set table with dimensions of 7352 by 563 can be created which will have all the observations of the train set and all the measured features(561) plus a column for the subjects and a column for the activity. The full set of merged data with all features and columns for Activity and Subject should have a dimension of 10299 by 563.
 
###Notes on the original (raw) data 
From the original README.txt file we were provided these notes on the raw data:
For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

 
##Creating the tidy datafile
 The tidy data file is created by running the run_analysis.R script 
###Guide to create the tidy data file
Description on how to create the tidy data file:

1. Download all the files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Unzip the files and place all of them in a folder called "data"

3. Make the "data" folder the working directoty

4. Go into the test and train directories that were created during the unzip process and copy these files directly into the "data" folder:
	subject_test.txt
	X_test.txt
	y_test.txt
	subject_train.txt
	X_train.txt
	y_train.txt

5. After step 4. in addition to those files, you'll also have the following files directly in the "data" folder:
	activity_labels.txt
	features.txt
	features.info.txt
	README.txt

6.  Open R Studio and make the "data" directory your working directory

7. Create new R Script file saving it with the name run_analysis.R

8. Install and load the data.table package

9. Read the activity_labels.txt file into a table called "activities" and name the columns as "activitycode" and "activity"

10. Read the features.txt file into another table called "features" and name the columns as "featcode" and "feature"

11. Extract the "feature" column from the features table and store it into a vector called "featurevec"

12. Read the "subject_test.txt" file into a table called "subjectTest" and name the column "subject"

13. Read the "subject_train.txt" file into a table called  "subjectTrain" and name the column "subject"

14. Read the file "X_test.txt" into a table called "XTest"

15. Use the "featurevec" vector created in step 11 to assign the column names to "XTest"

16.  Column bind the "subjectTest" table with the "XTest" table and name it "XTestnamed" which will in essence give you a table with all the subjects that were used in the test set and all the measurements taken for those subjects with all the columns labeled

17. Read the file "X_train.txt" into a table called "XTrain"

18. Use the "featurevec" vector created in step 11 to assign the column names to "XTrain"

19.  Column bind the "subjectTrain" table with the "XTrain" table and name it "XTrainnamed" which will in essence give you a table with all the subjects that were used in the train set and all the measurements taken for those subjects with all the columns labeled

20. Row bind "XTrainednamed" with "XTestnamed" into a new table called "fullSet", this will create the merged set that will have all of the subjects in the study, those assigned to the test set and those assigned to the train set,  with all of the labeled measurements that were taken for each of these subjects

21. Sort the "fullSet" table by subject. Since there were 30 subjects in the study,  the subjects will go from subject number 1 to subject number 30

22. Calculate and extract the mean for all the columns in "fullSet" assigning them to "mergedMeans"

23. Extract the column names from mergedMeans and assign them to "mergedMeansColNames"

24. Create an empty vector called "featurevecmeans"

25. Paste the "-Mean" suffix to each of the values in "mergedMeansColNames" with no separation between the original column name and the suffix and assign them into the "featurevecmeans" vector

26. Create "mergedMeansTable" as a table of the transposed "mergedMeans" numeric vector

27. Rename the column names of "mergedMeansTable" by assigning them the values in the "featuresvecmeans" vector

28. Print out the "mergedMeanstable" which shows us the mean of all the measurements in the merged set

29. Calculate and extract the standard deviation for all the columns in "fullSet" assigning them to "mergedSDS"

30. Extract the column names from mergedSDS and assign them to "mergedSDSColNames"

31. Create an empty vector called "featurevecsds"

32. Paste the "-StdDev" suffix to each of the values in "mergedSDSColNames" with no separation between the original column name and the suffix and assign them into the "featurevecsds" vector

33. Create "mergedSDSTable" as a table of the transposed "mergedSDS" numeric vector

34. Rename the column names of "mergedSDSTable" by assigning them the values in the "featuresvecsds" vector

35. Print out the "mergedSDSstable" which shows us the standard deviation of all the measurements in the merged set

36. Read the "y_test.txt" file into a table called "yTestActivites"

37. Read the "y_train.txt" file into a table called "yTrainActivites"

38. Read the "activity_labels.txt" file into a table called "activityLabels"

39. Create a function called "applyLabels" that will take as arguments "yTrainActivities" and "activityLabels" and assign the correct name to the activity codes in the yTrainActivities" table, storing them into a data frame named "dftrain"

40. Name the column of the "dftrain" data frame "Activity"

41. Column bind "dfTrain" and "XTrainednamed" into a table called "XTrainedfull" this essentially gives you the full set of train data with a column for activities appropriately named, subjects and all measurements taken for the training set.

42. ReCreate the function called "applyLabels" that will take as arguments "yTestActivities" and "activityLabels" and assign the correct name to the activity codes in the yTestActivities" table, storing them into a data frame named "dftest"

43. Name the column of the "dftest" data frame "Activity"

44. Column bind "dftest" and "XTestdnamed" into a table called "XTestfull" this essentially gives you the full set of test data with a column for activities appropriately named, subjects and all measurements taken for the training set.

45. Row bind "XTrainedfull" and "XTestfull" which will essentially give you the merged data set for both test and training data with columns for all activities properly named, subjects and measurements taken

46. Sort the "fullSet" data frame by subject and activity and store it in a new data frame called "sortedfullSet"

47. Split "sortedfullSet" by subject and store it in a list named "bysubjorderedfull". This will create a list of 30 data frames where each data frame will hold the data for a specific subject

48. Split each data frame of the "sortedfullSet" by activity and store in "subjbyact" which will essentially hold a list for each subject which will in turn hold a list for each of the activities performed by that subject and within that list, the data frame of the data pertaining to that subject and that activity

49. Calculate and extract the means for each of the measurment columns in the data frames within the lists found in "subjbyact" and store in a new list called "measurementMeans"

50. Unlist the "measurementMeans" list to create a tidy data set where A) each variable measurment will be in one column, B) each different observation of that variable (mean for different activity of a user is in a different row , C) there is only one table for this kind of measurments, D) all the columns reflect the name of the appropriate measurement in the data frame.

51. Rename the measurment columns to reflect that they now hold averages for activity performed per subject

52. Use write.table with the row.name=FALSE argument to create the "tidymeans.txt file as output to the script. 

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset: 180 by 563 
 - Summary of the data: The data represents the average value for each of the measurment features collected trhoughout each activity performed by each user. Since there there are 30 users and each user performed 6 activities, there are 180 observations or 180 rows. For each observation 561 measurements were taken and the average for each measurement per subject per activity was calculated and those measurement columns appended with the suffix "-Average". The first two columns are for the "acivity" and the "subject" thus giving us 563 columns in total
 - Variables present in the dataset:
"1" "activity": 
	Class=character
	Unique values= 										"LAYING","SITTING","STANDING","WALKING",WALKING_DOWNSTAIRS	","WALKING_UPSTAIRS" 
	Units=no units
"2" "subject"
	Class=numeric
	Unique values= 1 through 30 
	Units=no units
For the rest of the variables, all values are numeric and unique to that variable and units can be inferred from the original README.txt and fatures_info.txt files although they were not specifically given. The features_info.txt file gives the details of the different variables calculated from the raw data from the Accelerometer and Gyro plus the rest of the calculations derived from the raw data that can be found in the "Inertial Signals" directories
"3" "tBodyAcc-mean()-X-Average"
"4" "tBodyAcc-mean()-Y-Average"
"5" "tBodyAcc-mean()-Z-Average"
"6" "tBodyAcc-std()-X-Average"
"7" "tBodyAcc-std()-Y-Average"
"8" "tBodyAcc-std()-Z-Average"
"9" "tBodyAcc-mad()-X-Average"
"10" "tBodyAcc-mad()-Y-Average"
"11" "tBodyAcc-mad()-Z-Average"
"12" "tBodyAcc-max()-X-Average"
"13" "tBodyAcc-max()-Y-Average"
"14" "tBodyAcc-max()-Z-Average"
"15" "tBodyAcc-min()-X-Average"
"16" "tBodyAcc-min()-Y-Average"
"17" "tBodyAcc-min()-Z-Average"
"18" "tBodyAcc-sma()-Average"
"19" "tBodyAcc-energy()-X-Average"
"20" "tBodyAcc-energy()-Y-Average"
"21" "tBodyAcc-energy()-Z-Average"
"22" "tBodyAcc-iqr()-X-Average"
"23" "tBodyAcc-iqr()-Y-Average"
"24" "tBodyAcc-iqr()-Z-Average"
"25" "tBodyAcc-entropy()-X-Average"
"26" "tBodyAcc-entropy()-Y-Average"
"27" "tBodyAcc-entropy()-Z-Average"
"28" "tBodyAcc-arCoeff()-X,1-Average"
"29" "tBodyAcc-arCoeff()-X,2-Average"
"30" "tBodyAcc-arCoeff()-X,3-Average"
"31" "tBodyAcc-arCoeff()-X,4-Average"
"32" "tBodyAcc-arCoeff()-Y,1-Average"
"33" "tBodyAcc-arCoeff()-Y,2-Average"
"34" "tBodyAcc-arCoeff()-Y,3-Average"
"35" "tBodyAcc-arCoeff()-Y,4-Average"
"36" "tBodyAcc-arCoeff()-Z,1-Average"
"37" "tBodyAcc-arCoeff()-Z,2-Average"
"38" "tBodyAcc-arCoeff()-Z,3-Average"
"39" "tBodyAcc-arCoeff()-Z,4-Average"
"40" "tBodyAcc-correlation()-X,Y-Average"
"41" "tBodyAcc-correlation()-X,Z-Average"
"42" "tBodyAcc-correlation()-Y,Z-Average"
"43" "tGravityAcc-mean()-X-Average"
"44" "tGravityAcc-mean()-Y-Average"
"45" "tGravityAcc-mean()-Z-Average"
"46" "tGravityAcc-std()-X-Average"
"47" "tGravityAcc-std()-Y-Average"
"48" "tGravityAcc-std()-Z-Average"
"49" "tGravityAcc-mad()-X-Average"
"50" "tGravityAcc-mad()-Y-Average"
"51" "tGravityAcc-mad()-Z-Average"
"52" "tGravityAcc-max()-X-Average"
"53" "tGravityAcc-max()-Y-Average"
"54" "tGravityAcc-max()-Z-Average"
"55" "tGravityAcc-min()-X-Average"
"56" "tGravityAcc-min()-Y-Average"
"57" "tGravityAcc-min()-Z-Average"
"58" "tGravityAcc-sma()-Average"
"59" "tGravityAcc-energy()-X-Average"
"60" "tGravityAcc-energy()-Y-Average"
"61" "tGravityAcc-energy()-Z-Average"
"62" "tGravityAcc-iqr()-X-Average"
"63" "tGravityAcc-iqr()-Y-Average"
"64" "tGravityAcc-iqr()-Z-Average"
"65" "tGravityAcc-entropy()-X-Average"
"66" "tGravityAcc-entropy()-Y-Average"
"67" "tGravityAcc-entropy()-Z-Average"
"68" "tGravityAcc-arCoeff()-X,1-Average"
"69" "tGravityAcc-arCoeff()-X,2-Average"
"70" "tGravityAcc-arCoeff()-X,3-Average"
"71" "tGravityAcc-arCoeff()-X,4-Average"
"72" "tGravityAcc-arCoeff()-Y,1-Average"
"73" "tGravityAcc-arCoeff()-Y,2-Average"
"74" "tGravityAcc-arCoeff()-Y,3-Average"
"75" "tGravityAcc-arCoeff()-Y,4-Average"
"76" "tGravityAcc-arCoeff()-Z,1-Average"
"77" "tGravityAcc-arCoeff()-Z,2-Average"
"78" "tGravityAcc-arCoeff()-Z,3-Average"
"79" "tGravityAcc-arCoeff()-Z,4-Average"
"80" "tGravityAcc-correlation()-X,Y-Average"
"81" "tGravityAcc-correlation()-X,Z-Average"
"82" "tGravityAcc-correlation()-Y,Z-Average"
"83" "tBodyAccJerk-mean()-X-Average"
"84" "tBodyAccJerk-mean()-Y-Average"
"85" "tBodyAccJerk-mean()-Z-Average"
"86" "tBodyAccJerk-std()-X-Average"
"87" "tBodyAccJerk-std()-Y-Average"
"88" "tBodyAccJerk-std()-Z-Average"
"89" "tBodyAccJerk-mad()-X-Average"
"90" "tBodyAccJerk-mad()-Y-Average"
"91" "tBodyAccJerk-mad()-Z-Average"
"92" "tBodyAccJerk-max()-X-Average"
"93" "tBodyAccJerk-max()-Y-Average"
"94" "tBodyAccJerk-max()-Z-Average"
"95" "tBodyAccJerk-min()-X-Average"
"96" "tBodyAccJerk-min()-Y-Average"
"97" "tBodyAccJerk-min()-Z-Average"
"98" "tBodyAccJerk-sma()-Average"
"99" "tBodyAccJerk-energy()-X-Average"
"100" "tBodyAccJerk-energy()-Y-Average"
"101" "tBodyAccJerk-energy()-Z-Average"
"102" "tBodyAccJerk-iqr()-X-Average"
"103" "tBodyAccJerk-iqr()-Y-Average"
"104" "tBodyAccJerk-iqr()-Z-Average"
"105" "tBodyAccJerk-entropy()-X-Average"
"106" "tBodyAccJerk-entropy()-Y-Average"
"107" "tBodyAccJerk-entropy()-Z-Average"
"108" "tBodyAccJerk-arCoeff()-X,1-Average"
"109" "tBodyAccJerk-arCoeff()-X,2-Average"
"110" "tBodyAccJerk-arCoeff()-X,3-Average"
"111" "tBodyAccJerk-arCoeff()-X,4-Average"
"112" "tBodyAccJerk-arCoeff()-Y,1-Average"
"113" "tBodyAccJerk-arCoeff()-Y,2-Average"
"114" "tBodyAccJerk-arCoeff()-Y,3-Average"
"115" "tBodyAccJerk-arCoeff()-Y,4-Average"
"116" "tBodyAccJerk-arCoeff()-Z,1-Average"
"117" "tBodyAccJerk-arCoeff()-Z,2-Average"
"118" "tBodyAccJerk-arCoeff()-Z,3-Average"
"119" "tBodyAccJerk-arCoeff()-Z,4-Average"
"120" "tBodyAccJerk-correlation()-X,Y-Average"
"121" "tBodyAccJerk-correlation()-X,Z-Average"
"122" "tBodyAccJerk-correlation()-Y,Z-Average"
"123" "tBodyGyro-mean()-X-Average"
"124" "tBodyGyro-mean()-Y-Average"
"125" "tBodyGyro-mean()-Z-Average"
"126" "tBodyGyro-std()-X-Average"
"127" "tBodyGyro-std()-Y-Average"
"128" "tBodyGyro-std()-Z-Average"
"129" "tBodyGyro-mad()-X-Average"
"130" "tBodyGyro-mad()-Y-Average"
"131" "tBodyGyro-mad()-Z-Average"
"132" "tBodyGyro-max()-X-Average"
"133" "tBodyGyro-max()-Y-Average"
"134" "tBodyGyro-max()-Z-Average"
"135" "tBodyGyro-min()-X-Average"
"136" "tBodyGyro-min()-Y-Average"
"137" "tBodyGyro-min()-Z-Average"
"138" "tBodyGyro-sma()-Average"
"139" "tBodyGyro-energy()-X-Average"
"140" "tBodyGyro-energy()-Y-Average"
"141" "tBodyGyro-energy()-Z-Average"
"142" "tBodyGyro-iqr()-X-Average"
"143" "tBodyGyro-iqr()-Y-Average"
"144" "tBodyGyro-iqr()-Z-Average"
"145" "tBodyGyro-entropy()-X-Average"
"146" "tBodyGyro-entropy()-Y-Average"
"147" "tBodyGyro-entropy()-Z-Average"
"148" "tBodyGyro-arCoeff()-X,1-Average"
"149" "tBodyGyro-arCoeff()-X,2-Average"
"150" "tBodyGyro-arCoeff()-X,3-Average"
"151" "tBodyGyro-arCoeff()-X,4-Average"
"152" "tBodyGyro-arCoeff()-Y,1-Average"
"153" "tBodyGyro-arCoeff()-Y,2-Average"
"154" "tBodyGyro-arCoeff()-Y,3-Average"
"155" "tBodyGyro-arCoeff()-Y,4-Average"
"156" "tBodyGyro-arCoeff()-Z,1-Average"
"157" "tBodyGyro-arCoeff()-Z,2-Average"
"158" "tBodyGyro-arCoeff()-Z,3-Average"
"159" "tBodyGyro-arCoeff()-Z,4-Average"
"160" "tBodyGyro-correlation()-X,Y-Average"
"161" "tBodyGyro-correlation()-X,Z-Average"
"162" "tBodyGyro-correlation()-Y,Z-Average"
"163" "tBodyGyroJerk-mean()-X-Average"
"164" "tBodyGyroJerk-mean()-Y-Average"
"165" "tBodyGyroJerk-mean()-Z-Average"
"166" "tBodyGyroJerk-std()-X-Average"
"167" "tBodyGyroJerk-std()-Y-Average"
"168" "tBodyGyroJerk-std()-Z-Average"
"169" "tBodyGyroJerk-mad()-X-Average"
"170" "tBodyGyroJerk-mad()-Y-Average"
"171" "tBodyGyroJerk-mad()-Z-Average"
"172" "tBodyGyroJerk-max()-X-Average"
"173" "tBodyGyroJerk-max()-Y-Average"
"174" "tBodyGyroJerk-max()-Z-Average"
"175" "tBodyGyroJerk-min()-X-Average"
"176" "tBodyGyroJerk-min()-Y-Average"
"177" "tBodyGyroJerk-min()-Z-Average"
"178" "tBodyGyroJerk-sma()-Average"
"179" "tBodyGyroJerk-energy()-X-Average"
"180" "tBodyGyroJerk-energy()-Y-Average"
"181" "tBodyGyroJerk-energy()-Z-Average"
"182" "tBodyGyroJerk-iqr()-X-Average"
"183" "tBodyGyroJerk-iqr()-Y-Average"
"184" "tBodyGyroJerk-iqr()-Z-Average"
"185" "tBodyGyroJerk-entropy()-X-Average"
"186" "tBodyGyroJerk-entropy()-Y-Average"
"187" "tBodyGyroJerk-entropy()-Z-Average"
"188" "tBodyGyroJerk-arCoeff()-X,1-Average"
"189" "tBodyGyroJerk-arCoeff()-X,2-Average"
"190" "tBodyGyroJerk-arCoeff()-X,3-Average"
"191" "tBodyGyroJerk-arCoeff()-X,4-Average"
"192" "tBodyGyroJerk-arCoeff()-Y,1-Average"
"193" "tBodyGyroJerk-arCoeff()-Y,2-Average"
"194" "tBodyGyroJerk-arCoeff()-Y,3-Average"
"195" "tBodyGyroJerk-arCoeff()-Y,4-Average"
"196" "tBodyGyroJerk-arCoeff()-Z,1-Average"
"197" "tBodyGyroJerk-arCoeff()-Z,2-Average"
"198" "tBodyGyroJerk-arCoeff()-Z,3-Average"
"199" "tBodyGyroJerk-arCoeff()-Z,4-Average"
"200" "tBodyGyroJerk-correlation()-X,Y-Average"
"201" "tBodyGyroJerk-correlation()-X,Z-Average"
"202" "tBodyGyroJerk-correlation()-Y,Z-Average"
"203" "tBodyAccMag-mean()-Average"
"204" "tBodyAccMag-std()-Average"
"205" "tBodyAccMag-mad()-Average"
"206" "tBodyAccMag-max()-Average"
"207" "tBodyAccMag-min()-Average"
"208" "tBodyAccMag-sma()-Average"
"209" "tBodyAccMag-energy()-Average"
"210" "tBodyAccMag-iqr()-Average"
"211" "tBodyAccMag-entropy()-Average"
"212" "tBodyAccMag-arCoeff()1-Average"
"213" "tBodyAccMag-arCoeff()2-Average"
"214" "tBodyAccMag-arCoeff()3-Average"
"215" "tBodyAccMag-arCoeff()4-Average"
"216" "tGravityAccMag-mean()-Average"
"217" "tGravityAccMag-std()-Average"
"218" "tGravityAccMag-mad()-Average"
"219" "tGravityAccMag-max()-Average"
"220" "tGravityAccMag-min()-Average"
"221" "tGravityAccMag-sma()-Average"
"222" "tGravityAccMag-energy()-Average"
"223" "tGravityAccMag-iqr()-Average"
"224" "tGravityAccMag-entropy()-Average"
"225" "tGravityAccMag-arCoeff()1-Average"
"226" "tGravityAccMag-arCoeff()2-Average"
"227" "tGravityAccMag-arCoeff()3-Average"
"228" "tGravityAccMag-arCoeff()4-Average"
"229" "tBodyAccJerkMag-mean()-Average"
"230" "tBodyAccJerkMag-std()-Average"
"231" "tBodyAccJerkMag-mad()-Average"
"232" "tBodyAccJerkMag-max()-Average"
"233" "tBodyAccJerkMag-min()-Average"
"234" "tBodyAccJerkMag-sma()-Average"
"235" "tBodyAccJerkMag-energy()-Average"
"236" "tBodyAccJerkMag-iqr()-Average"
"237" "tBodyAccJerkMag-entropy()-Average"
"238" "tBodyAccJerkMag-arCoeff()1-Average"
"239" "tBodyAccJerkMag-arCoeff()2-Average"
"240" "tBodyAccJerkMag-arCoeff()3-Average"
"241" "tBodyAccJerkMag-arCoeff()4-Average"
"242" "tBodyGyroMag-mean()-Average"
"243" "tBodyGyroMag-std()-Average"
"244" "tBodyGyroMag-mad()-Average"
"245" "tBodyGyroMag-max()-Average"
"246" "tBodyGyroMag-min()-Average"
"247" "tBodyGyroMag-sma()-Average"
"248" "tBodyGyroMag-energy()-Average"
"249" "tBodyGyroMag-iqr()-Average"
"250" "tBodyGyroMag-entropy()-Average"
"251" "tBodyGyroMag-arCoeff()1-Average"
"252" "tBodyGyroMag-arCoeff()2-Average"
"253" "tBodyGyroMag-arCoeff()3-Average"
"254" "tBodyGyroMag-arCoeff()4-Average"
"255" "tBodyGyroJerkMag-mean()-Average"
"256" "tBodyGyroJerkMag-std()-Average"
"257" "tBodyGyroJerkMag-mad()-Average"
"258" "tBodyGyroJerkMag-max()-Average"
"259" "tBodyGyroJerkMag-min()-Average"
"260" "tBodyGyroJerkMag-sma()-Average"
"261" "tBodyGyroJerkMag-energy()-Average"
"262" "tBodyGyroJerkMag-iqr()-Average"
"263" "tBodyGyroJerkMag-entropy()-Average"
"264" "tBodyGyroJerkMag-arCoeff()1-Average"
"265" "tBodyGyroJerkMag-arCoeff()2-Average"
"266" "tBodyGyroJerkMag-arCoeff()3-Average"
"267" "tBodyGyroJerkMag-arCoeff()4-Average"
"268" "fBodyAcc-mean()-X-Average"
"269" "fBodyAcc-mean()-Y-Average"
"270" "fBodyAcc-mean()-Z-Average"
"271" "fBodyAcc-std()-X-Average"
"272" "fBodyAcc-std()-Y-Average"
"273" "fBodyAcc-std()-Z-Average"
"274" "fBodyAcc-mad()-X-Average"
"275" "fBodyAcc-mad()-Y-Average"
"276" "fBodyAcc-mad()-Z-Average"
"277" "fBodyAcc-max()-X-Average"
"278" "fBodyAcc-max()-Y-Average"
"279" "fBodyAcc-max()-Z-Average"
"280" "fBodyAcc-min()-X-Average"
"281" "fBodyAcc-min()-Y-Average"
"282" "fBodyAcc-min()-Z-Average"
"283" "fBodyAcc-sma()-Average"
"284" "fBodyAcc-energy()-X-Average"
"285" "fBodyAcc-energy()-Y-Average"
"286" "fBodyAcc-energy()-Z-Average"
"287" "fBodyAcc-iqr()-X-Average"
"288" "fBodyAcc-iqr()-Y-Average"
"289" "fBodyAcc-iqr()-Z-Average"
"290" "fBodyAcc-entropy()-X-Average"
"291" "fBodyAcc-entropy()-Y-Average"
"292" "fBodyAcc-entropy()-Z-Average"
"293" "fBodyAcc-maxInds-X-Average"
"294" "fBodyAcc-maxInds-Y-Average"
"295" "fBodyAcc-maxInds-Z-Average"
"296" "fBodyAcc-meanFreq()-X-Average"
"297" "fBodyAcc-meanFreq()-Y-Average"
"298" "fBodyAcc-meanFreq()-Z-Average"
"299" "fBodyAcc-skewness()-X-Average"
"300" "fBodyAcc-kurtosis()-X-Average"
"301" "fBodyAcc-skewness()-Y-Average"
"302" "fBodyAcc-kurtosis()-Y-Average"
"303" "fBodyAcc-skewness()-Z-Average"
"304" "fBodyAcc-kurtosis()-Z-Average"
"305" "fBodyAcc-bandsEnergy()-1,8-Average"
"306" "fBodyAcc-bandsEnergy()-9,16-Average"
"307" "fBodyAcc-bandsEnergy()-17,24-Average"
"308" "fBodyAcc-bandsEnergy()-25,32-Average"
"309" "fBodyAcc-bandsEnergy()-33,40-Average"
"310" "fBodyAcc-bandsEnergy()-41,48-Average"
"311" "fBodyAcc-bandsEnergy()-49,56-Average"
"312" "fBodyAcc-bandsEnergy()-57,64-Average"
"313" "fBodyAcc-bandsEnergy()-1,16-Average"
"314" "fBodyAcc-bandsEnergy()-17,32-Average"
"315" "fBodyAcc-bandsEnergy()-33,48-Average"
"316" "fBodyAcc-bandsEnergy()-49,64-Average"
"317" "fBodyAcc-bandsEnergy()-1,24-Average"
"318" "fBodyAcc-bandsEnergy()-25,48-Average"
"319" "fBodyAcc-bandsEnergy()-1,8.1-Average"
"320" "fBodyAcc-bandsEnergy()-9,16.1-Average"
"321" "fBodyAcc-bandsEnergy()-17,24.1-Average"
"322" "fBodyAcc-bandsEnergy()-25,32.1-Average"
"323" "fBodyAcc-bandsEnergy()-33,40.1-Average"
"324" "fBodyAcc-bandsEnergy()-41,48.1-Average"
"325" "fBodyAcc-bandsEnergy()-49,56.1-Average"
"326" "fBodyAcc-bandsEnergy()-57,64.1-Average"
"327" "fBodyAcc-bandsEnergy()-1,16.1-Average"
"328" "fBodyAcc-bandsEnergy()-17,32.1-Average"
"329" "fBodyAcc-bandsEnergy()-33,48.1-Average"
"330" "fBodyAcc-bandsEnergy()-49,64.1-Average"
"331" "fBodyAcc-bandsEnergy()-1,24.1-Average"
"332" "fBodyAcc-bandsEnergy()-25,48.1-Average"
"333" "fBodyAcc-bandsEnergy()-1,8.2-Average"
"334" "fBodyAcc-bandsEnergy()-9,16.2-Average"
"335" "fBodyAcc-bandsEnergy()-17,24.2-Average"
"336" "fBodyAcc-bandsEnergy()-25,32.2-Average"
"337" "fBodyAcc-bandsEnergy()-33,40.2-Average"
"338" "fBodyAcc-bandsEnergy()-41,48.2-Average"
"339" "fBodyAcc-bandsEnergy()-49,56.2-Average"
"340" "fBodyAcc-bandsEnergy()-57,64.2-Average"
"341" "fBodyAcc-bandsEnergy()-1,16.2-Average"
"342" "fBodyAcc-bandsEnergy()-17,32.2-Average"
"343" "fBodyAcc-bandsEnergy()-33,48.2-Average"
"344" "fBodyAcc-bandsEnergy()-49,64.2-Average"
"345" "fBodyAcc-bandsEnergy()-1,24.2-Average"
"346" "fBodyAcc-bandsEnergy()-25,48.2-Average"
"347" "fBodyAccJerk-mean()-X-Average"
"348" "fBodyAccJerk-mean()-Y-Average"
"349" "fBodyAccJerk-mean()-Z-Average"
"350" "fBodyAccJerk-std()-X-Average"
"351" "fBodyAccJerk-std()-Y-Average"
"352" "fBodyAccJerk-std()-Z-Average"
"353" "fBodyAccJerk-mad()-X-Average"
"354" "fBodyAccJerk-mad()-Y-Average"
"355" "fBodyAccJerk-mad()-Z-Average"
"356" "fBodyAccJerk-max()-X-Average"
"357" "fBodyAccJerk-max()-Y-Average"
"358" "fBodyAccJerk-max()-Z-Average"
"359" "fBodyAccJerk-min()-X-Average"
"360" "fBodyAccJerk-min()-Y-Average"
"361" "fBodyAccJerk-min()-Z-Average"
"362" "fBodyAccJerk-sma()-Average"
"363" "fBodyAccJerk-energy()-X-Average"
"364" "fBodyAccJerk-energy()-Y-Average"
"365" "fBodyAccJerk-energy()-Z-Average"
"366" "fBodyAccJerk-iqr()-X-Average"
"367" "fBodyAccJerk-iqr()-Y-Average"
"368" "fBodyAccJerk-iqr()-Z-Average"
"369" "fBodyAccJerk-entropy()-X-Average"
"370" "fBodyAccJerk-entropy()-Y-Average"
"371" "fBodyAccJerk-entropy()-Z-Average"
"372" "fBodyAccJerk-maxInds-X-Average"
"373" "fBodyAccJerk-maxInds-Y-Average"
"374" "fBodyAccJerk-maxInds-Z-Average"
"375" "fBodyAccJerk-meanFreq()-X-Average"
"376" "fBodyAccJerk-meanFreq()-Y-Average"
"377" "fBodyAccJerk-meanFreq()-Z-Average"
"378" "fBodyAccJerk-skewness()-X-Average"
"379" "fBodyAccJerk-kurtosis()-X-Average"
"380" "fBodyAccJerk-skewness()-Y-Average"
"381" "fBodyAccJerk-kurtosis()-Y-Average"
"382" "fBodyAccJerk-skewness()-Z-Average"
"383" "fBodyAccJerk-kurtosis()-Z-Average"
"384" "fBodyAccJerk-bandsEnergy()-1,8-Average"
"385" "fBodyAccJerk-bandsEnergy()-9,16-Average"
"386" "fBodyAccJerk-bandsEnergy()-17,24-Average"
"387" "fBodyAccJerk-bandsEnergy()-25,32-Average"
"388" "fBodyAccJerk-bandsEnergy()-33,40-Average"
"389" "fBodyAccJerk-bandsEnergy()-41,48-Average"
"390" "fBodyAccJerk-bandsEnergy()-49,56-Average"
"391" "fBodyAccJerk-bandsEnergy()-57,64-Average"
"392" "fBodyAccJerk-bandsEnergy()-1,16-Average"
"393" "fBodyAccJerk-bandsEnergy()-17,32-Average"
"394" "fBodyAccJerk-bandsEnergy()-33,48-Average"
"395" "fBodyAccJerk-bandsEnergy()-49,64-Average"
"396" "fBodyAccJerk-bandsEnergy()-1,24-Average"
"397" "fBodyAccJerk-bandsEnergy()-25,48-Average"
"398" "fBodyAccJerk-bandsEnergy()-1,8.1-Average"
"399" "fBodyAccJerk-bandsEnergy()-9,16.1-Average"
"400" "fBodyAccJerk-bandsEnergy()-17,24.1-Average"
"401" "fBodyAccJerk-bandsEnergy()-25,32.1-Average"
"402" "fBodyAccJerk-bandsEnergy()-33,40.1-Average"
"403" "fBodyAccJerk-bandsEnergy()-41,48.1-Average"
"404" "fBodyAccJerk-bandsEnergy()-49,56.1-Average"
"405" "fBodyAccJerk-bandsEnergy()-57,64.1-Average"
"406" "fBodyAccJerk-bandsEnergy()-1,16.1-Average"
"407" "fBodyAccJerk-bandsEnergy()-17,32.1-Average"
"408" "fBodyAccJerk-bandsEnergy()-33,48.1-Average"
"409" "fBodyAccJerk-bandsEnergy()-49,64.1-Average"
"410" "fBodyAccJerk-bandsEnergy()-1,24.1-Average"
"411" "fBodyAccJerk-bandsEnergy()-25,48.1-Average"
"412" "fBodyAccJerk-bandsEnergy()-1,8.2-Average"
"413" "fBodyAccJerk-bandsEnergy()-9,16.2-Average"
"414" "fBodyAccJerk-bandsEnergy()-17,24.2-Average"
"415" "fBodyAccJerk-bandsEnergy()-25,32.2-Average"
"416" "fBodyAccJerk-bandsEnergy()-33,40.2-Average"
"417" "fBodyAccJerk-bandsEnergy()-41,48.2-Average"
"418" "fBodyAccJerk-bandsEnergy()-49,56.2-Average"
"419" "fBodyAccJerk-bandsEnergy()-57,64.2-Average"
"420" "fBodyAccJerk-bandsEnergy()-1,16.2-Average"
"421" "fBodyAccJerk-bandsEnergy()-17,32.2-Average"
"422" "fBodyAccJerk-bandsEnergy()-33,48.2-Average"
"423" "fBodyAccJerk-bandsEnergy()-49,64.2-Average"
"424" "fBodyAccJerk-bandsEnergy()-1,24.2-Average"
"425" "fBodyAccJerk-bandsEnergy()-25,48.2-Average"
"426" "fBodyGyro-mean()-X-Average"
"427" "fBodyGyro-mean()-Y-Average"
"428" "fBodyGyro-mean()-Z-Average"
"429" "fBodyGyro-std()-X-Average"
"430" "fBodyGyro-std()-Y-Average"
"431" "fBodyGyro-std()-Z-Average"
"432" "fBodyGyro-mad()-X-Average"
"433" "fBodyGyro-mad()-Y-Average"
"434" "fBodyGyro-mad()-Z-Average"
"435" "fBodyGyro-max()-X-Average"
"436" "fBodyGyro-max()-Y-Average"
"437" "fBodyGyro-max()-Z-Average"
"438" "fBodyGyro-min()-X-Average"
"439" "fBodyGyro-min()-Y-Average"
"440" "fBodyGyro-min()-Z-Average"
"441" "fBodyGyro-sma()-Average"
"442" "fBodyGyro-energy()-X-Average"
"443" "fBodyGyro-energy()-Y-Average"
"444" "fBodyGyro-energy()-Z-Average"
"445" "fBodyGyro-iqr()-X-Average"
"446" "fBodyGyro-iqr()-Y-Average"
"447" "fBodyGyro-iqr()-Z-Average"
"448" "fBodyGyro-entropy()-X-Average"
"449" "fBodyGyro-entropy()-Y-Average"
"450" "fBodyGyro-entropy()-Z-Average"
"451" "fBodyGyro-maxInds-X-Average"
"452" "fBodyGyro-maxInds-Y-Average"
"453" "fBodyGyro-maxInds-Z-Average"
"454" "fBodyGyro-meanFreq()-X-Average"
"455" "fBodyGyro-meanFreq()-Y-Average"
"456" "fBodyGyro-meanFreq()-Z-Average"
"457" "fBodyGyro-skewness()-X-Average"
"458" "fBodyGyro-kurtosis()-X-Average"
"459" "fBodyGyro-skewness()-Y-Average"
"460" "fBodyGyro-kurtosis()-Y-Average"
"461" "fBodyGyro-skewness()-Z-Average"
"462" "fBodyGyro-kurtosis()-Z-Average"
"463" "fBodyGyro-bandsEnergy()-1,8-Average"
"464" "fBodyGyro-bandsEnergy()-9,16-Average"
"465" "fBodyGyro-bandsEnergy()-17,24-Average"
"466" "fBodyGyro-bandsEnergy()-25,32-Average"
"467" "fBodyGyro-bandsEnergy()-33,40-Average"
"468" "fBodyGyro-bandsEnergy()-41,48-Average"
"469" "fBodyGyro-bandsEnergy()-49,56-Average"
"470" "fBodyGyro-bandsEnergy()-57,64-Average"
"471" "fBodyGyro-bandsEnergy()-1,16-Average"
"472" "fBodyGyro-bandsEnergy()-17,32-Average"
"473" "fBodyGyro-bandsEnergy()-33,48-Average"
"474" "fBodyGyro-bandsEnergy()-49,64-Average"
"475" "fBodyGyro-bandsEnergy()-1,24-Average"
"476" "fBodyGyro-bandsEnergy()-25,48-Average"
"477" "fBodyGyro-bandsEnergy()-1,8.1-Average"
"478" "fBodyGyro-bandsEnergy()-9,16.1-Average"
"479" "fBodyGyro-bandsEnergy()-17,24.1-Average"
"480" "fBodyGyro-bandsEnergy()-25,32.1-Average"
"481" "fBodyGyro-bandsEnergy()-33,40.1-Average"
"482" "fBodyGyro-bandsEnergy()-41,48.1-Average"
"483" "fBodyGyro-bandsEnergy()-49,56.1-Average"
"484" "fBodyGyro-bandsEnergy()-57,64.1-Average"
"485" "fBodyGyro-bandsEnergy()-1,16.1-Average"
"486" "fBodyGyro-bandsEnergy()-17,32.1-Average"
"487" "fBodyGyro-bandsEnergy()-33,48.1-Average"
"488" "fBodyGyro-bandsEnergy()-49,64.1-Average"
"489" "fBodyGyro-bandsEnergy()-1,24.1-Average"
"490" "fBodyGyro-bandsEnergy()-25,48.1-Average"
"491" "fBodyGyro-bandsEnergy()-1,8.2-Average"
"492" "fBodyGyro-bandsEnergy()-9,16.2-Average"
"493" "fBodyGyro-bandsEnergy()-17,24.2-Average"
"494" "fBodyGyro-bandsEnergy()-25,32.2-Average"
"495" "fBodyGyro-bandsEnergy()-33,40.2-Average"
"496" "fBodyGyro-bandsEnergy()-41,48.2-Average"
"497" "fBodyGyro-bandsEnergy()-49,56.2-Average"
"498" "fBodyGyro-bandsEnergy()-57,64.2-Average"
"499" "fBodyGyro-bandsEnergy()-1,16.2-Average"
"500" "fBodyGyro-bandsEnergy()-17,32.2-Average"
"501" "fBodyGyro-bandsEnergy()-33,48.2-Average"
"502" "fBodyGyro-bandsEnergy()-49,64.2-Average"
"503" "fBodyGyro-bandsEnergy()-1,24.2-Average"
"504" "fBodyGyro-bandsEnergy()-25,48.2-Average"
"505" "fBodyAccMag-mean()-Average"
"506" "fBodyAccMag-std()-Average"
"507" "fBodyAccMag-mad()-Average"
"508" "fBodyAccMag-max()-Average"
"509" "fBodyAccMag-min()-Average"
"510" "fBodyAccMag-sma()-Average"
"511" "fBodyAccMag-energy()-Average"
"512" "fBodyAccMag-iqr()-Average"
"513" "fBodyAccMag-entropy()-Average"
"514" "fBodyAccMag-maxInds-Average"
"515" "fBodyAccMag-meanFreq()-Average"
"516" "fBodyAccMag-skewness()-Average"
"517" "fBodyAccMag-kurtosis()-Average"
"518" "fBodyBodyAccJerkMag-mean()-Average"
"519" "fBodyBodyAccJerkMag-std()-Average"
"520" "fBodyBodyAccJerkMag-mad()-Average"
"521" "fBodyBodyAccJerkMag-max()-Average"
"522" "fBodyBodyAccJerkMag-min()-Average"
"523" "fBodyBodyAccJerkMag-sma()-Average"
"524" "fBodyBodyAccJerkMag-energy()-Average"
"525" "fBodyBodyAccJerkMag-iqr()-Average"
"526" "fBodyBodyAccJerkMag-entropy()-Average"
"527" "fBodyBodyAccJerkMag-maxInds-Average"
"528" "fBodyBodyAccJerkMag-meanFreq()-Average"
"529" "fBodyBodyAccJerkMag-skewness()-Average"
"530" "fBodyBodyAccJerkMag-kurtosis()-Average"
"531" "fBodyBodyGyroMag-mean()-Average"
"532" "fBodyBodyGyroMag-std()-Average"
"533" "fBodyBodyGyroMag-mad()-Average"
"534" "fBodyBodyGyroMag-max()-Average"
"535" "fBodyBodyGyroMag-min()-Average"
"536" "fBodyBodyGyroMag-sma()-Average"
"537" "fBodyBodyGyroMag-energy()-Average"
"538" "fBodyBodyGyroMag-iqr()-Average"
"539" "fBodyBodyGyroMag-entropy()-Average"
"540" "fBodyBodyGyroMag-maxInds-Average"
"541" "fBodyBodyGyroMag-meanFreq()-Average"
"542" "fBodyBodyGyroMag-skewness()-Average"
"543" "fBodyBodyGyroMag-kurtosis()-Average"
"544" "fBodyBodyGyroJerkMag-mean()-Average"
"545" "fBodyBodyGyroJerkMag-std()-Average"
"546" "fBodyBodyGyroJerkMag-mad()-Average"
"547" "fBodyBodyGyroJerkMag-max()-Average"
"548" "fBodyBodyGyroJerkMag-min()-Average"
"549" "fBodyBodyGyroJerkMag-sma()-Average"
"550" "fBodyBodyGyroJerkMag-energy()-Average"
"551" "fBodyBodyGyroJerkMag-iqr()-Average"
"552" "fBodyBodyGyroJerkMag-entropy()-Average"
"553" "fBodyBodyGyroJerkMag-maxInds-Average"
"554" "fBodyBodyGyroJerkMag-meanFreq()-Average"
"555" "fBodyBodyGyroJerkMag-skewness()-Average"
"556" "fBodyBodyGyroJerkMag-kurtosis()-Average"
"557" "angle(tBodyAccMean,gravity)-Average"
"558" "angle(tBodyAccJerkMean),gravityMean)-Average"
"559" "angle(tBodyGyroMean,gravityMean)-Average"
"560" "angle(tBodyGyroJerkMean,gravityMean)-Average"
"561" "angle(X,gravityMean)-Average"
"562" "angle(Y,gravityMean)-Average"
"563" "angle(Z,gravityMean)-Average"

####Notes on variables
Read the features_info.txt file for all information concerning the variables from which the average was calculated
 
##Sources
This Cookbook was created using the template by Joris Schut at the following link: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41 
