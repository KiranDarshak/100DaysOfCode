# Scatterplots with ggplot2
#Scatter plots allow us to place points that let us see possible correlations between two features of a data set. 

library('ggplot2')
df <- mtcars
head(df)

#qplot()
qplot(wt,mpg,data=df)

# Adding a 3rd feature
# We can add a third feature by adding a color gradient on each point, or by resizing each point based on their value of this 3rd feature. 
qplot(wt,mpg,data=df,color=cyl)

qplot(wt,mpg,data=df,size=cyl)
qplot(wt,mpg,data=df,size=cyl,color=cyl)

# Show 4 features 
qplot(wt,mpg,data=df,size=cyl,color=hp,alpha=0.6)

pl <- ggplot(data=df,aes(x = wt,y=mpg)) 
pl + geom_point()
pl <- ggplot(data=df,aes(x = wt,y=mpg)) 
pl + geom_point(aes(color=cyl))

pl <- ggplot(data=df,aes(x = wt,y=mpg))

pl + geom_point(aes(color=factor(cyl)))

pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(size=factor(cyl)))
# With Shapes
pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(shape=factor(cyl)))
# Better version With Shapes
pl <- ggplot(data=df,aes(x = wt,y=mpg))
pl + geom_point(aes(shape=factor(cyl),color=factor(cyl)),size=4,alpha=0.6)

# Gradient Scales
pl + geom_point(aes(colour = hp),size=4) + scale_colour_gradient(high='red',low = "blue")

# Histograms with ggplot2
library(ggplot2)
df <- movies <- movies[sample(nrow(movies), 1000), ]

install.packages("ggplot2movies")
library(ggplot2movies)
head(df)

# Using qplot()
qplot(rating,data=df,geom='histogram',binwidth=0.1,alpha=0.8)
# ggplot(data, aesthetics)
pl <- ggplot(df,aes(x=rating))
# Add Histogram Geometry
pl + geom_histogram()
# Adding Color
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='red',fill='pink')

# Adding Labels
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='red',fill='pink') + xlab('Movie Ratings')+ ylab('Occurences') + ggtitle(' Movie Ratings')

# Change Alpha (Transparency)
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,fill='blue',alpha=0.4) + xlab('Movie Ratings')+ ylab('Occurences')
# Linetypes
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='blue',fill='pink',linetype='dotted') + xlab('Movie Ratings')+ ylab('Occurences')

# Advanced Aesthetics
# Adding Labels
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,aes(fill=..count..)) + xlab('Movie Ratings')+ ylab('Occurences')

# Adding Labels
pl <- ggplot(df,aes(x=rating))
pl2 <- pl + geom_histogram(binwidth=0.1,aes(fill=..count..)) + xlab('Movie Ratings')+ ylab('Occurences')
# scale_fill_gradient('Label',low=color1,high=color2)
pl2 + scale_fill_gradient('Count',low='blue',high='red')
# scale_fill_gradient('Label',low=color1,high=color2)
pl2 + scale_fill_gradient('Count',low='darkgreen',high='lightblue')

# Adding density plot
# Adding Labels
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(aes(y=..density..)) + geom_density(color='red')


