## Comments that describe WHAT code does are useless. If the code is written
## well, descriptions are unnecessary, take up space, and cause mess.

## But sure, let's be bad programmers. This function creates a special "matrix" object
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix 
## if it doesn't exist, else retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        i <- x$getInverse()
        if(!is.null(i)) {
          message("getting cached data")
          return(i)
        }
        data <- x$get()
        i <-solve(data)
        x$setInverse(i)
        print(i)
}
