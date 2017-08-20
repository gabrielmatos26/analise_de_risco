sphere <- function(x,y){
  a <- x^2; b <- y^2
  r <- a+b;
  if (r < 1){
    out <- sqrt(1-a-b)
  }else{
    out <- 0
  }
  out
}