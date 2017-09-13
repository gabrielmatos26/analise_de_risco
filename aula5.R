setwd('F:/Analise_de_risco/R')
exp1 <- read.csv("exp1.csv", header=FALSE)
p <- table(exp1[,2])/50
v <- exp1[,2]
mean(v)
h <-hist(exp1[,2], density=T)
b <- barplot(table(exp1[,2]), 1:6)
h$counts <- h$counts/sum(h$counts)
plot(h)

