is_unit <- function(x,y){
  a <- x^2; b <- y^2
  r <- sqrt(a+b);
  if (r <= 1){
    out <- 1
  }else{
    out <- 0
  }
  out
}
