        ## project assignment for cleaning data
        ##  run_analysis.R

        
        #   1. Merges the training and the test sets to create one data set
        ##  read all train and text files to variables of same name
        #  club them together in the same order
        
        y_train <-read.table('y_train.txt')
        X_train <-read.table('X_train.txt')
        subject_train <-read.table('subject_train.txt')
       
        train <-data.frame(cbind(y_train,X_train,subject_train))
        
        y_test <-read.table('y_test.txt')
        X_test <-read.table('X_test.txt')
        subject_test <-read.table('subject_test.txt')
        test <- data.frame(cbind(y_test,X_test,subject_test))
        
        # merge train and test files to a single data frame
        yxsub_all <-rbind(train,test )
        
        ## load feature file and use it to change column names of merged files
        ##  add names activity and subject to the ends of file
        
        features  <- read.table("features.txt",header=F,sep="",stringsAsFactors = FALSE)
        features <-rbind(c(0,"activity"), features)
        features <-rbind(features, c(nrow(features),'subject'))
        row.names(features) <-NULL
        
        colnames(yxsub_all)  <-features[,2]
        summary(yxsub_all[1])
        
        ## extract only mean std dev columns
        ##  2. Extracts only the measurements on the mean and standard deviation for each measurement
        

        toMatch <- c(".*mean\\(\\).*", ".*std\\(\\).*","activity","subject")
        matches <- unique (grep(paste(toMatch,collapse="|"), features$V2, value=TRUE))
        yxsub_all_ms <-yxsub_all[,matches]
        str(matches)
        
        # 3. Uses descriptive activity names to name the activities in the data set
        # 4. Appropriately labels the data set with descriptive activity names.
        # Appropriately labels the data set with descriptive activity names.
        # replace activity by number
        activity_labels <-read.table('activity_labels.txt')
        yxsub_all <-cbind(activity_labels='',yxsub_all)
        yxsub_all$activity_labels  <-activity_labels[yxsub_all$activity,2]
        
         
        yxsub_all_ms <-cbind(activity_labels='',yxsub_all_ms)
        yxsub_all_ms$activity_labels <-activity_labels[yxsub_all_ms$activity,2]
        
        
        ##  5. Creates a second, independent tidy data set with the average of each variable for each activity and
        #   each subject.
        
        tidy <-NULL
        tidy <-aggregate( yxsub_all[,-c(1:2,564)],by=list(yxsub_all$activity_labels,yxsub_all$subject),  
                          data = yxsub_all  ,FUN=  mean  )
        
        write.table(tidy,'tidy.txt')
        
        tidy_ms <-NULL
        tidy_ms <-aggregate( yxsub_all_ms[,-c(1:2,69)],by=list(yxsub_all_ms$activity_labels,yxsub_all_ms$subject),  
                          data = yxsub_all_ms  ,FUN=  mean  )
        write.table(tidy_ms,'tidy_ms.txt')
