library('RUnit')
 
source('test1.R')
 
test.suite <- defineTestSuite("examples",
                              dirs = file.path("tests"),
                              testFileRegexp = '^\\d+\\.R')
 
test.result <- runTestSuite(test.suite)
 
printTextProtocol(test.result)