#week 5 
#DSC520 T302
#Sarah Qiang
#4/13/2022



#setup, prepare the file
library (readxl)
setwd("/Users/sarah/hello_world/data")
house.data <- read_xlsx("/Users/sarah/hello_world/data/week-7-housing.xlsx")
house.data <-house.data[c(1:50), ]

#Using the dplyr package, use the 6 different operations to analyze/transform the data 
library (dplyr)
house <- tbl_df(house.data)
data.frame(head(house))

#calculate the avg price grouped by building grade
head(with(house,tapply(`Sale Price`,building_grade, mean, na.rm=TRUE)))
head (aggregate(`Sale Price`~building_grade, house, mean))
#GroupBy
house %>%
  group_by(building_grade) %>%
#Summarize
  summarise(avg_price = mean(`Sale Price`, na.rm=TRUE))
#Mutate: add new variable
# first create new variable
house$price_per_sqft <-house$`Sale Price`/house$square_feet_total_living
#second print new variable
house %>%
  select(`Sale Price`,square_feet_total_living) %>%
  mutate(price_per_sqft = `Sale Price`/square_feet_total_living)
#third store the new variable
house <- house %>% mutate(price_per_sqft = `Sale Price`/square_feet_total_living)
#Filter
filter(house, `Sale Price`==698000)
#Select 
select(house, year_built,`Sale Price`)
#Arrange 
arrange(house,desc(`Sale Price`))

#Using the purrr package – perform 2 functions on your dataset.  
library (purrr)
#You could use zip_n, keep, discard, compact, etc.
map_dbl(house$`Sale Price`,mean(house$`Sale Price`))
discard(house,is.na(house$sale_warning = TRUE))

#Use the cbind and rbind function on your dataset

v1 <- house$`Sale Price`
v2 <- house$addr_full
cblind (v1, v2)
rblind (v1, v2)
  
#Split a string, then concatenate the results back together
install.packages("stringr")
library ("stringr")
address=data.frame(address)
str_c(address,sep = "", collapse = NULL, ignore_null = TRUE)


