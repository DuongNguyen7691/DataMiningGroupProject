#Task 1

install.packages("ggplot2")
library(ggplot2)

ggplot(Complex8_N15, aes(x = Complex8_N15$V1, y = Complex8_N15$V2)) + geom_point() + ggtitle("Complex8_N15")
ggplot(Complex8_N15, aes(x = Complex8_N15$V1, y = Complex8_N15$V2)) + geom_point(aes(colour = factor(Complex8_N15$V3))) + ggtitle("Complex8_N15")


#Task 2

#Technique 1 - kNN_OutlierDetection

#KDistance
kdist = function(df, k_value){
  distanceMatrix = as.matrix(dist(df))
  kdist <- rep(0, nrow(df))
  for(i in 1:nrow(df)) {
    kdist[i] = (sort(distanceMatrix[i,]))[k_value+1]
  }
  return(kdist)
}

#Outlier Dectection
kNNOutlierDetection <- function(df, k_value){
  df$ols <- kdist(df[,-3], k_value)
  average <- mean(df$ols)
  outliers <- (df$ols >= average)
  outlier_percent <- round(sum(outliers == TRUE)/dim(df)[1]*100, digits = 2)
  coloring[outliers] = c("black")
  plot(data = df, V2 ~ V1, col = coloring, pch = 20, main = paste("K-value", k_value, "with", outlier_percent, "% of outliers"))
  
  return (df)
}

#Task 3
#a
coloring = rep("firebrick2", 3999)

par(mfrow=c(1,2))

X <- kNNOutlierDetection(Complex8_N15, 1)
X <- kNNOutlierDetection(Complex8_N15, 5)
X <- kNNOutlierDetection(Complex8_N15, 10)
X <- kNNOutlierDetection(Complex8_N15, 15)

par(mfrow=c(1,2))
X <- kNNOutlierDetection(Complex8_N15, 20)
X <- kNNOutlierDetection(Complex8_N15, 25)

X <- kNNOutlierDetection(Complex8_N15, 5) #I choose this

#b
min(X$ols)
max(X$ols)
X <- X[order(-X$ols),]
head(X)

#c 7%
p <- floor(.07 * 3999)
X.07 <- X[1:p,]
X.93 <- X[(p+1):3999,]

d.07 <- data.frame(x = X.07$V1, y = X.07$V2, class = factor(X.07$V3))
ggplot(d.07, aes(x = X.07$V1, y= X.07$V2)) + geom_point(aes(colour = factor(X.07$V3))) + ggtitle("7% of observations in X")
d.93 <- data.frame(x = X.93$V1, y = X.93$V2, class = factor(X.93$V3))
ggplot(d.93, aes(x = X.93$V1, y= X.93$V2)) + geom_point(aes(colour = factor(X.93$V3))) + ggtitle("93% of observations in X")


#d 14%
p <- floor(.14 * 3999)
X.14 <- X[1:p,]
X.86 <- X[(p+1):3999,]

d.14 <- data.frame(x = X.14$V1, y = X.14$V2, class = factor(X.14$V3))
ggplot(d.14, aes(x = X.14$V1, y= X.14$V2)) + geom_point(aes(colour = factor(X.14$V3))) + ggtitle("14% of observations in X")
d.86 <- data.frame(x = X.86$V1, y = X.86$V2, class = factor(X.86$V3))
ggplot(d.86, aes(x = X.86$V1, y= X.86$V2)) + geom_point(aes(colour = factor(X.86$V3))) + ggtitle("86% of observations in X")




#e 21%
p <- floor(.21 * 3999)
X.21 <- X[1:p,]
X.79 <- X[(p+1):3999,]

d.21 <- data.frame(x = X.21$V1, y = X.21$V2, class = factor(X.21$V3))
ggplot(d.21, aes(x = X.21$V1, y= X.21$V2)) + geom_point(aes(colour = factor(X.21$V3))) + ggtitle("21% of observations in X")
d.79 <- data.frame(x = X.79$V1, y = X.79$V2, class = factor(X.79$V3))
ggplot(d.79, aes(x = X.79$V1, y= X.79$V2)) + geom_point(aes(colour = factor(X.79$V3))) + ggtitle("79% of observations in X")


#g
hist(X.21$ols)
