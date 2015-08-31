library(igraph)

TestData <- read.table("test.txt", sep="\t", header=TRUE) #Loading data from external file.
TestData$S4 <- ifelse(TestData$S3 >= mean(TestData$S3), 1, 0) #converting into dichotomous data.


###Giving prefixes to the different nodes.
myGraph <- graph.empty()
myGraph <- add.vertices(myGraph,nv=length(unique(TestData$S1)),
								attr=list(name=paste0('X',unique(TestData$S1)),
                                type=rep(TRUE,length(unique(TestData$S1)))))
								
myGraph <- add.vertices(myGraph,nv=length(unique(TestData$S4)),
								attr=list(name=paste0('Y',unique(TestData$S4)),
                                type=rep(FALSE,length(unique(TestData$S4)))))

##converting data to vector and using their names instead of index.
myGraphVector <- as.vector(t(as.matrix(data.frame(S1=paste0('X',TestData$S1),
                             S4=paste0('Y',TestData$S4)))))
							 
myGraph <- add.edges(myGraph,myGraphVector)
##Plotting the graph
plot.igraph(myGraph, layout=layout.bipartite,
               vertex.color=c("green","cyan")[V(myGraph)$type+1])