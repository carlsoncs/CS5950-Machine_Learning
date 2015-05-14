reds=read.csv("winequality-red.csv")
whites=read.csv("winequality-white.csv")

  # Standardize the Vectors
reds.pr.out=prcomp(reds)
whites.pr.out=prcomp(whites)


  # calculate the variance for each variable

reds.var = reds.pr.out$sdev^2
whites.var = whites.pr.out$sdev^2

  # Determine the total variance each varaible contributes to the whole

sum.reds.var = sum(reds.var)
sum.whites.var = sum(whites.var)

reds.percent_variance_explained = reds.var/sum.reds.var
reds.pve = reds.percent_variance_explained

whites.pve = whites.var/sum.whites.var

  # 
