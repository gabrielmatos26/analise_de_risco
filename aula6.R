setwd('F:/Analise_de_risco/R')
library(plot3D)
exp3 <- read.csv("exp3.csv", header=FALSE)
t <- table(exp3[,1],exp3[,2])
hist3D(1:6,1:6,t/length(exp3[,1]))


# lista2
c <- rbinom(100, 1, 0.5)
mean(c)
var(c)

d <- sample(1:6, 10, replace = T, prob = rep(1/6, 6))
mean(d)
var(d)


c2 <- sample(0:1, 100, rep = T, prob = c(1/2,1/2))
w<-matrix(c2, ncol=2, byrow=T)
s <- apply(w, 1, sum)
mean(s)
var(s)
