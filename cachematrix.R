## Functions that can compute and cache the inverse of a matrix.
## Note: This is the updated version - the problem with the previous version was
##		 that we could set something which is not the real inverse of the matrix object,
##		 with setInv()/setInverse().
## For Evaluation: please look at the previous commit (which is probably what 
##				   the instructors expect us to do).


## This function creates a matrix object that can compute, and cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
	## Create a matrix object that can compute and cache its inverse.
	inverse <- NULL
	
	getMatrix <- function() {
		x
	}
	
	setMatrix <- function(mat) {
		x <<- mat
		inverse <<- NULL
	}
	
	getInverse <- function() {
		if(is.null(inverse))
			inverse <<- solve(x)
		inverse
	}
	
	list(get = getMatrix, set = setMatrix, getInv = getInverse)
}


## Update: this cacheSolve function don't really have a purpose
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    x$getInv()
}
