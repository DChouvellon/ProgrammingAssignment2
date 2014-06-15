se connecter sur :
  https://github.com/DChouvellon/ProgrammingAssignment2
cliquer sur 7 commits
  copy SHA-1 
7f657dd22ac20d22698c53b23f0057e1a12c09b7

Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than computing it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.

Write the following functions:
  
makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

For this assignment, assume that the matrix supplied is always invertible.

In order to complete this assignment, you must do the following:
Fork the GitHub repository containing the stub R files at https://github.com/rdpeng/ProgrammingAssignment2 to create a copy under your own account.
Clone your forked GitHub repository to your computer so that you can edit the files locally on your own machine.
Edit the R file contained in the git repository and place your solution in that file (please do not rename the file).
Commit your completed R file into YOUR git repository and push your git branch to the GitHub repository under your account.
Submit to Coursera the URL to your GitHub repository that contains the completed R code for the assignment.

?solve
# Examples

hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
h8 <- hilbert(8); h8
sh8 <- solve(h8)
str(h8)
# num [1:8, 1:8] 1 0.5 0.333 0.25 0.2 ...
str(sh8) 
# num [1:8, 1:8] 64 -2016 20160 -92400 221760 ...
round(sh8 %*% h8, 3) # produit matriciel 

A <- hilbert(4)
A[] <- as.complex(A)
## might not be supported on all platforms
sA<-try(solve(A))  
round(sA %*% A, 3) # produit matriciel 

The first function, makeVector creates a special "vector", 
which is really a list containing a function to

set the value of the vector
get the value of the vector
set the value of the mean
get the value of the mean

The following function calculates the mean of the special "vector" created
with the above function. 
However, it first checks to see if the mean has already been calculated.
If so, it gets the mean from the cache and skips the computation. 
Otherwise, it calculates the mean of the data and 
sets the value of the mean in the cache via the setmean function.

4. Commit your completed R file into YOUR git repository 
and push your git branch to the GitHub repository under your account.

5. Submit to Coursera the URL to your GitHub repository that 
contains the completed R code for the assignment.



Peer Assessments
/Programming Assignment 2: Lexical Scoping
Help 

due in 1wk 3d
Submission Phase
1.Do assignment

open in 1wk 3d
Evaluation Phase

2.Evaluate peers
in 2wk 3d
Results Phase
3.See results

source('makeVector.R')
source('cachemean.R')
t <- numeric(5)
> mean(t)
[1] 0 

trouvé dans forum
"Can we have a demonstration of the mean example?"
Thanks to Adam Gruer

#Call  the makeVector() function and assign it's
#  return value ( a list of four functions) to a variable, v
#  v is now a list of four functions
v <- makeVector()

#use v's set function to create a vector 
#  containing the numbers 20 through to 40
v$set(20:40)

#use v's get function to retrieve the vector created 
v$get()

#pass the list v to the cachemean() function
#   the mean of the numeric vector 20:40 should be returned
cachemean(v)

#pass the list v to the cachemean() function a second time
#  the mean of the numeric vector 20:40 should be returned
#  also a message "retrieving value from cache" indicating that the mean
#  is not being calculated this time but is being retrieved from the cached
#  value
cachemean(v)

#use v's set function to create a new vector 
#  containing the numbers 23,23,34.6,654.35
v$set(c(23,23,34.6,654.35))

#pass the list v to the cachemean() function
#   the mean of the numeric vector 23,23,34.6,654.35 should be returned
cachemean(v)

#pass the list v to the cachemean() function a second time
#  the mean of the numeric vector 23,23,34.6,654.35 should be returned
#  also a message "retrieving value from cache" indicating that the mean
#  is not being calculated this time but is being retrieved from the cached
#  value
cachemean(v)

#########################################################"
source('makeMatrix.R')
source('cachesolve.R')
trouvé dans forum
"Can we have a demonstration of the mean example?"
Thanks to Adam Gruer

#Call  the makeVector() function and assign it's
#  return value ( a list of four functions) to a variable, v
#  v is now a list of four functions
v <- makeVector()

#use v's set function to create a vector 
#  containing the numbers 20 through to 40
v$set(20:40)

#use v's get function to retrieve the vector created 
v$get()

#pass the list v to the cachemean() function
#   the mean of the numeric vector 20:40 should be returned
cachemean(v)

#pass the list v to the cachemean() function a second time
#  the mean of the numeric vector 20:40 should be returned
#  also a message "retrieving value from cache" indicating that the mean
#  is not being calculated this time but is being retrieved from the cached
#  value
cachemean(v)

#use v's set function to create a new vector 
#  containing the numbers 23,23,34.6,654.35
v$set(c(23,23,34.6,654.35))

#pass the list v to the cachemean() function
#   the mean of the numeric vector 23,23,34.6,654.35 should be returned
cachemean(v)

#pass the list v to the cachemean() function a second time
#  the mean of the numeric vector 23,23,34.6,654.35 should be returned
#  also a message "retrieving value from cache" indicating that the mean
#  is not being calculated this time but is being retrieved from the cached
#  value
cachemean(v)
  
Thanks to Scott Francis


# create cacheable matrix object
m<- makeCacheMatrix( )
m

# initailize with a an easy to inspect matrix 
m$set( matrix( c(0, 2, 2, 0 ), 2, 2))
m

# note use of parens to retrieve the matrix part of the object
m$get()
#     [,1] [,2]
#[1,]    0    2
#[2,]    2    0

# test the inverse cacher
cacheSolve( m ) 
# Error: could not find function "cacheSolve" 
cachesolve( m ) 
#       [,1] [,2]
# [1,]  0.0  0.5
# [2,]  0.5  0.0

# and again... should be cached now
cacheSolve( m ) 
# Error: could not find function "cacheSolve" 
cachesolve( m )
#getting cached data <-- NOTE THE MESSAGE
# ...

# test that the inverse works and experiment with how to use the functions
# m$get() returns the matrix and cacheSolve(m) returns the inverse that we can 
# use like regular matrices to do things like multilplications...
#
# product of matrix mult should be identity matrix AND we should get the cached message
m$get() %*% cacheSolve(m)
m$get() %*% cachesolve(m)
#getting cached data  <-- Yup... cached!
#     [,1] [,2]
#[1,]    1    0
#[2,]    0    1       <-- eye() think it's and identity Matrix...

# let R test identify for us
all.equal( diag(2), m$get() %*% cacheSolve(m) ) 
all.equal( diag(2), m$get() %*% cachesolve(m) )
# getting cached data <-- hey.. it's still cached
#[1] TRUE             <-- R agrees it's an identity

# save the inverse off and let's see if we can break it...
m1<- cacheSolve(m)
m1<- cachesolve(m)

# set m to some new values
m$set( matrix( rnorm(4), 2, 2) )

# does fetching the inverse without any pre-caching work?
all.equal( diag(2), m$get() %*% cacheSolve(m) )
all.equal( diag(2), m$get() %*% cachesolve(m) )
#[1] TRUE             <-- yup, sure does...

# what about testing m x the inverse we squirreled away in m1?
all.equal( diag(2), m$get() %*% m1 )
#[1] "Mean relative difference: xxxx"  <-- Nah... that's a train wreck.  

# try a bigger matrix and see if we can notice the caching effects
m$set( matrix( rnorm( 1000000 ), 1000, 1000 ) )
m$set( matrix( rnorm( 100000000 ), 10000, 10000 ) ) 
# Error: cannot allocate vector of size 762.9 Mb
cacheSolve(m)
cacheSolve(m)
cachesolve(m)
cachesolve(m) 
# [ reached getOption("max.print") -- omitted 990 rows ]
# on my quad i5, seems like the second call is faster...

# and double check it all still works...
all.equal( diag( 1000 ), m$get() %*% cacheSolve(m) ) 
all.equal( diag( 1000 ), m$get() %*% cachesolve(m) )
# getting cached data
# [1] TRUE
