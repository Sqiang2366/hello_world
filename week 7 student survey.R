# Assignment: ASSIGNMENT 5 student survey
# Name: Qiang,Sarah
# Date: 2022-4-29

install.packages('tinytex')
tinytex::install_tinytex()

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/sarah/documents/hello_world")

## Load the `data/r4ds/student-survey.csv` to
survey_df <- read.csv("/Users/sarah/documents/hello_world/data/student-survey.csv")

#I. covariance 
happiness = survey_df$Happiness
tv = survey_df$TimeTV
timereading = survey_df$TimeReading
cov(happiness, tv)
#The covariance of eruption duration and waiting time is about 114. It indicates a positive linear relationship between the two variables.

# II. What measurement is being used for the variables?
#timereading is an ordinal variable
#happinese is an ordinal variable
#timetv is an ordinal variable
#gender is a nominal variable

#III. Choose the type of correlation test to perform, explain why you chose this test, and make a prediction if the test yields a positive or negative correlation?
# I chose the pearson method because I believe there's a linear correlation between the two quantitative variables I am testing. 

# IV. Perform a correlation analysis of:
#A single correlation between two a pair of the variables
cor(happiness, tv, method = "pearson")
#Repeat your correlation test in step 2 but set the confidence interval at 99%
cor.test(happiness, tv, method = "pearson",level =0.99)
#Describe what the calculations in the correlation matrix suggest about the relationship between the variables. Be specific with your explanation.
# The correlation coefficient of happiness and TV is 0.636556 Since it is rather close to 1, we can conclude that the variables are positively linearly related.

# V. Calculate the correlation coefficient and the coefficient of determination, describe what you conclude about the results.
head(survey_df)
happiness.lm = lm(happiness ~ tv, data=survey_df)
summary(happiness.lm)$r.squared 
#The coefficient of determination of the simple linear regression model for the data set faithful is 0.4052035

# Vi. Based on your analysis can you say that watching more TV caused students to read less? Explain.
cor(tv, timereading, method = "pearson")
cov(tv, timereading)
# the correlation between the time student spent watching TV and reading is -0.8830677, it creates a neative linear colrreation, the more time students spent on watching TV, the less they read.

#VII. Partial colrreation
install.packages("ppcor")
library(ppcor)
pcor(survey_df)

