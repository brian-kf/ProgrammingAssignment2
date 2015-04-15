## Functions that can compute and cache the inverse of a matrix.

## "This function creates a matrix object that can cache its inverse." (from the README.md file)
makeCacheMatrix <- function(x = matrix()) {
	## Create a matrix object that can cache its inverse.
	inverse <- NULL
	
	getMatrix <- function() {
		x
	}
	
	setMatrix <- function(mat) {
		x <<- mat
		inverse <<- NULL
	}
	
	getInverse <- function() {
		inverse
	}
	
	setInverse <- function(inv) {
		inverse <<- inv
	}
	
	list(get = getMatrix, set = setMatrix, getInv = getInverse, setInv = setInverse)
}


## "This function computes the inverse of the special matrix returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache." (from the README.md file)
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getInv()
        
        ## If the inverse is not null, then we return the cached version
        if(!is.null(inverse)) {
        	print("Returning the cached inverse")
        	return(inverse)
        }
        
        ## Else, we compute the inverse, save it, and return it
        print("Computing the inverse and caching it")
        inverse <- solve(x$get())
        x$setInv(inverse)
        inverse
}
