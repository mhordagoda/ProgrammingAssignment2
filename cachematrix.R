## First function creats a special 'Matrix' object 

## This function returns a list of functions to set and retrieve the matrix and it's inverse


makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}

	get <- function() x
	setinv <- function(inverse) inv <<- inverse
	getinv <- function() inv
	list(set = set, get = get, setinv = setinv, getinv = getinv)

}

}


## Calculting the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
	if (!is.null(inv)) {			## If the inverse has already been calculated use the cached value 
		message("getting cached data")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$setinv(inv)
	inv
}
