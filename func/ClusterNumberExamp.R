# estimating the number of clusters
# number of centers for a kmeans method
library(cluster)
library(factoextra)
# from the dataset of arrests per state in the US
df <- USArrests
# cleaning the data
df <- na.omit(df)
# centaring and scaling to SD
# generic function default method centers and scales the columns
df <- scale(df)
df

fviz_nbclust(df, kmeans, method = "wss")
# the change is at k = 4
set.seed(1234)
km <- kmeans(df, centers = 4, nstart = 25)
km
finaldata <- cbind(USArrests, cluster = km$cluster)

