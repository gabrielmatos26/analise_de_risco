setwd('/home/gabriel/Documents/UFRJ/Analise de Risco/Lista 1/Parte 2')
library(plot3D)

## Exercicio 2
exp2 <- read.csv("exp2.csv", header=FALSE)
exp4 <- read.csv("exp4.csv", header=FALSE)

## Exercicio 3
t2_1 <- table(exp2[,1])/length(exp2[,1])
t2_2 <- table(exp2[,2])/length(exp2[,2])
t4_1 <- table(exp4[,1])/length(exp4[,1])
t4_2 <- table(exp4[,2])/length(exp4[,2])

hist2_1 <- hist(exp2[,1], plot=F)
hist2_1$counts <- hist2_1$counts/sum(hist2_1$counts)
plot(hist2_1)


hist2_2 <- hist(exp2[,2], plot=F)
hist2_2$counts <- hist2_2$counts/sum(hist2_2$counts)
plot(hist2_2)


hist4_1 <- hist(exp4[,1], plot=F)
hist4_1$counts <- hist4_1$counts/sum(hist4_1$counts)
plot(hist4_1)


hist4_2 <- hist(exp4[,2], plot=F)
hist4_2$counts <- hist4_2$counts/sum(hist4_2$counts)
plot(hist4_2)

persp(z=table(exp2), theta = 60)
persp(z=table(exp4), theta = 60)

## Exercicio 4

prob2 <- table(exp2[,1], exp2[,2])/length(exp2[,1])
prob4 <- table(exp4[,1], exp4[,2])/length(exp4[,1])


