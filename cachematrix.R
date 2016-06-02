## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
#Following the makevector example: Caching inverse of a matrix

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}
## TEST:
## x = matrix(rnorm(1:100),10,10)
## y = makeCacheMatrix(x)
## y$get()

## No cache in the first run
##> cacheSolve(y)
##[,1]        [,2]        [,3]        [,4]        [,5]        [,6]       [,7]        [,8]        [,9]       [,10]
##[1,] -0.36731092  0.14154572 -0.21348813 -0.63338089 -0.35874524 -0.65249276 -1.5130832 -0.71471179 -0.31060078 -0.77967911
##[2,] -0.35724930  0.23119804 -0.19480098 -0.26951148 -0.32358675 -0.21262999 -1.0754902 -0.72889398 -0.46062498 -0.10753693
##[3,] -0.59947592  1.14497099  0.09321880 -2.45916397 -0.56102611 -1.04036643 -4.1874725 -0.70477391 -1.53538759 -1.20546075
##[4,]  0.04638829  0.02624638 -0.02513091  1.11304557  0.68419198  0.55868114  1.9965936  0.03646695  0.53473756  0.97527358
##[5,] -0.55170486  0.52077241 -0.01804526 -1.81658287 -0.67702833 -1.26640740 -3.3122081 -0.54009092 -1.16508007 -1.13417819
##[6,] -0.34640361  0.30148476  0.18681252 -1.33919402 -0.42046775 -0.75457817 -1.9398974  0.35948686 -0.46038820 -0.84698550
##[7,]  0.09005075 -0.07665108  0.39374568  0.08319635  0.24386133  0.21653505  0.2717096 -0.01148443 -0.01329739  0.12461641
##[8,] -0.02935822  0.08237105  0.14422971  0.10372334  0.19135958 -0.04502481  0.3207808  0.57824340 -0.16129193 -0.04513298
##[9,] -0.05585428 -0.13991023 -0.29394410  0.51742286 -0.07803405  0.03277633  0.1127925 -0.44588228  0.44937995  0.12783377
##[10,]  0.21560561  0.01506595  0.31039929  0.21027629  0.01293712  0.02499983  0.5674800  0.42391696 -0.06467507  0.02307353
##> cacheSolve(y)
##getting cached data.
##[,1]        [,2]        [,3]        [,4]        [,5]        [,6]       [,7]        [,8]        [,9]       [,10]
##[1,] -0.36731092  0.14154572 -0.21348813 -0.63338089 -0.35874524 -0.65249276 -1.5130832 -0.71471179 -0.31060078 -0.77967911
##[2,] -0.35724930  0.23119804 -0.19480098 -0.26951148 -0.32358675 -0.21262999 -1.0754902 -0.72889398 -0.46062498 -0.10753693
##[3,] -0.59947592  1.14497099  0.09321880 -2.45916397 -0.56102611 -1.04036643 -4.1874725 -0.70477391 -1.53538759 -1.20546075
##[4,]  0.04638829  0.02624638 -0.02513091  1.11304557  0.68419198  0.55868114  1.9965936  0.03646695  0.53473756  0.97527358
##[5,] -0.55170486  0.52077241 -0.01804526 -1.81658287 -0.67702833 -1.26640740 -3.3122081 -0.54009092 -1.16508007 -1.13417819
##[6,] -0.34640361  0.30148476  0.18681252 -1.33919402 -0.42046775 -0.75457817 -1.9398974  0.35948686 -0.46038820 -0.84698550
##[7,]  0.09005075 -0.07665108  0.39374568  0.08319635  0.24386133  0.21653505  0.2717096 -0.01148443 -0.01329739  0.12461641
##[8,] -0.02935822  0.08237105  0.14422971  0.10372334  0.19135958 -0.04502481  0.3207808  0.57824340 -0.16129193 -0.04513298
##[9,] -0.05585428 -0.13991023 -0.29394410  0.51742286 -0.07803405  0.03277633  0.1127925 -0.44588228  0.44937995  0.12783377
##[10,]  0.21560561  0.01506595  0.31039929  0.21027629  0.01293712  0.02499983  0.5674800  0.42391696 -0.06467507  0.02307353
