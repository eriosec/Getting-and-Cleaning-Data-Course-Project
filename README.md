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


 
## Study Design and Data Processing

The information for this section was compiled from the original README.txt and features_info.txt files that were in the downloaded zipped files from the project site specified under the Collection of Raw Data section below:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
	
FEATURE SELECTION:
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
 
 
##Notes on the original (raw) data:

The information in this section came from the original README.txt file we were provided these notes on the raw data:

======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



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

51. Rename the measurment columns to full descriptions and append the word "average" to reflect that they now hold the averages of all the measurments taken per activity performed per subject 

NOTE: In order to do this step, I looked at the names of of the "tidymeans" data frame and also looked at the "features_info.txt" file to figure out how to make the names descriptive. I decided to accomplish this by doing the following:

a. Replacing the upper case X, Y and Z entries in each variable name with "xaxis","yaxis" and "zaxis" respectively

b. Making all variables lower case

c. Getting rid of any commas next to the word "gravitymean"

d. Getting rid of all hyphens "-"

e. Getting rid of all open "(" and close ")" parenthesis

f. Replacing the commas that were left with the word "to" since it seemed to apply to those variables

g. Getting rid of all the periods "." in the variable names

h. Replacing the word "fbody" with "frequencybody"

i. Replacing the word "tbody" with "timebody"

j. Replacing the word "tgravity" with "timegravity"

k. Replaccing the string "acc" with the full word "acceleration"

l. Replacing the string "std" with the full concatenated string "standarddeviation"

m. Replacing the string "mad" with the full concatenated string "medianabsolutedeviation"

n. Replacing the string "sma" with the full concatenated string "signalmagnitudearea"

o. Replacing the string "iqr" with the full concatenated string "interquartilerange"

p. Replacing the string "arcoeff" with the full concatenated string "autoregressioncoefficient"

q. Replacing the string "inds" with the word "index"

r.  Replacing the string "mag" with the word "magnitude"

s.  Replacing the string "meanfreq" with the full concatenated string "meanfrequency"

t.  Replacing the string "max" with the word "maximum"

u.  Replacing the string "min" with the word "minimum"



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

For the rest of the variables, all values are numeric and unique to that variable and units can be inferred from the original README.txt and fatures_info.txt files although they were not specifically given. The features_info.txt file gives the details of the different variables calculated from the raw data from the Accelerometer and Gyro plus the rest of the calculations derived from the raw data that can be found in the "Inertial Signals" directories. 

The tidy data contains as stated in the project requirements, requirement #5, "the average of each variable for each activity and each subject", thus each value represents the average value for each original variable for each subject and activity. Each column has thus been renamed with the suffix of "average" and the original variables names have been extended to full descriptive names making use of the descriptions in the "features_info.txt" file.



"3" "timebodyaccelerationmeanxaxisaverage"
"4" "timebodyaccelerationmeanyaxisaverage"
"5" "timebodyaccelerationmeanzaxisaverage"
"6" "timebodyaccelerationstandarddeviationxaxisaverage"
"7" "timebodyaccelerationstandarddeviationyaxisaverage"
"8" "timebodyaccelerationstandarddeviationzaxisaverage"
"9" "timebodyaccelerationmediagabsolutedeviationxaxisaverage"
"10" "timebodyaccelerationmediagabsolutedeviationyaxisaverage"
"11" "timebodyaccelerationmediagabsolutedeviationzaxisaverage"
"12" "timebodyaccelerationmaximumxaxisaverage"
"13" "timebodyaccelerationmaximumyaxisaverage"
"14" "timebodyaccelerationmaximumzaxisaverage"
"15" "timebodyaccelerationminimumxaxisaverage"
"16" "timebodyaccelerationminimumyaxisaverage"
"17" "timebodyaccelerationminimumzaxisaverage"
"18" "timebodyaccelerationsignalmagnitudenitudeareaaverage"
"19" "timebodyaccelerationenergyxaxisaverage"
"20" "timebodyaccelerationenergyyaxisaverage"
"21" "timebodyaccelerationenergyzaxisaverage"
"22" "timebodyaccelerationinterquartilerangexaxisaverage"
"23" "timebodyaccelerationinterquartilerangeyaxisaverage"
"24" "timebodyaccelerationinterquartilerangezaxisaverage"
"25" "timebodyaccelerationentropyxaxisaverage"
"26" "timebodyaccelerationentropyyaxisaverage"
"27" "timebodyaccelerationentropyzaxisaverage"
"28" "timebodyaccelerationautoregressioncoefficientxaxisto1average"
"29" "timebodyaccelerationautoregressioncoefficientxaxisto2average"
"30" "timebodyaccelerationautoregressioncoefficientxaxisto3average"
"31" "timebodyaccelerationautoregressioncoefficientxaxisto4average"
"32" "timebodyaccelerationautoregressioncoefficientyaxisto1average"
"33" "timebodyaccelerationautoregressioncoefficientyaxisto2average"
"34" "timebodyaccelerationautoregressioncoefficientyaxisto3average"
"35" "timebodyaccelerationautoregressioncoefficientyaxisto4average"
"36" "timebodyaccelerationautoregressioncoefficientzaxisto1average"
"37" "timebodyaccelerationautoregressioncoefficientzaxisto2average"
"38" "timebodyaccelerationautoregressioncoefficientzaxisto3average"
"39" "timebodyaccelerationautoregressioncoefficientzaxisto4average"
"40" "timebodyaccelerationcorrelationxaxistoyaxisaverage"
"41" "timebodyaccelerationcorrelationxaxistozaxisaverage"
"42" "timebodyaccelerationcorrelationyaxistozaxisaverage"
"43" "timegravityaccelerationmeanxaxisaverage"
"44" "timegravityaccelerationmeanyaxisaverage"
"45" "timegravityaccelerationmeanzaxisaverage"
"46" "timegravityaccelerationstandarddeviationxaxisaverage"
"47" "timegravityaccelerationstandarddeviationyaxisaverage"
"48" "timegravityaccelerationstandarddeviationzaxisaverage"
"49" "timegravityaccelerationmediagabsolutedeviationxaxisaverage"
"50" "timegravityaccelerationmediagabsolutedeviationyaxisaverage"
"51" "timegravityaccelerationmediagabsolutedeviationzaxisaverage"
"52" "timegravityaccelerationmaximumxaxisaverage"
"53" "timegravityaccelerationmaximumyaxisaverage"
"54" "timegravityaccelerationmaximumzaxisaverage"
"55" "timegravityaccelerationminimumxaxisaverage"
"56" "timegravityaccelerationminimumyaxisaverage"
"57" "timegravityaccelerationminimumzaxisaverage"
"58" "timegravityaccelerationsignalmagnitudenitudeareaaverage"
"59" "timegravityaccelerationenergyxaxisaverage"
"60" "timegravityaccelerationenergyyaxisaverage"
"61" "timegravityaccelerationenergyzaxisaverage"
"62" "timegravityaccelerationinterquartilerangexaxisaverage"
"63" "timegravityaccelerationinterquartilerangeyaxisaverage"
"64" "timegravityaccelerationinterquartilerangezaxisaverage"
"65" "timegravityaccelerationentropyxaxisaverage"
"66" "timegravityaccelerationentropyyaxisaverage"
"67" "timegravityaccelerationentropyzaxisaverage"
"68" "timegravityaccelerationautoregressioncoefficientxaxisto1average"
"69" "timegravityaccelerationautoregressioncoefficientxaxisto2average"
"70" "timegravityaccelerationautoregressioncoefficientxaxisto3average"
"71" "timegravityaccelerationautoregressioncoefficientxaxisto4average"
"72" "timegravityaccelerationautoregressioncoefficientyaxisto1average"
"73" "timegravityaccelerationautoregressioncoefficientyaxisto2average"
"74" "timegravityaccelerationautoregressioncoefficientyaxisto3average"
"75" "timegravityaccelerationautoregressioncoefficientyaxisto4average"
"76" "timegravityaccelerationautoregressioncoefficientzaxisto1average"
"77" "timegravityaccelerationautoregressioncoefficientzaxisto2average"
"78" "timegravityaccelerationautoregressioncoefficientzaxisto3average"
"79" "timegravityaccelerationautoregressioncoefficientzaxisto4average"
"80" "timegravityaccelerationcorrelationxaxistoyaxisaverage"
"81" "timegravityaccelerationcorrelationxaxistozaxisaverage"
"82" "timegravityaccelerationcorrelationyaxistozaxisaverage"
"83" "timebodyaccelerationjerkmeanxaxisaverage"
"84" "timebodyaccelerationjerkmeanyaxisaverage"
"85" "timebodyaccelerationjerkmeanzaxisaverage"
"86" "timebodyaccelerationjerkstandarddeviationxaxisaverage"
"87" "timebodyaccelerationjerkstandarddeviationyaxisaverage"
"88" "timebodyaccelerationjerkstandarddeviationzaxisaverage"
"89" "timebodyaccelerationjerkmediagabsolutedeviationxaxisaverage"
"90" "timebodyaccelerationjerkmediagabsolutedeviationyaxisaverage"
"91" "timebodyaccelerationjerkmediagabsolutedeviationzaxisaverage"
"92" "timebodyaccelerationjerkmaximumxaxisaverage"
"93" "timebodyaccelerationjerkmaximumyaxisaverage"
"94" "timebodyaccelerationjerkmaximumzaxisaverage"
"95" "timebodyaccelerationjerkminimumxaxisaverage"
"96" "timebodyaccelerationjerkminimumyaxisaverage"
"97" "timebodyaccelerationjerkminimumzaxisaverage"
"98" "timebodyaccelerationjerksignalmagnitudenitudeareaaverage"
"99" "timebodyaccelerationjerkenergyxaxisaverage"
"100" "timebodyaccelerationjerkenergyyaxisaverage"
"101" "timebodyaccelerationjerkenergyzaxisaverage"
"102" "timebodyaccelerationjerkinterquartilerangexaxisaverage"
"103" "timebodyaccelerationjerkinterquartilerangeyaxisaverage"
"104" "timebodyaccelerationjerkinterquartilerangezaxisaverage"
"105" "timebodyaccelerationjerkentropyxaxisaverage"
"106" "timebodyaccelerationjerkentropyyaxisaverage"
"107" "timebodyaccelerationjerkentropyzaxisaverage"
"108" "timebodyaccelerationjerkautoregressioncoefficientxaxisto1average"
"109" "timebodyaccelerationjerkautoregressioncoefficientxaxisto2average"
"110" "timebodyaccelerationjerkautoregressioncoefficientxaxisto3average"
"111" "timebodyaccelerationjerkautoregressioncoefficientxaxisto4average"
"112" "timebodyaccelerationjerkautoregressioncoefficientyaxisto1average"
"113" "timebodyaccelerationjerkautoregressioncoefficientyaxisto2average"
"114" "timebodyaccelerationjerkautoregressioncoefficientyaxisto3average"
"115" "timebodyaccelerationjerkautoregressioncoefficientyaxisto4average"
"116" "timebodyaccelerationjerkautoregressioncoefficientzaxisto1average"
"117" "timebodyaccelerationjerkautoregressioncoefficientzaxisto2average"
"118" "timebodyaccelerationjerkautoregressioncoefficientzaxisto3average"
"119" "timebodyaccelerationjerkautoregressioncoefficientzaxisto4average"
"120" "timebodyaccelerationjerkcorrelationxaxistoyaxisaverage"
"121" "timebodyaccelerationjerkcorrelationxaxistozaxisaverage"
"122" "timebodyaccelerationjerkcorrelationyaxistozaxisaverage"
"123" "timebodygyromeanxaxisaverage"
"124" "timebodygyromeanyaxisaverage"
"125" "timebodygyromeanzaxisaverage"
"126" "timebodygyrostandarddeviationxaxisaverage"
"127" "timebodygyrostandarddeviationyaxisaverage"
"128" "timebodygyrostandarddeviationzaxisaverage"
"129" "timebodygyromediagabsolutedeviationxaxisaverage"
"130" "timebodygyromediagabsolutedeviationyaxisaverage"
"131" "timebodygyromediagabsolutedeviationzaxisaverage"
"132" "timebodygyromaximumxaxisaverage"
"133" "timebodygyromaximumyaxisaverage"
"134" "timebodygyromaximumzaxisaverage"
"135" "timebodygyrominimumxaxisaverage"
"136" "timebodygyrominimumyaxisaverage"
"137" "timebodygyrominimumzaxisaverage"
"138" "timebodygyrosignalmagnitudenitudeareaaverage"
"139" "timebodygyroenergyxaxisaverage"
"140" "timebodygyroenergyyaxisaverage"
"141" "timebodygyroenergyzaxisaverage"
"142" "timebodygyrointerquartilerangexaxisaverage"
"143" "timebodygyrointerquartilerangeyaxisaverage"
"144" "timebodygyrointerquartilerangezaxisaverage"
"145" "timebodygyroentropyxaxisaverage"
"146" "timebodygyroentropyyaxisaverage"
"147" "timebodygyroentropyzaxisaverage"
"148" "timebodygyroautoregressioncoefficientxaxisto1average"
"149" "timebodygyroautoregressioncoefficientxaxisto2average"
"150" "timebodygyroautoregressioncoefficientxaxisto3average"
"151" "timebodygyroautoregressioncoefficientxaxisto4average"
"152" "timebodygyroautoregressioncoefficientyaxisto1average"
"153" "timebodygyroautoregressioncoefficientyaxisto2average"
"154" "timebodygyroautoregressioncoefficientyaxisto3average"
"155" "timebodygyroautoregressioncoefficientyaxisto4average"
"156" "timebodygyroautoregressioncoefficientzaxisto1average"
"157" "timebodygyroautoregressioncoefficientzaxisto2average"
"158" "timebodygyroautoregressioncoefficientzaxisto3average"
"159" "timebodygyroautoregressioncoefficientzaxisto4average"
"160" "timebodygyrocorrelationxaxistoyaxisaverage"
"161" "timebodygyrocorrelationxaxistozaxisaverage"
"162" "timebodygyrocorrelationyaxistozaxisaverage"
"163" "timebodygyrojerkmeanxaxisaverage"
"164" "timebodygyrojerkmeanyaxisaverage"
"165" "timebodygyrojerkmeanzaxisaverage"
"166" "timebodygyrojerkstandarddeviationxaxisaverage"
"167" "timebodygyrojerkstandarddeviationyaxisaverage"
"168" "timebodygyrojerkstandarddeviationzaxisaverage"
"169" "timebodygyrojerkmediagabsolutedeviationxaxisaverage"
"170" "timebodygyrojerkmediagabsolutedeviationyaxisaverage"
"171" "timebodygyrojerkmediagabsolutedeviationzaxisaverage"
"172" "timebodygyrojerkmaximumxaxisaverage"
"173" "timebodygyrojerkmaximumyaxisaverage"
"174" "timebodygyrojerkmaximumzaxisaverage"
"175" "timebodygyrojerkminimumxaxisaverage"
"176" "timebodygyrojerkminimumyaxisaverage"
"177" "timebodygyrojerkminimumzaxisaverage"
"178" "timebodygyrojerksignalmagnitudenitudeareaaverage"
"179" "timebodygyrojerkenergyxaxisaverage"
"180" "timebodygyrojerkenergyyaxisaverage"
"181" "timebodygyrojerkenergyzaxisaverage"
"182" "timebodygyrojerkinterquartilerangexaxisaverage"
"183" "timebodygyrojerkinterquartilerangeyaxisaverage"
"184" "timebodygyrojerkinterquartilerangezaxisaverage"
"185" "timebodygyrojerkentropyxaxisaverage"
"186" "timebodygyrojerkentropyyaxisaverage"
"187" "timebodygyrojerkentropyzaxisaverage"
"188" "timebodygyrojerkautoregressioncoefficientxaxisto1average"
"189" "timebodygyrojerkautoregressioncoefficientxaxisto2average"
"190" "timebodygyrojerkautoregressioncoefficientxaxisto3average"
"191" "timebodygyrojerkautoregressioncoefficientxaxisto4average"
"192" "timebodygyrojerkautoregressioncoefficientyaxisto1average"
"193" "timebodygyrojerkautoregressioncoefficientyaxisto2average"
"194" "timebodygyrojerkautoregressioncoefficientyaxisto3average"
"195" "timebodygyrojerkautoregressioncoefficientyaxisto4average"
"196" "timebodygyrojerkautoregressioncoefficientzaxisto1average"
"197" "timebodygyrojerkautoregressioncoefficientzaxisto2average"
"198" "timebodygyrojerkautoregressioncoefficientzaxisto3average"
"199" "timebodygyrojerkautoregressioncoefficientzaxisto4average"
"200" "timebodygyrojerkcorrelationxaxistoyaxisaverage"
"201" "timebodygyrojerkcorrelationxaxistozaxisaverage"
"202" "timebodygyrojerkcorrelationyaxistozaxisaverage"
"203" "timebodyaccelerationmagnitudemeanaverage"
"204" "timebodyaccelerationmagnitudestandarddeviationaverage"
"205" "timebodyaccelerationmagnitudemediagabsolutedeviationaverage"
"206" "timebodyaccelerationmagnitudemaximumaverage"
"207" "timebodyaccelerationmagnitudeminimumaverage"
"208" "timebodyaccelerationmagnitudesignalmagnitudeareaaverage"
"209" "timebodyaccelerationmagnitudeenergyaverage"
"210" "timebodyaccelerationmagnitudeinterquartilerangeaverage"
"211" "timebodyaccelerationmagnitudeentropyaverage"
"212" "timebodyaccelerationmagnitudeautoregressioncoefficient1average"
"213" "timebodyaccelerationmagnitudeautoregressioncoefficient2average"
"214" "timebodyaccelerationmagnitudeautoregressioncoefficient3average"
"215" "timebodyaccelerationmagnitudeautoregressioncoefficient4average"
"216" "timegravityaccelerationmagnitudemeanaverage"
"217" "timegravityaccelerationmagnitudestandarddeviationaverage"
"218" "timegravityaccelerationmagnitudemediagabsolutedeviationaverage"
"219" "timegravityaccelerationmagnitudemaximumaverage"
"220" "timegravityaccelerationmagnitudeminimumaverage"
"221" "timegravityaccelerationmagnitudesignalmagnitudeareaaverage"
"222" "timegravityaccelerationmagnitudeenergyaverage"
"223" "timegravityaccelerationmagnitudeinterquartilerangeaverage"
"224" "timegravityaccelerationmagnitudeentropyaverage"
"225" "timegravityaccelerationmagnitudeautoregressioncoefficient1average"
"226" "timegravityaccelerationmagnitudeautoregressioncoefficient2average"
"227" "timegravityaccelerationmagnitudeautoregressioncoefficient3average"
"228" "timegravityaccelerationmagnitudeautoregressioncoefficient4average"
"229" "timebodyaccelerationjerkmagnitudemeanaverage"
"230" "timebodyaccelerationjerkmagnitudestandarddeviationaverage"
"231" "timebodyaccelerationjerkmagnitudemediagabsolutedeviationaverage"
"232" "timebodyaccelerationjerkmagnitudemaximumaverage"
"233" "timebodyaccelerationjerkmagnitudeminimumaverage"
"234" "timebodyaccelerationjerkmagnitudesignalmagnitudeareaaverage"
"235" "timebodyaccelerationjerkmagnitudeenergyaverage"
"236" "timebodyaccelerationjerkmagnitudeinterquartilerangeaverage"
"237" "timebodyaccelerationjerkmagnitudeentropyaverage"
"238" "timebodyaccelerationjerkmagnitudeautoregressioncoefficient1average"
"239" "timebodyaccelerationjerkmagnitudeautoregressioncoefficient2average"
"240" "timebodyaccelerationjerkmagnitudeautoregressioncoefficient3average"
"241" "timebodyaccelerationjerkmagnitudeautoregressioncoefficient4average"
"242" "timebodygyromagnitudemeanaverage"
"243" "timebodygyromagnitudestandarddeviationaverage"
"244" "timebodygyromagnitudemediagabsolutedeviationaverage"
"245" "timebodygyromagnitudemaximumaverage"
"246" "timebodygyromagnitudeminimumaverage"
"247" "timebodygyromagnitudesignalmagnitudeareaaverage"
"248" "timebodygyromagnitudeenergyaverage"
"249" "timebodygyromagnitudeinterquartilerangeaverage"
"250" "timebodygyromagnitudeentropyaverage"
"251" "timebodygyromagnitudeautoregressioncoefficient1average"
"252" "timebodygyromagnitudeautoregressioncoefficient2average"
"253" "timebodygyromagnitudeautoregressioncoefficient3average"
"254" "timebodygyromagnitudeautoregressioncoefficient4average"
"255" "timebodygyrojerkmagnitudemeanaverage"
"256" "timebodygyrojerkmagnitudestandarddeviationaverage"
"257" "timebodygyrojerkmagnitudemediagabsolutedeviationaverage"
"258" "timebodygyrojerkmagnitudemaximumaverage"
"259" "timebodygyrojerkmagnitudeminimumaverage"
"260" "timebodygyrojerkmagnitudesignalmagnitudeareaaverage"
"261" "timebodygyrojerkmagnitudeenergyaverage"
"262" "timebodygyrojerkmagnitudeinterquartilerangeaverage"
"263" "timebodygyrojerkmagnitudeentropyaverage"
"264" "timebodygyrojerkmagnitudeautoregressioncoefficient1average"
"265" "timebodygyrojerkmagnitudeautoregressioncoefficient2average"
"266" "timebodygyrojerkmagnitudeautoregressioncoefficient3average"
"267" "timebodygyrojerkmagnitudeautoregressioncoefficient4average"
"268" "frequencybodyaccelerationmeanxaxisaverage"
"269" "frequencybodyaccelerationmeanyaxisaverage"
"270" "frequencybodyaccelerationmeanzaxisaverage"
"271" "frequencybodyaccelerationstandarddeviationxaxisaverage"
"272" "frequencybodyaccelerationstandarddeviationyaxisaverage"
"273" "frequencybodyaccelerationstandarddeviationzaxisaverage"
"274" "frequencybodyaccelerationmediagabsolutedeviationxaxisaverage"
"275" "frequencybodyaccelerationmediagabsolutedeviationyaxisaverage"
"276" "frequencybodyaccelerationmediagabsolutedeviationzaxisaverage"
"277" "frequencybodyaccelerationmaximumxaxisaverage"
"278" "frequencybodyaccelerationmaximumyaxisaverage"
"279" "frequencybodyaccelerationmaximumzaxisaverage"
"280" "frequencybodyaccelerationminimumxaxisaverage"
"281" "frequencybodyaccelerationminimumyaxisaverage"
"282" "frequencybodyaccelerationminimumzaxisaverage"
"283" "frequencybodyaccelerationsignalmagnitudenitudeareaaverage"
"284" "frequencybodyaccelerationenergyxaxisaverage"
"285" "frequencybodyaccelerationenergyyaxisaverage"
"286" "frequencybodyaccelerationenergyzaxisaverage"
"287" "frequencybodyaccelerationinterquartilerangexaxisaverage"
"288" "frequencybodyaccelerationinterquartilerangeyaxisaverage"
"289" "frequencybodyaccelerationinterquartilerangezaxisaverage"
"290" "frequencybodyaccelerationentropyxaxisaverage"
"291" "frequencybodyaccelerationentropyyaxisaverage"
"292" "frequencybodyaccelerationentropyzaxisaverage"
"293" "frequencybodyaccelerationmaximuminimumdexxaxisaverage"
"294" "frequencybodyaccelerationmaximuminimumdexyaxisaverage"
"295" "frequencybodyaccelerationmaximuminimumdexzaxisaverage"
"296" "frequencybodyaccelerationmeanfrequencyxaxisaverage"
"297" "frequencybodyaccelerationmeanfrequencyyaxisaverage"
"298" "frequencybodyaccelerationmeanfrequencyzaxisaverage"
"299" "frequencybodyaccelerationskewnessxaxisaverage"
"300" "frequencybodyaccelerationkurtosisxaxisaverage"
"301" "frequencybodyaccelerationskewnessyaxisaverage"
"302" "frequencybodyaccelerationkurtosisyaxisaverage"
"303" "frequencybodyaccelerationskewnesszaxisaverage"
"304" "frequencybodyaccelerationkurtosiszaxisaverage"
"305" "frequencybodyaccelerationbandsenergy1to8average"
"306" "frequencybodyaccelerationbandsenergy9to16average"
"307" "frequencybodyaccelerationbandsenergy17to24average"
"308" "frequencybodyaccelerationbandsenergy25to32average"
"309" "frequencybodyaccelerationbandsenergy33to40average"
"310" "frequencybodyaccelerationbandsenergy41to48average"
"311" "frequencybodyaccelerationbandsenergy49to56average"
"312" "frequencybodyaccelerationbandsenergy57to64average"
"313" "frequencybodyaccelerationbandsenergy1to16average"
"314" "frequencybodyaccelerationbandsenergy17to32average"
"315" "frequencybodyaccelerationbandsenergy33to48average"
"316" "frequencybodyaccelerationbandsenergy49to64average"
"317" "frequencybodyaccelerationbandsenergy1to24average"
"318" "frequencybodyaccelerationbandsenergy25to48average"
"319" "frequencybodyaccelerationbandsenergy1to8level1average"
"320" "frequencybodyaccelerationbandsenergy9to16level1average"
"321" "frequencybodyaccelerationbandsenergy17to24level1average"
"322" "frequencybodyaccelerationbandsenergy25to32level1average"
"323" "frequencybodyaccelerationbandsenergy33to40level1average"
"324" "frequencybodyaccelerationbandsenergy41to48level1average"
"325" "frequencybodyaccelerationbandsenergy49to56level1average"
"326" "frequencybodyaccelerationbandsenergy57to64level1average"
"327" "frequencybodyaccelerationbandsenergy1to16level1average"
"328" "frequencybodyaccelerationbandsenergy17to32level1average"
"329" "frequencybodyaccelerationbandsenergy33to48level1average"
"330" "frequencybodyaccelerationbandsenergy49to64level1average"
"331" "frequencybodyaccelerationbandsenergy1to24level1average"
"332" "frequencybodyaccelerationbandsenergy25to48level1average"
"333" "frequencybodyaccelerationbandsenergy1to8level2average"
"334" "frequencybodyaccelerationbandsenergy9to16level2average"
"335" "frequencybodyaccelerationbandsenergy17to24level2average"
"336" "frequencybodyaccelerationbandsenergy25to32level2average"
"337" "frequencybodyaccelerationbandsenergy33to40level2average"
"338" "frequencybodyaccelerationbandsenergy41to48level2average"
"339" "frequencybodyaccelerationbandsenergy49to56level2average"
"340" "frequencybodyaccelerationbandsenergy57to64level2average"
"341" "frequencybodyaccelerationbandsenergy1to16level2average"
"342" "frequencybodyaccelerationbandsenergy17to32level2average"
"343" "frequencybodyaccelerationbandsenergy33to48level2average"
"344" "frequencybodyaccelerationbandsenergy49to64level2average"
"345" "frequencybodyaccelerationbandsenergy1to24level2average"
"346" "frequencybodyaccelerationbandsenergy25to48level2average"
"347" "frequencybodyaccelerationjerkmeanxaxisaverage"
"348" "frequencybodyaccelerationjerkmeanyaxisaverage"
"349" "frequencybodyaccelerationjerkmeanzaxisaverage"
"350" "frequencybodyaccelerationjerkstandarddeviationxaxisaverage"
"351" "frequencybodyaccelerationjerkstandarddeviationyaxisaverage"
"352" "frequencybodyaccelerationjerkstandarddeviationzaxisaverage"
"353" "frequencybodyaccelerationjerkmediagabsolutedeviationxaxisaverage"
"354" "frequencybodyaccelerationjerkmediagabsolutedeviationyaxisaverage"
"355" "frequencybodyaccelerationjerkmediagabsolutedeviationzaxisaverage"
"356" "frequencybodyaccelerationjerkmaximumxaxisaverage"
"357" "frequencybodyaccelerationjerkmaximumyaxisaverage"
"358" "frequencybodyaccelerationjerkmaximumzaxisaverage"
"359" "frequencybodyaccelerationjerkminimumxaxisaverage"
"360" "frequencybodyaccelerationjerkminimumyaxisaverage"
"361" "frequencybodyaccelerationjerkminimumzaxisaverage"
"362" "frequencybodyaccelerationjerksignalmagnitudenitudeareaaverage"
"363" "frequencybodyaccelerationjerkenergyxaxisaverage"
"364" "frequencybodyaccelerationjerkenergyyaxisaverage"
"365" "frequencybodyaccelerationjerkenergyzaxisaverage"
"366" "frequencybodyaccelerationjerkinterquartilerangexaxisaverage"
"367" "frequencybodyaccelerationjerkinterquartilerangeyaxisaverage"
"368" "frequencybodyaccelerationjerkinterquartilerangezaxisaverage"
"369" "frequencybodyaccelerationjerkentropyxaxisaverage"
"370" "frequencybodyaccelerationjerkentropyyaxisaverage"
"371" "frequencybodyaccelerationjerkentropyzaxisaverage"
"372" "frequencybodyaccelerationjerkmaximuminimumdexxaxisaverage"
"373" "frequencybodyaccelerationjerkmaximuminimumdexyaxisaverage"
"374" "frequencybodyaccelerationjerkmaximuminimumdexzaxisaverage"
"375" "frequencybodyaccelerationjerkmeanfrequencyxaxisaverage"
"376" "frequencybodyaccelerationjerkmeanfrequencyyaxisaverage"
"377" "frequencybodyaccelerationjerkmeanfrequencyzaxisaverage"
"378" "frequencybodyaccelerationjerkskewnessxaxisaverage"
"379" "frequencybodyaccelerationjerkkurtosisxaxisaverage"
"380" "frequencybodyaccelerationjerkskewnessyaxisaverage"
"381" "frequencybodyaccelerationjerkkurtosisyaxisaverage"
"382" "frequencybodyaccelerationjerkskewnesszaxisaverage"
"383" "frequencybodyaccelerationjerkkurtosiszaxisaverage"
"384" "frequencybodyaccelerationjerkbandsenergy1to8average"
"385" "frequencybodyaccelerationjerkbandsenergy9to16average"
"386" "frequencybodyaccelerationjerkbandsenergy17to24average"
"387" "frequencybodyaccelerationjerkbandsenergy25to32average"
"388" "frequencybodyaccelerationjerkbandsenergy33to40average"
"389" "frequencybodyaccelerationjerkbandsenergy41to48average"
"390" "frequencybodyaccelerationjerkbandsenergy49to56average"
"391" "frequencybodyaccelerationjerkbandsenergy57to64average"
"392" "frequencybodyaccelerationjerkbandsenergy1to16average"
"393" "frequencybodyaccelerationjerkbandsenergy17to32average"
"394" "frequencybodyaccelerationjerkbandsenergy33to48average"
"395" "frequencybodyaccelerationjerkbandsenergy49to64average"
"396" "frequencybodyaccelerationjerkbandsenergy1to24average"
"397" "frequencybodyaccelerationjerkbandsenergy25to48average"
"398" "frequencybodyaccelerationjerkbandsenergy1to8level1average"
"399" "frequencybodyaccelerationjerkbandsenergy9to16level1average"
"400" "frequencybodyaccelerationjerkbandsenergy17to24level1average"
"401" "frequencybodyaccelerationjerkbandsenergy25to32level1average"
"402" "frequencybodyaccelerationjerkbandsenergy33to40level1average"
"403" "frequencybodyaccelerationjerkbandsenergy41to48level1average"
"404" "frequencybodyaccelerationjerkbandsenergy49to56level1average"
"405" "frequencybodyaccelerationjerkbandsenergy57to64level1average"
"406" "frequencybodyaccelerationjerkbandsenergy1to16level1average"
"407" "frequencybodyaccelerationjerkbandsenergy17to32level1average"
"408" "frequencybodyaccelerationjerkbandsenergy33to48level1average"
"409" "frequencybodyaccelerationjerkbandsenergy49to64level1average"
"410" "frequencybodyaccelerationjerkbandsenergy1to24level1average"
"411" "frequencybodyaccelerationjerkbandsenergy25to48level1average"
"412" "frequencybodyaccelerationjerkbandsenergy1to8level2average"
"413" "frequencybodyaccelerationjerkbandsenergy9to16level2average"
"414" "frequencybodyaccelerationjerkbandsenergy17to24level2average"
"415" "frequencybodyaccelerationjerkbandsenergy25to32level2average"
"416" "frequencybodyaccelerationjerkbandsenergy33to40level2average"
"417" "frequencybodyaccelerationjerkbandsenergy41to48level2average"
"418" "frequencybodyaccelerationjerkbandsenergy49to56level2average"
"419" "frequencybodyaccelerationjerkbandsenergy57to64level2average"
"420" "frequencybodyaccelerationjerkbandsenergy1to16level2average"
"421" "frequencybodyaccelerationjerkbandsenergy17to32level2average"
"422" "frequencybodyaccelerationjerkbandsenergy33to48level2average"
"423" "frequencybodyaccelerationjerkbandsenergy49to64level2average"
"424" "frequencybodyaccelerationjerkbandsenergy1to24level2average"
"425" "frequencybodyaccelerationjerkbandsenergy25to48level2average"
"426" "frequencybodygyromeanxaxisaverage"
"427" "frequencybodygyromeanyaxisaverage"
"428" "frequencybodygyromeanzaxisaverage"
"429" "frequencybodygyrostandarddeviationxaxisaverage"
"430" "frequencybodygyrostandarddeviationyaxisaverage"
"431" "frequencybodygyrostandarddeviationzaxisaverage"
"432" "frequencybodygyromediagabsolutedeviationxaxisaverage"
"433" "frequencybodygyromediagabsolutedeviationyaxisaverage"
"434" "frequencybodygyromediagabsolutedeviationzaxisaverage"
"435" "frequencybodygyromaximumxaxisaverage"
"436" "frequencybodygyromaximumyaxisaverage"
"437" "frequencybodygyromaximumzaxisaverage"
"438" "frequencybodygyrominimumxaxisaverage"
"439" "frequencybodygyrominimumyaxisaverage"
"440" "frequencybodygyrominimumzaxisaverage"
"441" "frequencybodygyrosignalmagnitudenitudeareaaverage"
"442" "frequencybodygyroenergyxaxisaverage"
"443" "frequencybodygyroenergyyaxisaverage"
"444" "frequencybodygyroenergyzaxisaverage"
"445" "frequencybodygyrointerquartilerangexaxisaverage"
"446" "frequencybodygyrointerquartilerangeyaxisaverage"
"447" "frequencybodygyrointerquartilerangezaxisaverage"
"448" "frequencybodygyroentropyxaxisaverage"
"449" "frequencybodygyroentropyyaxisaverage"
"450" "frequencybodygyroentropyzaxisaverage"
"451" "frequencybodygyromaximuminimumdexxaxisaverage"
"452" "frequencybodygyromaximuminimumdexyaxisaverage"
"453" "frequencybodygyromaximuminimumdexzaxisaverage"
"454" "frequencybodygyromeanfrequencyxaxisaverage"
"455" "frequencybodygyromeanfrequencyyaxisaverage"
"456" "frequencybodygyromeanfrequencyzaxisaverage"
"457" "frequencybodygyroskewnessxaxisaverage"
"458" "frequencybodygyrokurtosisxaxisaverage"
"459" "frequencybodygyroskewnessyaxisaverage"
"460" "frequencybodygyrokurtosisyaxisaverage"
"461" "frequencybodygyroskewnesszaxisaverage"
"462" "frequencybodygyrokurtosiszaxisaverage"
"463" "frequencybodygyrobandsenergy1to8average"
"464" "frequencybodygyrobandsenergy9to16average"
"465" "frequencybodygyrobandsenergy17to24average"
"466" "frequencybodygyrobandsenergy25to32average"
"467" "frequencybodygyrobandsenergy33to40average"
"468" "frequencybodygyrobandsenergy41to48average"
"469" "frequencybodygyrobandsenergy49to56average"
"470" "frequencybodygyrobandsenergy57to64average"
"471" "frequencybodygyrobandsenergy1to16average"
"472" "frequencybodygyrobandsenergy17to32average"
"473" "frequencybodygyrobandsenergy33to48average"
"474" "frequencybodygyrobandsenergy49to64average"
"475" "frequencybodygyrobandsenergy1to24average"
"476" "frequencybodygyrobandsenergy25to48average"
"477" "frequencybodygyrobandsenergy1to8level1average"
"478" "frequencybodygyrobandsenergy9to16level1average"
"479" "frequencybodygyrobandsenergy17to24level1average"
"480" "frequencybodygyrobandsenergy25to32level1average"
"481" "frequencybodygyrobandsenergy33to40level1average"
"482" "frequencybodygyrobandsenergy41to48level1average"
"483" "frequencybodygyrobandsenergy49to56level1average"
"484" "frequencybodygyrobandsenergy57to64level1average"
"485" "frequencybodygyrobandsenergy1to16level1average"
"486" "frequencybodygyrobandsenergy17to32level1average"
"487" "frequencybodygyrobandsenergy33to48level1average"
"488" "frequencybodygyrobandsenergy49to64level1average"
"489" "frequencybodygyrobandsenergy1to24level1average"
"490" "frequencybodygyrobandsenergy25to48level1average"
"491" "frequencybodygyrobandsenergy1to8level2average"
"492" "frequencybodygyrobandsenergy9to16level2average"
"493" "frequencybodygyrobandsenergy17to24level2average"
"494" "frequencybodygyrobandsenergy25to32level2average"
"495" "frequencybodygyrobandsenergy33to40level2average"
"496" "frequencybodygyrobandsenergy41to48level2average"
"497" "frequencybodygyrobandsenergy49to56level2average"
"498" "frequencybodygyrobandsenergy57to64level2average"
"499" "frequencybodygyrobandsenergy1to16level2average"
"500" "frequencybodygyrobandsenergy17to32level2average"
"501" "frequencybodygyrobandsenergy33to48level2average"
"502" "frequencybodygyrobandsenergy49to64level2average"
"503" "frequencybodygyrobandsenergy1to24level2average"
"504" "frequencybodygyrobandsenergy25to48level2average"
"505" "frequencybodyaccelerationmagnitudemeanaverage"
"506" "frequencybodyaccelerationmagnitudestandarddeviationaverage"
"507" "frequencybodyaccelerationmagnitudemediagabsolutedeviationaverage"
"508" "frequencybodyaccelerationmagnitudemaximumaverage"
"509" "frequencybodyaccelerationmagnitudeminimumaverage"
"510" "frequencybodyaccelerationmagnitudesignalmagnitudeareaaverage"
"511" "frequencybodyaccelerationmagnitudeenergyaverage"
"512" "frequencybodyaccelerationmagnitudeinterquartilerangeaverage"
"513" "frequencybodyaccelerationmagnitudeentropyaverage"
"514" "frequencybodyaccelerationmagnitudemaximuminimumdexaverage"
"515" "frequencybodyaccelerationmagnitudemeanfrequencyaverage"
"516" "frequencybodyaccelerationmagnitudeskewnessaverage"
"517" "frequencybodyaccelerationmagnitudekurtosisaverage"
"518" "frequencybodybodyaccelerationjerkmagnitudemeanaverage"
"519" "frequencybodybodyaccelerationjerkmagnitudestandarddeviationaverage"
"520" "frequencybodybodyaccelerationjerkmagnitudemediagabsolutedeviationaverage"
"521" "frequencybodybodyaccelerationjerkmagnitudemaximumaverage"
"522" "frequencybodybodyaccelerationjerkmagnitudeminimumaverage"
"523" "frequencybodybodyaccelerationjerkmagnitudesignalmagnitudeareaaverage"
"524" "frequencybodybodyaccelerationjerkmagnitudeenergyaverage"
"525" "frequencybodybodyaccelerationjerkmagnitudeinterquartilerangeaverage"
"526" "frequencybodybodyaccelerationjerkmagnitudeentropyaverage"
"527" "frequencybodybodyaccelerationjerkmagnitudemaximuminimumdexaverage"
"528" "frequencybodybodyaccelerationjerkmagnitudemeanfrequencyaverage"
"529" "frequencybodybodyaccelerationjerkmagnitudeskewnessaverage"
"530" "frequencybodybodyaccelerationjerkmagnitudekurtosisaverage"
"531" "frequencybodybodygyromagnitudemeanaverage"
"532" "frequencybodybodygyromagnitudestandarddeviationaverage"
"533" "frequencybodybodygyromagnitudemediagabsolutedeviationaverage"
"534" "frequencybodybodygyromagnitudemaximumaverage"
"535" "frequencybodybodygyromagnitudeminimumaverage"
"536" "frequencybodybodygyromagnitudesignalmagnitudeareaaverage"
"537" "frequencybodybodygyromagnitudeenergyaverage"
"538" "frequencybodybodygyromagnitudeinterquartilerangeaverage"
"539" "frequencybodybodygyromagnitudeentropyaverage"
"540" "frequencybodybodygyromagnitudemaximuminimumdexaverage"
"541" "frequencybodybodygyromagnitudemeanfrequencyaverage"
"542" "frequencybodybodygyromagnitudeskewnessaverage"
"543" "frequencybodybodygyromagnitudekurtosisaverage"
"544" "frequencybodybodygyrojerkmagnitudemeanaverage"
"545" "frequencybodybodygyrojerkmagnitudestandarddeviationaverage"
"546" "frequencybodybodygyrojerkmagnitudemediagabsolutedeviationaverage"
"547" "frequencybodybodygyrojerkmagnitudemaximumaverage"
"548" "frequencybodybodygyrojerkmagnitudeminimumaverage"
"549" "frequencybodybodygyrojerkmagnitudesignalmagnitudeareaaverage"
"550" "frequencybodybodygyrojerkmagnitudeenergyaverage"
"551" "frequencybodybodygyrojerkmagnitudeinterquartilerangeaverage"
"552" "frequencybodybodygyrojerkmagnitudeentropyaverage"
"553" "frequencybodybodygyrojerkmagnitudemaximuminimumdexaverage"
"554" "frequencybodybodygyrojerkmagnitudemeanfrequencyaverage"
"555" "frequencybodybodygyrojerkmagnitudeskewnessaverage"
"556" "frequencybodybodygyrojerkmagnitudekurtosisaverage"
"557" "angletimebodyaccelerationmeantogravityaverage"
"558" "angletimebodyaccelerationjerkmeangravitymeanaverage"
"559" "angletimebodygyromeangravitymeanaverage"
"560" "angletimebodygyrojerkmeangravitymeanaverage"
"561" "anglexaxisgravitymeanaverage"
"562" "angleyaxisgravitymeanaverage"
"563" "anglezaxisgravitymeanaverage"


####Notes on variables
Read the features_info.txt file for all information concerning the meaning of the original variables names from which the average was calculated
 
##Sources
This Cookbook was created using the template by Joris Schut at the following link: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41 
