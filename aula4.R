x <- c(1,3,5,7,9)


m<-matrix(1:100, nrow=5, byrow=TRUE)

z <- outer(x,y,'+')
str(z)

x <- seq(-1,1,by=0.0005)
y <- seq(-1,1,by=0.0005)
circ <- Vectorize(is_unit)
c <- outer(x,y,circ)
f <- sum(c)/length(c)
pi <- f*4


x <- seq(-1,1,by=0.01)
y <- seq(-1,1,by=0.01)
sp <- Vectorize(sphere)
z <- outer(x,y,sp)
persp(x,y,z, col="red", phi=30, theta=-45, d=5)
