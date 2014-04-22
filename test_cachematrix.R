source("cachematrix.R")
## A function used to test cachematrix.R

## Testing function, default dimension of test matrix is 1000
test <- function(n = 1000) {
  size <- n^2
  print("--->Creating a nxn matrix with random number between -n^2:n^2 ...")
  ## Create test case
  test.case <- matrix(sample((-size):size, size = size), n, n)
  print(dim(test.case))
  print("--->Creating matrix using function makeCacheMatrix()...")
  ## Call makeCacheMatrix function
  cached.matrix <- makeCacheMatrix(test.case)
  print(paste("--->The class of matrix is:", class(cached.matrix)))
  print("--->Printing the matrix...")
  print(cached.matrix)
  print("--->Getting inverse of the matrix before caching...")
  ## Check inverse before it is cached, it should be NULL
  print(cached.matrix$get.inverse())
  print("--->Runing function cacheSolve()...")
  ## Check cacheSolve function, it should consume a few time.
  print(system.time(matrix.inverse <- cacheSolve(cached.matrix)))
  print(dim(cached.matrix$get.inverse()))
  print("--->Runing function cacheSolve() again...")
  ## Check cacheSolve function again, it should consume less time compared to
  ## the first time it is called.
  print(system.time(cacheSolve(cached.matrix)))
  print("matrix %*% matrix$get.inverse()")
  print(dim(cached.matrix$get.inverse()))
}