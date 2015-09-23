trainset <- read.table('train/X_train.txt')
testset <- read.table('test/X_test.txt')
trainlab <- read.table('train/y_train.txt')
testlab <- read.table('test/y_test.txt')
actlabs <- read.table('activity_labels.txt')
features <- read.table('features.txt')
subjtrain <- read.table('train/subject_train.txt')
subjtest <- read.table('test/subject_test.txt')

merdata <- rbind(trainset,testset)
names(merdata) <- features[,2]
accstd <- merdata[, grep("mean|Mean|std", names(merdata))]

merlab <- rbind(trainlab,testlab)
mersubj <- rbind(subjtrain,subjtest)
names(mersubj)='Subject'
Activity <- actlabs$V2[merlab$V1]

cleanmeas <- cbind(Activity,mersubj,accstd)
cleandat <- group_by(cleanmeas,Activity,Subject) %>% summarize_each(c("mean"))


