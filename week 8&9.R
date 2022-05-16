#week 8&9
#DSC520 T302
#Sarah Qiang
#5/13/2022

library (readxl)

setwd("/Users/sarah/documents/hello_world")
housing <- read_xlsx("/Users/sarah/documents/hello_world/data/week-7-housing.xlsx")

#Explain any transformations or modifications you made to the dataset

#remove human behavior variables such as sale reason, instrument, address, etc. 
options(scipen = 999)
Price.out1 <- which(housing$`Sale Price` %in% boxplot(housing$`Sale Price`, col = "springgreen")$out)
sqft.out1 <- which(housing$sq_ft_lot %in% boxplot(housing$sq_ft_lot, col = "skyblue")$out)
length(square_feet_total_living1)
#remove outliers
outliers1 <- c(Price.out1,sqft.out1)
length(outliers1)
Sale.Price1 <- c(housing$`Sale Price`[-outliers1])
sq_ft_lot1 <- housing$sq_ft_lot[-outliers1]
hist(housing$`Sale Price`, col = "green")
hist(housing$sq_ft_lot, col = "blue")

#Create two variables; one that will contain the variables Sale Price and Square Foot of Lot (same variables used from previous assignment on simple regression) and one that will contain Sale Price and several additional predictors of your choice. Explain the basis for your additional predictor selections.
model1 <- lm(housing$`Sale Price`~housing$sq_ft_lot)
temp1 <- c(housing$square_feet_total_living, housing$outliers1)
square_feet_total_living1 <- c(temp1[-outliers1])
temp2 <- c(housing$bedrooms, outliers1)
bedrooms1 <- c(temp2[-outliers1])
temp3 <- c(housing$year_renovated[outliers1])
year_renovated1 <- c(temp3[-outliers1])
model2 <- lm(Sale.Price1~square_feet_total_living1)

# Besides the normal variables, I created several variables such as saleprice1, sq_ft_lot1, square_feet_total_living1 and bedrooms1 after removing the outliers. The outliers are the extreme value ones. I want to compare how the outliers would affect the results.

#Execute a summary() function on two variables defined in the previous step to compare the model results. What are the R2 and Adjusted R2 statistics? Explain what these results tell you about the overall model. Did the inclusion of the additional predictors help explain any large variations found in Sale Price?
summary (model1)
summary (model2)

#Considering the parameters of the multiple regression model you have created. What are the standardized betas for each parameter and what do the values indicate?
#From the above summary and the coefficients table, the standardized beta coefficients are 580377 (intercept), 140098 (standardized regression coefficient for square_feet_total_living1), -19573 (standardized regression coefficients for bedrooms1), -3743 (standardized regression coefficient for year_renovated1).
#Calculate the confidence intervals for the parameters in your model and explain what the results indicate.
model3 <- lm(Sale.Price1~scale(square_feet_total_living1)+scale(bedrooms1)+scale(year_renovated1))
summary(model3)  
#These values indicate that an increase of one standard deviation of a predictor variable keeping all the other predictor variables constant, results in an expected change of the respective regression coefficient in Sale.price1.

#Assess the improvement of the new model compared to your original model (simple regression model) by testing whether this change is significant by performing an analysis of variance.
#Perform casewise diagnostics to identify outliers and/or influential cases, storing each function's output in a dataframe assigned to a unique variable name.
outliers1 <- c(Price.out1,sqft.out1)  
Sale.Price1 <- c(Sale.Price[-outliers1])  
sq_ft_lot1 <- sq_ft_lot[-outliers1]  
hist(Sale.Price1, col = "green")  
hist(sq_ft_lot1, col = "blue")  
#In the second model, we use square_feet_total_living, bedrooms, and year_renovated as our additional predictors. I used these variables because they are the factors that a buyer would look for in a house.

#Visually check the assumptions related to the residuals using the plot() and hist() functions. Summarize what each graph is informing you of and if any anomalies are present.
plot(model1)

