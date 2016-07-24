## Following fuctions create special object which stored matrix and caches the inverse of matrix
## so that matrix inverse needs to be calculated only once
## reducing execution time when inverse of matrix is need to be calculated multiple times.
## These functions assume that input matrix is always invertible.

## Function that creates matrix object that could also store inverse of matrix
## It also contains methods to retrieve original matrix and cached inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        mi <- NULL
        
        getInverse <- function()
                mi
        setInverse <- function(xi)
                mi <<- xi
        getMatrix <- function()
                x
        setMatrix <- function(z) {
                x <<- z
                mi <<- NULL
        }
        list (
                getInverse = getInverse,
                setInverse = setInverse,
                getMatrix = getMatrix,
                setMatrix = setMatrix
        )
}


## If inverse is not calculated computes the inverse and stores in cache,
## else returns inverse from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        if (is.null(x$getInverse())) {
                print("solving inverse of matrix")
                x$setInverse(solve(x$getMatrix()))
        }
        else{
                print("returning cache value")
        }
        x$getInverse()
}
