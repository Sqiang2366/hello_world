
#Assignment: ASSIGNMENT 4 question 1
# Name: Qiang, Sarah    
# Date: 2022/4/10

setwd("/Users/sarah/hello_world/data")

x <- read.csv("/Users/sarah/hello_world/data/scores.csv")

Sport=subset(x,Section=="Sports")
head(Sport)

Regular=subset(x,Section=="Regular")
head(Regular)

Score1=Sport[,2]
Score2=Regular[,2]
par(mfrow=c(1,1))
plot(Score1, xlab="number of students", ylab="Score", main="Sports")
plot(Score2, xlab="number of students", ylab="Score", main="Regular")

