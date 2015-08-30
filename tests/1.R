test.examples <- function()
{
   TestData <- read.table("test.txt",sep="\t", header= TRUE)
   TestData1 <- data.frame(S1=c(1,2,3,4),
                    S2=c(1,1,0,0),
				   S3=c(7.9,6.3,9.5,11.5),
				   s4=c(0,0,1,1))
  
  
  checkIdentical(TestData1, convert(TestData))
}
 
