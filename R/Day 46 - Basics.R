print('first line')
print('second line')
1+2
12.3+234.5
5-4
5-(-3)
30/4
2^4
4^4

100*2+50/2

100*(2+50)/2

5/2
5 %% 2 # mod function for getting the reminder

50 %% 4

name  <- 100  # assigning variable name
name

bank.accounts <-100  # name sepaerated with period.
bank.accounts
 deposit <-20
bank.accounts <-bank.accounts + deposit  # adding values to the variable
bank.accounts

class(bank.accounts)

name<-'hello'
class(name)  # class function to find the data types
class(T)
class(23.4)

nvec <- c(1,2,3,4,5)
nvec
class(nvec)
cvec<- c('U','S','A')
class(cvec)

v <-c(TRUE, 20, 40)

class(v) # all charecters are converted into Numeric!(Vectors)

temp <-c(76,80,45,56,77,90,100)
days <- c('Mon','Tue','Wed','Thur','Fri','Sat','Sun')
names(temp) <-days
temp

days <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temps <- c(1,2,3,4,5,6,7)
names(temps) <- days
temps
# Vector Indexing and Slicing: (Starts with 1 AND NOT ZERO AS IN PYTHON)
v1 <- c(100,200,300)
v2 <- c('a','b','c')
v1
v2
v1[2]
v2[3]
# Multiple Indexing:
v1[c(1,2)]
v2[c(2,3)]
v2[c(1,3)]
# Slicing:
v <- c(1,2,3,4,5,6,7,8,9,10)
v[2:5]
v[7:10]

v <- c(1,2,3,4)
names(v) <- c('a','b','c','d')
v['c']
v[c('a','c','b')]
v[v>2]
v>2
# Working with Vectors:
v1 <- c(1,2,3)
v2 <- c(5,6,7)
v1+v2

v1-v2

v1*v2

v1
sum(v1)


#check for standard deviation, variance, maximum element, minimum element, product of elements:
v <- c(12,45,100,2)

# Standard Deviation
sd(v)

#Variance
var(v)

# Maximum Element
max(v)

#Minimum Element
min(v)

# Product of elements
prod(v1)
prod(v2)
