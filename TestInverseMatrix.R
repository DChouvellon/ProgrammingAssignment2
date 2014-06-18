source('makeMatrix.R')
#source('cachesolve.R')
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
cacheSolve( m ) # "getting cached data"
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