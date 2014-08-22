##The following  two function create, store and recall a matrix and its inverse in or from cache  

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
##makeCacheMatrix creates custom matrix type capable of running four functions
m<-NULL
 set<-function(y){ 
 ##set stores the matrix in cache, get recalls the matrix
  x<<-y
  m<<-NULL #store matrix in cache
   }
   get<-function() x
    setmatrix<-function(solve) m<<- solve    #set inverse matrix
     getmatrix<-function() m      #get inverse matrix
     list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m<-x$getmatrix()  #query the x matrix's cache
           if(!is.null(m)){ #if there is a cache the inverse has been previously calculated
    message("getting cached data") # sent message indicating this is just cache 
    return(m)  # return the cache 
      }
  matrix<-x$get() # get the matrix used by makeCacheMatrix function 
  m<-solve(matrix, ...)  # calculate the inverse of the matrix
  x$setmatrix(m)   #store the inverse matrix in cache using the makeCacheMatrix set function
  m
}
