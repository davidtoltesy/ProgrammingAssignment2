## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    ##Holds the cached value or NULL
    inverseCache <- NULL 
    
    ##Setting and storing the matrix. Y is the new value.
    setMatrix <- function(y){
        x <<- y
        ##Flushing the cache
        inverseCache <<- NULL
        }
    
    ##Get and return the stored matrix
    getMatrix <- function() {
        x
        }
        
    ##Setting and caching the argument
    setInverse <- function(solveMatrix) {
        inverseCache <<- solveMatrix
        }
        
    ##Get and return the cached value    
    getInverse <- function() {
        inverseCache
        } 
    
    ##Return a list
    list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    ##Check if there is a cached inversion
    inverseCache <- x$getInverse()
    
        ##If there is a cached version, return it!
        if(!is.null(inverseCache)) {
            message("Getting cached data")
            return(inverseCache)
    }
    
    ##If there is no cached version, calculate new one
    data <- x$getMatrix()
        inverseCache <- solve(data, ...)
    ##And set it into the cache    
    x$setInverse(inverseCache)
        inverseCache
}
