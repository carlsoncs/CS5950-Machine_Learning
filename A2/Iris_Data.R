## IF necessary, install the VGAM library
# install.packages("VGAM")
  library(MASS)
  library(VGAM)
 # Load the data
  data(iris)


 # Partition the data into training and testing data.

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

 ### Logistic Regression ###
 
 # Using the vglm function for multinomial categorical data is a bit 
 # different than we are used to.  This link is an excellent reference
 # for the lglm function: https://www.stat.auckland.ac.nz/~yee/VGAM/doc/VGAMrefcard.pdf
  print("Logistic Regression")
  
 
  
  glm.model=vglm(Species~cbind(Sepal.Length, Sepal.Width, Petal.Length,
					Petal.Width), family=multinomial, data=iris_train)
  glm.prob=as.data.frame(predict(glm.model, iris_test, type="response"))
  glm.pred=rep("Iris-virginica", nrow(iris_test))
  glm.pred[glm.prob$setosa > 0.66] = "Iris-setosa"
  glm.pred[glm.prob$versicolor > 0.66] = "Iris-versicolor"
 
  table(glm.pred, iris_test$Species)


 ### Linear Discriminant Analysis ###
  print("LINEAR DISCRIMINANT ANALYSIS")

  lda.model=lda(Species~., data=iris_train)
  lda.pred=predict(lda.model, iris_test)
  table(lda.pred$class, iris_test$Species)


 ### QUADRATIC DISCRIMINANT ANALYSIS ###

  print("QUADRATIC DISCRIMINANT ANALYSIS")

  qda.model=qda(Species~., data=iris_train)
  qda.pred=predict(qda.model, iris_test)
  table(qda.pred$class, iris_test$Species)

