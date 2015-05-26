reds=read.csv("winequality-red.csv")
whites=read.csv("winequality-white.csv")


reds.fit = lm(quality~., data=reds)
whites.fit = lm(quality~., data=whites)

summary(reds.fit)
summary(whites.fit)

reds.fit2 = lm(quality~volatile.acidity+chlorides+total.sulfur.dioxide+sulphates+alcohol, data=reds)
whites.fit2 = lm(quality~volatile.acidity+residual.sugar+free.sulfur.dioxide+sulphates+alcohol
								+density+pH+fixed.acidity, data=whites)

summary(reds.fit2)
summary(whites.fit2)