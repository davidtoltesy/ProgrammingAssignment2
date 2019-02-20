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

##-----Debuging the program-----

## > debug(cacheSolve)
## > cacheSolve(m1)
## debugging in: cacheSolve(m1)
## debug at ~/Documents/GitHub/ProgrammingAssignment2/cachematrix.R#40: {
##    inverseCache <- x$getInverse()
##    if (!is.null(inverseCache)) {
##        message("Getting the cached data")
##        return(inverseCache)
##    }
##    data <- x$getMatrix()
##    inverseCache <- solve(data, ...)
##    x$setInverse(inverseCache)
##    inverseCache
##}
## Browse[2]>
## debug at ## ~/Documents/GitHub/ProgrammingAssignment2/cachematrix.R#44: inverseCache <- x$getInverse()
## Browse[2]>
## debug at ~/Documents/GitHub/ProgrammingAssignment2/cachematrix.R#47: if (!is.null(inverseCache)) {
##    message("Getting the cached data")
##    return(inverseCache)
## }
## Browse[2]>
## debug at ~/Documents/GitHub/ProgrammingAssignment2/cachematrix.R#48: message("Getting the cached data")
## Browse[2]>
## Getting the cached data
## debug at ~/Documents/GitHub/ProgrammingAssignment2/cachematrix.R#49: return(inverseCache)
## Browse[2]>
## exiting from: cacheSolve(m1)
##           [,1]       [,2]       [,3]       [,4]
## [1,] -1.103614  0.4619003 -0.8468213  0.1603883
## [2,]  4.953622 -4.1491442  3.1038958  1.6461716
## [3,] -8.249267  6.7118825 -6.1928336 -2.7668901
## [4,]  4.932770 -4.8247051  3.8629930  1.8299655 