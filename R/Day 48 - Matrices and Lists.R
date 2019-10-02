# Creating a Matrix

1:10

v <- 1:10
v
matrix(v)
matrix(v,nrow=2)

matrix(1:12,byrow = FALSE,nrow=4)

matrix(1:12, byrow=TRUE, nrow=4)
#Creating Matrices from Vectors

goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)

stocks <- c(goog,msft)
stock.matrix <- matrix(stocks,byrow=TRUE,nrow=2)
stock.matrix
# Naming Matrices

days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')

colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

stock.matrix
# Factor and Categorical Matrices

animal <- c('d','c','d','c','c')
id <- c(1,2,3,4,5)
factor.ani <- factor(animal)
factor.ani

ord.cat <- c('cold','med','hot')

temps <- c('cold','med','cold','med','hot','hot','cold')
fact.temp <- factor(temps,ordered=TRUE,levels=c('cold','med','hot'))
fact.temp

summary(temps)
summary(fact.temp)
# Matrix Arithmetic

mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat

# Multiplication
2*mat

# Division (reciprocal)
1/mat

# Division
mat/2

# Power
mat ^ 2
# Comparison operators with matrices
mat > 17
# Matrix Arithmetic with multiple matrices
mat + mat

mat / mat

mat ^ mat
mat*mat

# Matrix multiplication
mat2 <- matrix(1:9, nrow=3)
mat2

# True Matrix Multiplication
mat2 %*% mat2

# Matrix Operations
# Prices
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)

# Put vectors into matrix
stocks <- c(goog,msft)
stock.matrix <- matrix(stocks,byrow=TRUE,nrow=2)

# Name matrix
days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

# Display
stock.matrix
colSums(stock.matrix)

rowSums(stock.matrix)
rowMeans(stock.matrix)
# Binding columns and rows

FB <- c(111,112,113,120,145)

tech.stocks <- rbind(stock.matrix,FB)
tech.stocks

avg <- rowMeans(tech.stocks)
avg

tech.stocks <- cbind(tech.stocks,avg)
tech.stocks

# Matrix Selection and Indexing
mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat

# Grab first row
mat[1,]
#Grab first column
mat[,1]
# Grab first 3 rows
mat[1:3,]

# Grab top left rectangle of:
# 1,2,3
# 11,12,13
#
mat[1:2,1:3]

# Grab last two columns
mat[,9:10]

# Grab a center square of:
# 15,16
# 25,26
mat[2:3,5:6]

# R Lists Basics#
# Create a vector
v <- c(1,2,3,4,5)

# Create a matrix
m <- matrix(1:10,nrow=2)

# Create a data frame
df <- women
v
m
df

# Using list()
li <- list(v,m,df)
li

li <- list(sample_vec = v,sample_mat = m, sample_df = df)
li

# Selecting objects from a list
# Single brackets
li[1] # By index

# By name
li['sample_vec']
class(li['sample_vec'])

# Use double brackets to actually grab the items
li[['sample_vec']]

# Can also use $ notation
li$sample_vec

li[['sample_vec']][1] # Second set of indexing

li[['sample_mat']]

li[['sample_mat']][1,]

li[['sample_mat']][1:2,1:2]

li[['sample_df']]['height']

# Combining lists
double_list <- c(li,li)
double_list

str(double_list)
