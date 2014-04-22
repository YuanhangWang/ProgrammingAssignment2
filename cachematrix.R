## This R file contains two functions: makeCacheMatrix and cacheSolve,
## they are built for saving computation and time when you use the
## inverse of a matrix repeatedly.

## @Return
##   a matrix object which can cache its inverse
## @x
##   the matrix which use its inverse repeatedly

makeCacheMatrix <- function(x = matrix()) {
  x.inv <- NULL
  set.matrix <- function(m) {
    x <<- m
    x.inv <- NULL
  }
  get.matrix <- function() {
    x
  }
  set.inverse <- function(inverse) {
    x.inv <<- inverse
  }
  get.inverse <- functoin() {
    x.inv
  }
  list(set.matrix = set.matrix, get.matrix = get.matrix,
       set.inverse = set.inverse, get.inverse = get.inverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
