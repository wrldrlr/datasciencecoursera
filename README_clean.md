@@@ ================= Tidy data

Four files uploaded to coursera website

1. tidy.txt - all data  average of each variable for each activity and
each subject.

2. tidy.pdf - tidy.txt opened in Excel saved as pdf which clearly shows structure of data table which is not clear
              when opened any program

3. tidy_ms.txt - only mean and standard deviation features extracted data  averaged of each variable for each activity and
each subject.

2. tidy_ms.pdf - tidy_ms.txt opened in Excel saved as pdf which clearly shows structure of data table which is not clear
              when opened any program   


@@ Two files uploaded to github site

1. run_analysis.R

   This is the script which is used for doing the following steps as required by the assignment.
   Each of these  step numbers are marked in the appropriate code areas. Brief description how this is
   accomplished is given below.
  

   1. Merges the training and the test sets to create one data set.
      Load train & test files of X,Y,subject text files
      use cbind to merge X,Y,subject train files
      use cbind to merge X,Y,sibject test files
      use rbind to make all these single big file - called data frame - yxsub_all
      load feature file and use it to change column names of merged file
      
   2. Extracts only the measurements on the mean and standard deviation for each measurement.
      use grep command to extract column names containg mean and std dev name the data frame as
      yxsub_all_ms
 
   3. Uses descriptive activity names to name the activities in the data set
   4. Appropriately labels the data set with descriptive activity names.

      Add  a blank column-activity_labels which will contain  activity_labels
          to yxsub_all & yxsub_all_ms  .
      Load activity lable file-activity_labels.txt
      Based on activity number write activity lables to 
      Based on activity lables column
   

   5. Creates a second, independent tidy data set with the average of each variable for each activity and
	each subject.

      use aggregate command to create a table which contains mean of each variable for each activity & subject
      for both yxsub_all & yxsub_all_ms
      write these to tidy and tidy_ms data frames
      save each of them as tidy.txt and tidy_ms.txt
      These are uploaded to Coursera web site.

2. README_clean.md
  
  It is this file. It is named as README_clean.md instead of README.md to avoid confusion with another file uploaded for
  another coursera course.