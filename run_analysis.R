##STep 1 -
setwd("D://CoureseraR//DataCleaningProjectDataSet//UCI HAR Dataset")
getwd()

##Step 2 - 
subj_train <- read.table("./train/subject_train.txt")
subj_test <- read.table("./test/subject_test.txt")
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")
Y_train <- read.table("./train/y_train.txt")
Y_test <- read.table("./test/y_test.txt")
ActivityNames <- read.table("./activity_labels.txt")
head(ActivityNames)
features <- read.table("./features.txt")
head(features)

##Step 3 -
subj_COMB <- rbind(subj_train,subj_test)
dim(subj_COMB)
names(subj_COMB) = "SubjectID" 

##Step 4 -
Y_COMB <- rbind(Y_train,Y_test)
dim(Y_COMB)
names(Y_COMB) = "ActivityID" 

##Step 5 -
X_COMB <-rbind(X_train,X_test)
names(X_COMB)=features$V2

##Step 6 -
New_DataSet <- cbind(subj_COMB,Y_COMB,X_COMB)

##Step 7 -
X_GREP <- grep("[Mm]ean|[Ss]td",features$V2)
X_GREP <- X_GREP + 2
New_Dataset2 <- New_DataSet[,c(1,2,(X_GREP))]

##Step 8 -
New_Dataset2$ActivityID <- ActivityNames$V2[match(New_Dataset2$ActivityID, ActivityNames$V1)]
unique(New_Dataset2$ActivityID)

##Step 9 -
names(New_Dataset2) <- sub("[Aa]cc","Accelaration",names(New_Dataset2))
names(New_Dataset2) <- sub("^f","Frequency",names(New_Dataset2))
names(New_Dataset2) <- sub("^t","Time",names(New_Dataset2))
names(New_Dataset2) <- sub("-mean()","Mean",names(New_Dataset2))
names(New_Dataset2) <- sub("-std()","STD",names(New_Dataset2))

##Step 10 -
##install.packages("reshape2")
library(reshape2)

##Step 11-
New_Dataset2_Melt <- melt(New_Dataset2, id = c("SubjectID","ActivityID"), na.rm= TRUE)
Final_Dataset <- dcast(New_Dataset2_Melt, SubjectID ~ ActivityID, mean)

##Step 12 -
write.table(Final_Dataset,"./Final_Dataset.txt",row.name=FALSE)

