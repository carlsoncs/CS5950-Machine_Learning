data(iris)

# Segment the Data into Training and Testing Datasets.

n_test = floor((1/4)*nrow(iris))
n_train = nrow(iris) - n_test

set.seed(100) # This is required in order to make the sampling results
							# reproducable.

# Rather than sampling directly from the data, it is easier to set up
# the desired indices for one of the groups (supposing two groups)
# with a random sampling  algorithm on an array of indices which is the
# length of the data frame, and then use the indices to divide the data.
train_indices = sample(seq_len(nrow(iris)), size=n_train)

iris_train = iris[train_indices,]
iris_test = iris[-train_indices, ]


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
