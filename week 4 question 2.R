# Assignment: ASSIGNMENT 4 question 2
# Name: Qiang, Sarah    
# Date: 2022/4/10

install.packages("readxl")
library (readxl)
setwd("/Users/sarah/hello_world/data")
house.data <- read_xlsx("/Users/sarah/hello_world/data/week-7-housing.xlsx")
house.data <-house.data[, c(1,1:24)]
house.data <- house.data[1:5000]
attach(house.data)

#Use the apply function on a variable in your dataset

saleprice <- data.frame(c("Sale Price"))
apply(house.data,1,mean)

#Use the aggregate function on a variable in your dataset
head(house.data)
aggregate(saleprice~bedrooms,house.data, mean)

#Use the plyr function on a variable in your dataset – more specifically, 
# I want to see you split some data, perform a modification to the data, and then bring it back together

#Check distributions of the data
saleprice <- data.frame(c("Sale Price"))
pricesin1k <- saleprice/1000
hist(pricesin1k,
     data = house.data,
     main = 'Distribution of Price',
     xlab = 'Prices in 100k',
     ylab = 'Frequency',
     col ='blue',
     bins =10)

#Identify if there are any outliers

mean = mean(saleprice)
std = sd(saleprice)
Tmin = mean-(3*std)
Tmax = mean +(3*std)
saleprice[which(saleprice < Tmin | saleprice > Tmax)]

#Create at least 2 new variables
# price by bedroom
bedrooms <- data.frame(c("Bedrooms"))
pricebybedroom <-saleprice/bedrooms
#price by sqft
sqft <- data.frame((c"square_feet_total_living"))
pricebysqft <-saleprice/sqft


