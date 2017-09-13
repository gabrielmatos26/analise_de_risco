## Questao 1 - lista 3

n <- 5000

x <- runif(n,-1,1)
y <- runif(n,-1,1)
r <- sqrt(x^2+y^2)
circ <- length(r[r<=1])
pi <- 4*circ/n

