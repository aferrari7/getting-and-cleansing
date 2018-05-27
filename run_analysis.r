library(dplyr)

#read test data
test_data <- read.table("X_test.txt")
test_data_what <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

#transpose data to put together later
transpose_y <- unlist(test_data_what)
transpose_subject <- unlist(subject_test)

#combine data into one set
test_data$act <- transpose_y
test_data$subject <- transpose_subject

#read train data
train_data <- read.table("X_train.txt")
train_data_what <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

#transpose data to put together later
transpose_y_train <- unlist(train_data_what)
transpose_subject_train <- unlist(subject_train)

#combine data into one set
train_data$act <- transpose_y_train
train_data$subject <- transpose_subject_train


#combine test and train data
combined <- rbind(test_data, train_data)



#add column names
col_names <- read.table("features.txt")
colnames(combined) <- c(as.character(col_names$V2),"act", "subject")


#filter out unneeded columns
only_mean_std <- combined[ , grepl( "mean|std|act|subject" , names( combined ) ) ]

only_mean_std_nofreq <- only_mean_std[ , !grepl( "Freq" , names( only_mean_std ) ) ]


#join in descriptive names
set_names <- read.table("activity_labels.txt")
added_names <- merge(only_mean_std_nofreq, set_names, by.x = "act", by.y = "V1")

#clean up column names
names(added_names) <- gsub("()", "", names(added_names), fixed = TRUE)
names(added_names) <- gsub("V2", "act_desc", names(added_names), fixed = TRUE)


#calculate averages by subject and act
agg_set <- aggregate(added_names, 
                      list(added_names$act_desc, added_names$subject), mean)


#remove unneeded columns
agg_set_drop_unneeded <- agg_set[ , !grepl( "act|subject" , names( agg_set ) ) ]


#Rename group columns
names(agg_set_drop_unneeded) <- gsub("Group.1", "act_desc", names(agg_set_drop_unneeded), fixed = TRUE)
names(agg_set_drop_unneeded) <- gsub("Group.2", "subject", names(agg_set_drop_unneeded), fixed = TRUE)

#export data
write.table(agg_set_drop_unneeded, "tidy_averages.txt", row.names = FALSE, col.names = TRUE)