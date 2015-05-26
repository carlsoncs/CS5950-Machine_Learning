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

  # Reds PVE
  reds.pve
 
  # Whites PVE
  
  whites.pve


  # excluding the fixed acidity column gives:
reds.pr.out.n.fixed.acidity = prcomp(reds[,-1])
whites.pr.out.n.fixed.acidity = prcomp(whites[,-1])

reds.without.fixed.acidity.var = reds.pr.out.n.fixed.acidity$sdev^2
whites.without.fixed.acidity.var = whites.pr.out.n.fixed.acidity$sdev^2


sum.reds.without.fixed.acidity.var = sum(reds.without.fixed.acidity.var)
sum.whites.without.fixed.acidity.var = sum(whites.without.fixed.acidity.var)

reds.n.fixed.acidity.pve =  reds.without.fixed.acidity.var/sum.reds.without.fixed.acidity.var
whites.n.fixed.acidity.pve = whites.without.fixed.acidity.var/sum.whites.without.fixed.acidity.var

  # Reds PVE without Fixed Acidity
  
  reds.n.fixed.acidity.pve

  # Whites PVE without Fixed Acitdity
  
  whites.n.fixed.acidity.pve
