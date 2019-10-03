# CSV Input and Output

# Pass in the entire file path if not in same directory
ex <- read.csv('example.csv')

# Check structure
str(ex)

# Check column names
colnames(ex)

df <- data.frame(ex)
head(df)

help(read.csv) # Gives detailed description on usage commands

#read.table
read.table('example.csv') # The output is not clean

read.table(file = 'example.csv', sep = ',') # Add delimiters

# Output to csv
write.csv(df, file = "foo.csv")
write.csv(df, file = "foo.csv",row.names = FALSE)

# Excel Files with R
library(readxl)

# Call info from the sheets using read_excel
df <- read_excel('Sample-Sales-Data.xlsx',sheet='Sheet1')

head(df)
sum(df['Value'])
str(df)
summary(df)

# If you had multiple sheets that you wanted to import into a list, 
#    you could do this with lapply():

entire_workbook <- lapply(excel_sheets("Sample-Sales-Data.xlsx"), 
                          read_excel, 
                          path = "Sample-Sales-Data.xlsx")
entire_workbook

# Web Scraping with R

install.packages('xml2')
library('xml2')
install.packages("magrittr") 
install.packages("dplyr") 
library(dplyr)
library(magrittr)

install.packages('nycflights13',repos = 'http://cran.us.r-project.org')

library(nycflights13)
summary(flights)

# Note the size of the data frame:
dim(flights)

# filter()
#we select all flights on November 3rd that were from 
#American Airlines (AA):

head(flights[flights$month == 11 & flights$day == 3 & flights$carrier == 'AA', ])
install.packages('tidyr',repos = 'http://cran.us.r-project.org')

library(tidyr)
library(data.table)

# Creating a sample dataset
comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)
df

# gather()
# Using Pipe Operator
head(df %>% gather(Quarter,Revenue,Qtr1:Qtr4))

# With just the function
head(gather(df,Quarter,Revenue,Qtr1:Qtr4))

# spread()
stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks

stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)

stocksm %>% spread(time, price)

# separate()
# Given either regular expression or a vector of character positions, separate() turns a single character column into multiple columns.

df <- data.frame(x = c(NA, "a.x", "b.y", "c.z"))
df

head(mtcars)
unite_(mtcars, "vs.am", c("vs","am"),sep = '.')

# Separate is the complement of unite
mtcars %>%
  unite(vs_am, vs, am) %>%
  separate(vs_am, c("vs", "am"))
