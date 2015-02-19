setwd("~/Documents/coursera/datasciencecoursera/cleaningData")

# download & extract data
if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl,destfile="./data/fuci.zip",method="curl")
dateDownloaded <- date()
#unzip("./data/fuci.zip", exdir="./data/")

# read data into R data.tables
activity_names <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
header_names   <- read.table("./data/UCI HAR Dataset/features.txt")
test_subject   <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
test_data      <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test_activity  <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
train_subject  <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
train_data     <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

# 1) Merges the training and the test sets to create one data set.
test_set  <- cbind(test_subject,test_activity, test_data)
train_set <- cbind(train_subject,train_activity, train_data)
data <- rbind(test_set, train_set)

# 4) Appropriately labels the data set with descriptive variable names.
my_headers <- data.frame(V1=c(0, 0),V2=c("subject", "activity"))
names(data)<-rbind(my_headers, header_names)[[2]]

# 2) Extracts only the measurements on the mean and standard deviation for each
#    measurement.
#     - only measurements: ^t
#     - only mean and standard deviation: std|mean
#     - plus activity column
data_sub <- data[, grepl("(^t.*(std|mean))|(activity|subject)", names(data))]

# 3) Uses descriptive activity names to name the activities in the data set
data_sub$activity<-factor(data_sub$activity, labels=activity_names[,2])

# 5) tidy data set with the average of each variable for each activity & subject
library(dplyr)
new_data <- data_sub %>%
            group_by(subject, activity) %>%
            summarise_each(funs(mean,sd))
write.table(new_data,"./data/fuci2.txt", row.name=FALSE)
