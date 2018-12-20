library(readr)
library(tibble)
install.packages("ggplot2", repos = "https://cran.rstudio.com", dependencies = TRUE)
library(ggplot2)
install.packages("ggplot")
library(MASS) #for kde2d

dataset <- read_csv("Desktop/UH/Fall2018/DM4335/Project4/Complex8_N15.csv")
View(dataset)

#get rid of indexes from original dataset
dataset$X1 = NULL
colnames(dataset) = c("V1", "V2", "classes")
Complex8_N15 = dataset #For Chan's code

#prep to plot the dataset
#make third attribute (class) a factor

#a function to graph the data point
#arguments: dataset and percentage of data to plot

plotdata <- function(dataset, class_index){
  classes = as.factor(dataset[[class_index]])
  
  qplot(dataset$V1, dataset$V2, colour = classes,
        xlab = "V1", ylab = "V2")
  
}


#TASK1 - VISUALIZE DATASET, THIRD ATTRIBUTE BY COLOR
plotdata(dataset, 3)
#END TASK1


#TASK2 - DESIGN OUTLIER DECTECTION TECHNIQUE
#Duong Nguyen - Density-based method

#density in 2D for dataset
#output: x and y range, then z is estimated density made from x and y ranges
#x, y store the grid points
f1 = kde2d(data$V1,data$V2, n = 50)
x= f1$x
y= f1$y
z= f1$z

#see the countour of 2D density
cols = function(k)rev(heat.colors(k)) 
filled.contour(f1, color.palette = cols, key.title = "2D Density Heat Map")

#index for x, y
x_ix= 1
y_ix= 1


#ols = outlier scores vector, initialize to 0's
ols= rep(0, nrow(dataset))


#for each datapoint, check to see where the datapoint should belong to on the x,y grid
#keep incrementing x_ix and y_ix while the V1 and V2 values of the datapoint are greater
#than the current values of x and y grid points
for (j in 1:nrow(dataset)){
  while(dataset$V1[j] > x[x_ix]){
    x_ix= x_ix+1
  }
  
  while(dataset$V2[j] > y[y_ix]){
    y_ix= y_ix+1
   
  }
  
  ols[j] = z[x_ix, y_ix]
  
  #reset x_ix and y_ix
  x_ix = 1
  y_ix = 1
 
}#end for


#Assign ols values to the new column in dataset named ols
X= dataset
X['ols'] = 1/ols

#TASK 3 
#Part b
#sort dataset according to ols
#ols smaller indicates it is more likely an outlier
#I didn't want to make it in a reverse scale because it might loose its precision since
#numbers are too small
X= X[order(X$ols, decreasing = TRUE),]


#Part c
#plot 7% outliers
indexes_7precent = c(1:as.integer(nrow(X)*0.07))
ols_7percent = X[indexes_7precent,]
plotdata(ols_7percent, 3)

#plot the rest 93% of data
ols_93percent = X[-indexes_7precent,]
plotdata(ols_93percent, 3)

#Put outliers and non-outliers together
ols_7percent2 = X
ols_7percent2['outlier'] = rep(1, nrow(ols_7percent2))
ols_7percent2[indexes_7precent, 5] = 0

plotdata(ols_7percent2, 5)


#Part d
#plot 14% outliers
indexes_14percent= c(1:as.integer(nrow(X)*0.14))
ols_14percent = X[indexes_14percent,]
plotdata(ols_14percent, 3)

#plot the rest 86%
ols_86percent= X[-indexes_14percent,]
plotdata(ols_86percent, 3)

#Put outliers and non-outliers together
ols_14percent2 = X
ols_14percent2['outlier'] = rep(1, nrow(ols_14percent2))
ols_14percent2[indexes_14percent, 5] = 0

plotdata(ols_14percent2, 5)



#Part e
#plot 21% outliers
indexes_21percent= c(1:as.integer(nrow(X)*0.21))
ols_21percent = X[indexes_21percent,]
plotdata(ols_21percent, 3)

#plot the rest 86%
ols_79percent= X[-indexes_21percent,]
plotdata(ols_79percent, 3)

#Put outliers and non-outliers together
ols_21percent2 = X
ols_21percent2['outlier'] = rep(1, nrow(ols_21percent2))
ols_21percent2[indexes_21percent, 5] = 0

plotdata(ols_14percent2, 5)


#part f-intepret


#part g
ols_21 = ggplot(data = ols_21percent, aes(ols))
hist_ols = ols_21 + stat_bin(bins = 10, color = "red", fill = "lightblue", binwidth = max(ols_21percent)/10) 
hist_ols + ggtitle("Histogram for ols values of top 21%") 

#END DUONG NGUYEN'S PART
