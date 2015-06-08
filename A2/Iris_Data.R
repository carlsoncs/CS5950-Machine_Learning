 library(MASS)
# Load the data from the generated training and testing data files.


virg_train = read.csv("../Iris_Data/Iris-virginica_train.csv")
vers_train = read.csv("../Iris_Data/Iris-versicolor_train.csv")
set_train = read.csv("../Iris_Data/Iris-setosa_train.csv")
test = read.csv("../Iris_data/iris_test.csv")


vir.glm.model=glm(Species~Sepal_Length + Sepal_Width
		+ Petal_Length + Petal_Width, data=virg_train,
		family=binomial)
 

vir.glm.probs=predict(vir.glm.model,test, type="response")
vir.glm.preds=rep("other", nrow(test))
vir.glm.preds[vir.glm.probs < 0.5]="Iris-virginica"

# vir.glm.preds

 table(test$Species, vir.glm.preds)
 mean(vir.glm.preds==test$Species)

#  GLM for setosa
 set.glm.model=glm(Species~Sepal_Length + Sepal_Width
 		+ Petal_Length + Petal_Width, data=set_train,
 		family=binomial)
# 
# #summary(set.glm.model)
# 
 set.glm.probs=predict(set.glm.model, test, type="response")
 set.glm.preds=rep("other", nrow(test))
 set.glm.preds[set.glm.probs < 0.5]="Iris-setosa"
# 
# # set.glm.preds
# 
 table(test$Species, set.glm.preds)
 mean(set.glm.preds==test$Species)
 
 
# # GLM for Versicolor
 ver.glm.model=glm(Species~Sepal_Length + Sepal_Width
 		+ Petal_Length + Petal_Width, data=vers_train,
 		family=binomial)
 
# # summary(ver.glm.model)
# 
 ver.glm.probs=predict(ver.glm.model, test, type="response")
 ver.glm.preds=rep("other", nrow(test))
 ver.glm.preds[ver.glm.probs < 0.5]="Iris-versicolor"
 
# # ver.glm.preds
 table(test$Species, ver.glm.preds )
 mean(ver.glm.preds==test$Species)
 
 
 ### Linear Discriminant Analysis ###
 print("LINEAR DISCRIMINANT ANALYSIS")

 
 # LDA for virginica
 vir.lda.model=lda(Species~Petal_Length + Petal_Width + Sepal_Length + Sepal_Width, data=virg_train)
 vir.lda.pred=predict(vir.lda.model,test)
 table(vir.lda.pred$class, test$Species)
 
 
 # LDA for setosa
 
 
 set.lda.model=lda(Species~Petal_Length + Petal_Width + Sepal_Length + Sepal_Width, data=set_train)
 set.lda.pred=predict(set.lda.model, test)
 table(set.lda.pred$class, test$Species)
 
 # LDA for versicolor
 ver.lda.model=lda(Species~Petal_Length + Petal_Width + Sepal_Length + Sepal_Width, data=vers_train)
 ver.lda.pred=predict(ver.lda.model, test)
 table(ver.lda.pred$class, test$Species)
 
 
 ### QUADRATIC DISCRIMINANT ANALYSIS ###
 
 print("QUADRATIC DISCRIMINANT ANALYSIS")

 # QDA for virginica
 vir.qda.model=qda(Species~Petal_Length + Petal_Width + Sepal_Length + Sepal_Width, data=virg_train)
 vir.qda.pred=predict(vir.qda.model,test)
 table(vir.qda.pred$class, test$Species)
 
 
 # QDA for setosa
 
 set.qda.model=qda(Species~Petal_Length + Petal_Width + Sepal_Length + Sepal_Width, data=set_train)
 set.qda.pred=predict(set.qda.model, test)
 table(set.qda.pred$class, test$Species)
 
 # QDA for versicolor
 ver.qda.model=qda(Species~Petal_Length + Petal_Width + Sepal_Length + Sepal_Width, data=vers_train)
 ver.qda.pred=predict(ver.qda.model, test)
 table(ver.qda.pred$class, test$Species)
 
