
convert <- function(n)
{
n$S4 <- ifelse(n$S3 >= mean(n$S3), 1, 0)
return(n);
}