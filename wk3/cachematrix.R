## Matrix inversion can be costly, therefore caching the inverse can provide performance benefits
## These functions create and cache inverse matrices

## This function creates a special "matrix" object that can cache its inverse 

makeCacheMatrix <- function(x = matrix()) {
  invs <- NULL
  set <- function(y) {
    x <<- y
    invs  <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) invs <<- inverse
  getInverse <- function() invs
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## This function computes the inverse of the special matrix created by makeCacheMatrix

cacheSolve <- function(x, ...) {
  invs <- x$getInverse()
  if(!is.null(invs)) {
    message("getting cached data")
    return(invs)
  }
  mtx <- x$get()
  invs <- solve(mtx, ...)
  x$setInverse(invs)
  invs
}
