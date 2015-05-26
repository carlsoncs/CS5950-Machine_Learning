reds=read.csv("winequality-red.csv")
whites=read.csv("winequality-white.csv")


min_itr=1
max_itr=30

  # Determine the appropriate number of clusters to use. 
  
n_clusters_reds = (nrow(reds)-1)*sum(apply(reds,2,var))
n_clusters_whites = (nrow(whites)-1)*sum(apply(whites,2,var))

for (i in min_itr:max_itr) n_clusters_reds[i] <- sum(kmeans(reds,centers=i,iter.max =30)$withinss)
n_clusters_reds

for (i in min_itr:max_itr) n_clusters_whites[i] <- sum(kmeans(whites,centers=i,iter.max=30)$withinss)

lop_off=2
plot(lop_off:max_itr, n_clusters_reds[lop_off:max_itr], main="Red Wines Data", type="b", xlab="Number of Clusters", ylab="Within Groups Sum of Squares")
dev.new() # allows for a new plot window.
plot(lop_off:max_itr, n_clusters_whites[lop_off:max_itr], main="White Wines Data", type="b", xlab="Number of Clusters", ylab="Within Groups Sum of Squares")

  # Using the results of these plots, we can now propt the user to select 
  # his preferred k. 
  
  k.reds <- readline("Select preferred K for red wines")
  k.whites <- readline("Select preferred K for white wines")
  
  k.reds <- as.integer(k.reds)
  k.whites <- as.integer(k.whites)

  reds.fit <- kmeans(reds,k.reds, iter.max=30)
	whites.fit <- kmeans(whites,k.whites, iter.max=30)
	
	reds.fit
	whites.fit
	
  reds.clust <- split(reds$quality,reds.fit$cluster)
	whites.clust <- split(whites$quality, whites.fit$cluster)
	
	reds.clust
	whites.clust

  # aggregate(wine, by=list(fit$cluster), FUN = mean)

