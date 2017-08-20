setwd('F:/Analise_de_risco/R')
library(plot3D)
exp3 <- read.csv("exp3.csv", header=FALSE)
t <- table(exp3[,1],exp3[,2])
hist3D(1:6,1:6,t/length(exp3[,1]))


## Exercicio 1
c10 <- rbinom(10, 1, 0.5)
c100 <- rbinom(100, 1, 0.5)
mean10 <- mean(c10)
mean100 <- mean(c100)
var10 <- var(c10)
var100 <- var(c100)
## media teorica = 0.5 e variancia teorica = 0.25

## Exercicio 2
d10 <- sample(1:6, 10, replace = T, prob = rep(1/6, 6))
mean10 <- mean(d10)
var10 <- var(d10)
d100 <- sample(1:6, 100, replace = T, prob = rep(1/6, 6))
mean100 <- mean(d100)
var100 <- var(d100)
## media teorica = 0.35 e variancia teorica =~ 2.92


## Exercicio 3
c2 <- sample(0:1, 100, rep = T, prob = c(1/2,1/2))
w<-matrix(c2, ncol=2, byrow=T)
s <- apply(w, 1, sum)
mean(s)
var(s)

## Exercicio 4
c2 <- sample(1:6, 100, rep = T, prob = rep(1/6, 6))
w<-matrix(c2, ncol=2, byrow=T)
s <- apply(w, 1, sum)
mean(s)
var(s)

## Exercicio 5
u100 <- runif(100, 0, 1)
hist(u100, labels=T)
mean(u100)
var(u100)


## Exercicio 6
n100 <- rnorm(1000, 7, 1)
hist(n100, labels=T)
mean(n100)
var(n100)
