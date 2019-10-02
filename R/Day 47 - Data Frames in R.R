data()  # Lists all the built-in datasets in R

states <- state.x77 # imported a dataset
head(states) # view the top 6 

tail(states) # view the bottom 6 

str(states) # find the structure of the dataset

summary(states) # summary of a dataset

# Some made up weather data
days <- c('mon','tue','wed','thu','fri')
temp <- c(22.2,21,23,24.3,25)
rain <- c(TRUE, TRUE, FALSE, FALSE, TRUE)

df <- data.frame(days,temp,rain) # pass in vectors
df

# Check structure
str(df)

summary(df)

# Everything from first row
df[1,]

#Everything from first column
df[,1]

# Grab Friday data
df[5,]

# All rain values
df[,'rain']

# First 5 rows for days and temps
df[1:5,c('days','temp')]

df$rain # Gets output as a Vector
df['rain'] # Output as a dataframe

subset(df,subset=rain==TRUE)
subset(df,subset= temp>23) # Conditional comparison operator

sorted.temp <- order(df['temp']) # Sorting Temp 
sorted.temp

df[sorted.temp,] # Sorting a Dataframe

desc.temp <- order(-df['temp'])
desc.temp

df[desc.temp,]

sort.temp <- order(df$temp)
df[sort.temp,]

empty <- data.frame() # empty data frame

c1 <- 1:10 # vector of integers

c2 <- letters[1:10] # vector of strings

df <- data.frame(col.name.1=c1,col.name.2=c2)
df
# Row and columns counts
nrow(df)
ncol(df)
# Column Names
colnames(df)

# Row names (may just return index)
rownames(df)

vec <- df[[5, 2]] # get cell by [[row,col]] num

newdf <- df[1:5, 1:2] # get multiplt cells in new df

df[[2, 'col.name.1']] <- 99999 # reassign a single cell
df
# returns a data frame (and not a vector!)
rowdf <- df[1, ]
rowdf
# to get a row as a vector, use following
vrow <- as.numeric(as.vector(df[1,]))
vrow

# Both arguments are DFs)
df2 <- data.frame(col.name.1=2000,col.name.2='new' )
df2

# use rbind to bind a new row!
dfnew <- rbind(df,df2)
dfnew

df$newcol <- rep(NA, nrow(df)) # NA column
df

df[, 'copy.of.col2'] <- df$col.name.2 # copy a col
df

# Can also use equations!
df[['col1.times.2']] <- df$col.name.1 * 2
df

df3 <- cbind(df, df$col.name.1)
df3

# Rename second column
colnames(df)[2] <- 'SECOND COLUMN NEW NAME'
df

# Rename all at once with a vector
colnames(df) <- c('col.name.1', 'col.name.2', 'newcol', 'copy.of.col2' ,'col1.times.2')
df

first.ten.rows <- df[1:10, ] # Same as head(df, 10)
first.ten.rows

everything.but.row.two <- df[-2, ]
everything.but.row.two

# Conditional Selection
sub1 <- df[ (df$col.name.1 > 8 & df$col1.times.2 > 10), ]
sub1

sub2 <- subset(df, col.name.1 > 8 & col1.times.2 > 10)
sub2

df[, c(1, 2, 3)] #Grab cols 1 2 3
df[, c('col.name.1', 'col1.times.2')] # by name

df[, -1] # keep all but first column
df[, -c(1, 3)] # drop cols 1 and 3
# Dealing with Missing Data

any(is.na(df)) # detect anywhere in df

any(is.na(df$col.name.1)) # anywhere in col

df <- df[!is.na(df$col), ]

# replace NAs with something else
df[is.na(df)] <- 0 # works on whole df

df$col[is.na(df$col)] <- 999 # For a selected column

# Merging Dataframes
data()
## use character columns of names to get sensible sort order
authors <- data.frame(
  surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  deceased = c("yes", rep("no", 4)))
authors

books <- data.frame(
  name = I(c("Tukey", "Venables", "Tierney",
             "Ripley", "Ripley", "McNeil", "R Core")),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA,
                   "Venables & Smith"))
books

(m1 <- merge(authors, books, by.x = "surname", by.y = "name"))

(m2 <- merge(books, authors, by.x = "name", by.y = "surname"))
stopifnot(as.character(m1[, 1]) == as.character(m2[, 1]),
          all.equal(m1[, -1], m2[, -1][ names(m1)[-1] ]),
          dim(merge(m1, m2, by = integer(0))) == c(36, 10))

## "R core" is missing from authors and appears only here :
merge(authors, books, by.x = "surname", by.y = "name", all = TRUE)

## example of using 'incomparables'
x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5), data = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,NA,3,4,5), data = 1:5)
merge(x, y, by = c("k1","k2")) # NA's match
merge(x, y, by = "k1") # NA's match, so 6 rows
merge(x, y, by = "k2", incomparables = NA) # 2 rows
