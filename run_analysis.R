#This code is described in the file CodeBook.md. It takes in the UCI HAR 
#dataset and outputs the mean of variables related to the mean and standard 
#standard deviation of various parameters as described in CodeBook.md.

#Read in the files
trainset <- read.table('train/X_train.txt')
testset <- read.table('test/X_test.txt')
trainlab <- read.table('train/y_train.txt')
testlab <- read.table('test/y_test.txt')
actlabs <- read.table('activity_labels.txt')
features <- read.table('features.txt')
subjtrain <- read.table('train/subject_train.txt')
subjtest <- read.table('test/subject_test.txt')

#Merge the training and test sets
merdata <- rbind(trainset,testset)
merlab <- rbind(trainlab,testlab)
mersubj <- rbind(subjtrain,subjtest)

#Assign the names to the variables and choose those which have 
#'mean' or 'standard deviation' in their name.
names(merdata) <- features[,2]
accstd <- merdata[, grep("mean|Mean|std", names(merdata))]


names(mersubj)='Subject'

#Assign named labels to the numbered activities
Activity <- actlabs$V2[merlab$V1]

cleanmeas <- cbind(Activity,mersubj,accstd)
cleandat <- group_by(cleanmeas,Activity,Subject) %>% summarize_each(c("mean"))

#Write the output file
write.table(cleandat,'cleandat.txt')
