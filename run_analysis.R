#1. Merges the training and the test sets to create one data set.

##Importing column names
features=t(read.table(file="~/features.txt",header=FALSE))[2,]

## Importing the test files
y_test=read.table(file = "~/y_test.txt",header = FALSE)
x_test=read.table(file = "~/X_test.txt",header = FALSE,col.names = features)

## Importing the train files
y_train=read.table(file = "~/y_train.txt")
x_train=read.table(file = "~/X_train.txt",col.names = features)

X_main=rbind(x_test,x_train)
Y_main=rbind(y_test,y_train)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
m=sapply(X_main,mean)
s=sapply(X_main,sd)

#3. Uses descriptive activity names to name the activities in the data set
y_labels=read.table(file="~/activity_labels.txt",header=FALSE)

#4. Appropriately labels the data set with descriptive variable names. 
##Other solutions were changing the order after the merge therefore I chose to use the plyr library
install.packages("plyr")
library(plyr)
Y_modified=as.data.frame(join(Y_main,y_labels,by="V1")[,2])
names(Y_modified)="Activity"
data=cbind(Y_modified,X_main)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data2=as.data.frame(t(aggregate(.~Activity,data,mean)))
col=as.matrix(data2[1,])
data2=data2[-1,]
colnames(data2)=col
data2=data2[,c(4,6,5,2,3,1)]

write.table(data2,file="~/output.txt",row.name=FALSE)
