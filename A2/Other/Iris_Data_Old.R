# Here I am using .csv files, (generated in ruby), that has
# reformed the Species Category so that it contains either
# the name of the species of interest or 'other'.  This way
# I can use binomial models for the logistic regression.
virg_train = read.csv("Iris_Data/Iris-virginica_train.csv")
vers_train = read.csv("Iris_Data/Iris-versicolor_train.csv")
set_train = read.csv("Iris_Data/Iris-setosa_train.csv")
bin_test = read.csv("Iris_Data/iris_test.csv")


## Viriginica binomial logistic regression

vir.glm.model=glm(Species~ Petal_Length + Petal_Width,
		                   data = virg_train,
						   family = binomial)
						   
vir.glm.probs=predict(vir.glm.model,bin_test, type="response")
vir.glm.preds=rep("other", nrow(bin_test))
vir.glm.preds[vir.glm.probs < 0.5] = "Iris-virginica"
table(bin_test$Species, vir.glm.preds)


# Setosa Logistic Regression
set.glm.model=glm(Species~Sepal_Length + Sepal_Width
		+ Petal_Length + Petal_Width, data=set_train,
		family=binomial)
set.glm.probs <- predict(set.glm.model, bin_test, type="response")
set.glm.preds <- rep("other", nrow(bin_test))
set.glm.preds[set.glm.probs < 0.5] <-"Iris-setosa"
table(bin_test$Species, set.glm.preds)


# Versicolor Logistic Regression
ver.glm.model=glm(Species~Petal_Length + Petal_Width,
				  data=vers_train,
			      family=binomial)
ver.glm.probs=predict(ver.glm.model, bin_test, type="response")
ver.glm.preds=rep("other", nrow(bin_test))
ver.glm.preds[ver.glm.probs < 0.7]="Iris-versicolor"
table(bin_test$Species, ver.glm.preds )

