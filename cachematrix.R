## This R file contains two functions: makeCacheMatrix and cacheSolve,
## they are built for saving computation and time when you use the
## inverse of a matrix repeatedly.

## A function create a matrix with caching function.
## @Return
##   a matrix object which can cache its inverse
## @x
##   the matrix which use its inverse repeatedly
makeCacheMatrix <- function(x = matrix()) {
  x.inv <- NULL
  ## function used to set matrix
  set.matrix <- function(m) {
    x <<- m
    x.inv <- NULL
  }
  ## function used to retrive matrix
  get.matrix <- function() {
    x
  }
  ## function used to set inverse
  set.inverse <- function(inverse) {
    x.inv <<- inverse
  }
  ## function used to retrive inverse
  get.inverse <- function() {
    x.inv
  }
  ## wrap these functions above
  list(set.matrix = set.matrix, get.matrix = get.matrix,
       set.inverse = set.inverse, get.inverse = get.inverse)
}


## Calculate inverse of the given matrix, if it has a cache, this
## function just return it, if not, this function will calculate
## inverse ad-hoc and cache it.
## @Return
##   The inverse of given matrix
## @ x
##   the matrix which you want to calculate its inverse
cacheSolve <- function(x, ...) {
  if(!is.null(x$get.inverse())) {  ## if the matrix has been cached, simply
                                   ## return its inverse
    message("--->Getting cached inverse...")
    x$get.inverse()
  } else {  # if it has not been cached, calculate inverse and cache it.
    x$set.inverse(solve(x$get.matrix()))
    x$get.inverse()
  }
}
