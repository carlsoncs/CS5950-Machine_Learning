data(iris)

# Segment the Data into Training and Testing Datasets.

# Gather all the pertinent variables into three binary lists such that
# each variable can be compared against the other two.  Then the most
# likely is the one with the highest probability of all three.


## Implementation note, this may not be the best way to handle this
## (making two different data frames, then remerging into one, but
## R remains quite intractible at times and so I settled for something
## that works.

virginica=iris[iris$Species=='virginica',]
versicolor=iris[iris$Species=='versicolor',]
setosa=iris[iris$Species=='setosa',]

not_virginica=iris[iris$Species!='virginica',]
not_versicolor=iris[iris$Species!='versicolor',]
not_setosa=iris[iris$Species!='setosa',]

not_virginica$Species <- "Other"
not_setosa$Species <- "Other"
not_versicolor$Species  <- "Other"

virginica = rbind(virginica, not_virginica)
setosa = rbind(setosa, not_setosa)
versicolor = rbind(versicolor, not_versicolor)

# Generate and Test a General Linear Model.
# Sepal.Length Sepal.Width Petal.Length Petal.Width
vir.glm.model=glm(Species~Sepal.Length + Sepal.Width
		+ Petal.Length + Petal.Width, data=virginica,
		family=binomial)
# summary(vir.glm.model)

vir.glm.probs=predict(vir.glm.model, type="response")
vir.glm.preds=rep("other", nrow(virginica))
vir.glm.preds[vir.glm.probs < 0.5]="virginica"

# vir.glm.preds

table(virginica$Species, vir.glm.preds)
mean(vir.glm.preds==virginica$Species)
set.glm.model=glm(Species~Sepal.Length + Sepal.Width
		+ Petal.Length + Petal.Width, data=setosa,
		family=binomial)

#summary(set.glm.model)

set.glm.probs=predict(set.glm.model, type="response")
set.glm.preds=rep("other", nrow(setosa))
set.glm.preds[set.glm.probs < 0.5]="setosa"

# set.glm.preds

table(setosa$Species, set.glm.preds)
mean(set.glm.preds==setosa$Species)
ver.glm.model=glm(Species~Sepal.Length + Sepal.Width
		+ Petal.Length + Petal.Width, data=versicolor,
		family=binomial)

# summary(ver.glm.model)

ver.glm.probs=predict(ver.glm.model, type="response")
ver.glm.preds=rep("other", nrow(versicolor))
ver.glm.preds[ver.glm.probs < 0.5]="versicolor"

# ver.glm.preds
table(versicolor$Species, ver.glm.preds )
mean(ver.glm.preds==versicolor$Species)


# Linear Discriminant Analysis
library(MASS)
vir.lda.model=lda(Species~Petal.Length + Petal.Width + Sepal.Length +
		  Sepal.Width, data=virginica)
