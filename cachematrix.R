
## There are two functions defined here. The first function takes an invertible matrix and 
## returns a list of functions which help in storing the inverse of the matrix in cache.
## The second function checks for the availability of the inverse of the matrix in cache.
## If available, it calls the value from cache. If not, it inverts the matrix and stores it 
## in the cache. 

## The makeCacheMatrix takes the matrix to be inverted as an input and returns a list
## of functions which helps in the storage and retrieval of the inverse matrix from cache. 

 makeCacheMatrix <- function(x = matrix()) {

	inv<-NULL

	get<-function() x
	
	setinverse<-function(y) inv<<-y

	getinverse<-function() inv

	list(get=get, setinverse=setinverse, getinverse=getinverse)
	
	}


## The cacheSolve function is used to inverse the matrix. It first checks the inverse
## in the cache and returns it, if available. If not, it creates the inverse and stores the 
## result in cache.

 cacheSolve <- function(x, ...) {

	inv<-x$getinverse()
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}
	data<-x$get()
	inv<-solve(data)
	x$setinverse(inv)
	inv
}
