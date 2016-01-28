## Put comments here that give an overall description of what your
## functions do

## First function is a list of functions which gets, sets values of matrix, 
## and gets ,sets values of inversed matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve =setsolve,
             getsolve = getsolve)
}

## This function checks if the data is cached, if no - solves the inversed matrix
## or else returns the cached matrix

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("Getting Cached Inverse")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
