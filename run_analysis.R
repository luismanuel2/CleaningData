library(dplyr) 

###Merges the training and the test sets to create one data set.###


  #labels
  dat_y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  dat_y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
  dat_y<-rbind(dat_y_test,dat_y_train)
    ###Extracts only the measurements on the mean and standard deviation for each measurement.###
    names_activi<-read.table("./UCI HAR Dataset/activity_labels.txt")
    dat_y<-names_activi[dat_y[,1],2]
  rm(dat_y_test,dat_y_train,names_activi)

  #subjects 
  dat_sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  dat_sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  dat_sub<-rbind(dat_sub_test,dat_sub_train)
  rm(dat_sub_test,dat_sub_train)

  #observations
  dat_x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
  dat_x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
  dat_x<-rbind(dat_x_test,dat_x_train)
    ###Extracts only the measurements on the mean and standard deviation for each measurement.###
    features <-read.table("./UCI HAR Dataset/features.txt")
    col_nums <-grep("mean|std",features[,2])
    col_names <-grep("mean|std",features[,2],value = TRUE)
    col_names <- gsub("[()-]","",col_names)
    dat_x<-select(dat_x,col_nums)
  rm(dat_x_test,dat_x_train,features,col_nums)
  #join all
  data<-cbind(dat_x,dat_y,dat_sub)
  

###Appropriately labels the data set with descriptive variable names###
  names(data)<-c(col_names,"activity","subject")
  rm(col_names)

###From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.###
  avg <-data%>% group_by(activity,subject) %>% summarize_all(funs(mean))




