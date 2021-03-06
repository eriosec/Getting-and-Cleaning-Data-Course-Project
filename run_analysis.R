#Copy all files into a folder called data and make it the working directory.

#This script uses the basic R packages plus the data.table package
library("data.table", lib.loc="C:/Program Files/R/R-3.1.2/library")

#The file with the activities and their code are loaded into the "activities" table 
#and the columns named appropriately
activities<-read.table("activity_labels.txt",col.names=c("activitycode","activity"))

#The file with all the names of the measured features is loaded into a table called "features"
#and the columns are named appropriately
features<-read.table("features.txt",col.names=c("featcode","feature"))

#The column that only contains the names of the features is then extracted onto a vector
#named "featurevec" and will later be used to name the columns of the Test and Train data sets
featurevec<-as.vector(features$feature)

#The list of subjects for the Test data and the Train data collected are read into
#their respective tables and columns named appropriately
subjectTest<-read.table("subject_test.txt",col.names=c("subject"))
subjectTrain<-read.table("subject_train.txt",col.names=c("subject"))

#The data for the Test set is read into a table called "XTest" and the "featurevec" vector
#previously created is used to appropriately name all the columns
XTest<-read.table("X_test.txt")
colnames(XTest)<-featurevec

#The table of Test subjects "subjectTest" is then column bound to the "XTest" table containing all the 
#measured test data
XTestnamed<-cbind(subjectTest,XTest)## TEST DATA WITH SUBJECT COLUMN AND ALL MEASURED FEATURES COLUMNS

#The data for the Train set is read into a table called "XTest" and the "featurevec" vector
#previously created is used to appropriately name all the columns
XTrain<-read.table("X_train.txt")
colnames(XTrain)<-featurevec

#The table of Train subjects "subjectTrain" is then column bound to the "XTrain" table containing all the 
#measured train data
XTrainnamed<-cbind(subjectTrain,XTrain) ## TRAINED DATA WITH SUBJECT COLUMN AND ALL MEASURED FEATURES COLUMNS


##*************1. THIS IS THE MERGED SET OF TRAINING AND TEST DATA SETS***********************************

##XTrained and xTestnamed are row bound to create a tabled called "fullSet"
fullSet<-rbind(XTrainnamed,XTestnamed)


##THE merged set is then ordered by subject
ordFullSet<-fullSet[order(fullSet$subject),]

##************************2. THIS BLOCK CALCULATES AND PRINTS THE MEANS AND STANDARD DEVIATIONS************************************
##The mean is then calculated for each of the measurements (features) of the ordered merged data set
mergedMeans<-apply(ordFullSet,2,mean)

##The names of the columns is extracted to reflect the appropriate calculated measurements
mergedMeansColNames<-names(mergedMeans)

##The names are modified to reflect an accurate descritption of the calculated extracted data (the means for all columns)
featurevecmeans<-vector()
for (i in 1:length(mergedMeansColNames))
    featurevecmeans[i]<-paste(mergedMeansColNames[i],"-Mean",sep="")

mergedMeansTable<-as.table(t(mergedMeans))

colnames(mergedMeansTable)<-featurevecmeans

mergedMeansTable

##The standard deviation is then calculated for each of the measurements (features) of the ordered merged data set
mergedSDS<-apply(ordFullSet,2,sd)

##The names of the columns is extracted to reflect the appropriate calculated measurements
mergedSDSColNames<-names(mergedSDS)

##The names are modified to reflect an accurate descritption of the calculated extracted data (the standard deviations for all columns)
featurevecsds<-vector()
for (i in 1:length(mergedSDS))
    featurevecsds[i]<-paste(mergedSDSColNames[i],"-StdDev",sep="")

mergedSDSTable<-as.table(t(mergedSDS))

colnames(mergedSDSTable)<-featurevecsds

mergedSDSTable

##*************************3. THIS BLOCK ENSURES THE USE OF DESCRIPTIVE ACTIVITY NAMES****************************

##The activities that were performed by each subject in the test group are read into a table called
## yTestActivities
yTestActivities<-read.table("y_test.txt")

##The activities that were performed by each subject in the train group are read into a table called
## yTrainActivities
yTrainActivities<-read.table("y_train.txt")

##The activity lables file that links the number of the activity and its name are read into a table called
##activityLabels
activityLabels<-read.table("activity_labels.txt")

##The activityLabels" and "yTrainActivities" tables are then used to create a function named
##"applyLabels" and wich will be used to create a data frame named "dftrain" which will hold 
##the character names of all the activities so that later they can be column bound with the
##"XTrainNamed" table

dftrain<-data.frame()
applyLabels<-function(yTrainActivities,activityLabels){
    for (i in 1:nrow(yTrainActivities)){
        for(j in 1:nrow(activityLabels)){
            if(yTrainActivities[i,1]==activityLabels[j,1]){
                dftrain[i,1]<<-activityLabels[j,2]

            }
        }
    }
  
}
##The funciton is then run and the column for the data frame "dftrain" is labeled appropriately
applyLabels(yTrainActivities,activityLabels)
colnames(dftrain)<-c("Activity")

##The "dftrain" data frame for the labels with names is column bound to the "XTrainnamed" table and given
##the name "XTrainedfull" holding a table of all appropriately labeled data for the Train set.
XTrainedfull<-cbind(dftrain,XTrainnamed)


##The activityLabels" and "yTrainActivities" tables are then used to recreate the function named
##"applyLabels" and wich will be used to create a data frame named "dftest" which will hold 
##the character names of all the activities so that later they can be column bound with the
##"XTestnNamed" table
dftest<-data.frame()
applyLabels<-function(yTestActivities,activityLabels){
    for (i in 1:nrow(yTestActivities)){
        for(j in 1:nrow(activityLabels)){
            if(yTestActivities[i,1]==activityLabels[j,1]){
                dftest[i,1]<<-activityLabels[j,2]

            }
        }
    }

}

##The function is then run and the column for the data frame "dftest" is labeled appropriately
applyLabels(yTestActivities,activityLabels)
colnames(dftest)<-c("Activity")

##The "dftest" data frame for the labels with names is column bound to the "XTestnamed" table and given
##the name "XTestfull" holding a table of all appropriately labeled data for the Test set.
XTestfull<-cbind(dftest,XTestnamed)

##The tables "XTrainedull" and "XTestfull" are then row bound to create the full set of merged data with
##appropriately labeled columns and given the name "fullSet"
fullSet<-rbind(XTrainedfull,XTestfull)

##The "fullSet" table is then ordered by subject and activity
sortedfullSet<-fullSet[order(fullSet$subject,fullSet$Activity),]

##The sorted set is then split by subject and then by activity
bysubjorderedfull<-split(sortedfullSet,sortedfullSet$subject)
subjbyact<-lapply(bysubjorderedfull,function(x) split(x,x$Activity))

##The means for EACH measurement(feature) for each of the tables holding the measurements
##for each subject and activity are then calculated and stored in "measurementMeans"
measurementMeans<-lapply(subjbyact,
                          function(x) lapply(x,
                                             function(x) apply(x[2:563],2,mean)))

##******************THIS BLOCK TIDIES UP THE DATA************************* 
##The "measurementMeans" list is then unlisted to create the tidy data set where the average of all the 
##measurements for each subject and its activities are saved according to the tidy data principles:
##Each variable being measured is in one column
##Each different observation of that variable (mean for different activity of a user) is in a different row
##There is only one table for this "kind" of measurements

tidymeanstemp<-data.frame()
activitycol<-data.frame() ##This data frame is used to keep track of the activity labels
for (i in 1:length(measurementMeans)){
    for (j in 1: nrow(activities)){
        tidymeanstemp<-rbind(tidymeanstemp,t(as.data.frame(measurementMeans[[i]][[j]])))
        activitycol<<-rbind(activitycol,as.data.frame(names(measurementMeans[[i]][j])))
    }
    
}
##The activity labels are then column bound to the tidy data set and labeled appropriately
tidymeans<-cbind(activitycol,tidymeanstemp)
names(tidymeans)[1]<-c("activity")


##The names of the columns is extracted to reflect the appropriate calculated measurements
tidymeansColNames<-names(tidymeans[3:length(tidymeans)])

##The names are modified to reflect an accurate descritption of the calculated extracted data (the average for all measurements)
featurevectidymeans<-vector()
for (i in 1:length(tidymeansColNames))
    featurevectidymeans[i]<-paste(tidymeansColNames[i],"average",sep="")

tidyactsubj<-tidymeans[1:2]
tidyaverages<-tidymeans[3:ncol(tidymeans)]
colnames(tidyaverages)<-featurevectidymeans
tidymeans<-cbind(tidyactsubj,tidyaverages)


#******** 4. THIS BLOCK CHANGES ALL VARIABLE NAMES TO A FULLY DESCRIPTIVE FORMAT*********************

names(tidymeans)<-sub("X","xaxis",names(tidymeans))
names(tidymeans)<-sub("Y","yaxis",names(tidymeans))
names(tidymeans)<-sub("Z","zaxis",names(tidymeans))
names(tidymeans)<-tolower(names(tidymeans))
names(tidymeans)<-sub(",gravitymean","gravitymean",names(tidymeans))
names(tidymeans)<-gsub("-","",names(tidymeans))
names(tidymeans)<-gsub("\\(","",names(tidymeans))
names(tidymeans)<-gsub("\\)","",names(tidymeans))
names(tidymeans)<-gsub(",","to",names(tidymeans))
names(tidymeans)<-gsub("\\.","level",names(tidymeans))
names(tidymeans)<-sub("fbody","frequencybody",names(tidymeans))
names(tidymeans)<-sub("tbody", "timebody",names(tidymeans))
names(tidymeans)<-sub("tgravity", "timegravity",names(tidymeans))
names(tidymeans)<-sub("acc","acceleration",names(tidymeans))
names(tidymeans)<-sub("std","standarddeviation",names(tidymeans))
names(tidymeans)<-sub("mad","medianabsolutedeviation",names(tidymeans))
names(tidymeans)<-sub("sma","signalmagnitudearea",names(tidymeans))
names(tidymeans)<-sub("iqr","interquartilerange",names(tidymeans))
names(tidymeans)<-sub("arcoeff","autoregressioncoefficient",names(tidymeans))
names(tidymeans)<-sub("inds","index",names(tidymeans))
names(tidymeans)<-sub("mag","magnitude",names(tidymeans))
names(tidymeans)<-sub("meanfreq","meanfrequency",names(tidymeans))
names(tidymeans)<-sub("max","maximum",names(tidymeans))
names(tidymeans)<-sub("min","minimum",names(tidymeans))




##*************5. TIDY DATA FILE IS CREATED WITH WRITE.TABLE *************************************
##The tidymeans data table is written to a text file called "tidymeans.txt" 
write.table(tidymeans, file="tidymeansfile.txt", row.name=FALSE)
