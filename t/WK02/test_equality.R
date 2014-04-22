#!/usr/bin/env R

set.seed(1713)

#M <- matrix(rnorm(100),10, 10)
M <- matrix(runif(10e6),nrow=1000, ncol=1000)
M <- M %*% t(M)

context("matrix inverse check")

XObj <- makeCacheMatrix (M)

t1<-system.time(I1<-cacheSolve(XObj))

# second run
message("\n  second call to cacheSolve")
t2<-system.time(I2<-cacheSolve(XObj))

EYE = diag(1,1000)


test_that ( "matrix is an inverse", {
                expect_equal(cacheSolve(XObj) %*% M, EYE, tolerance = 0.001, scale = 1)
              }
)

test_that("exec times reduced by caching", {
              expect_less_than(t2[[3]], t1[[3]]/1000)
            }
)

# not sure if it is in scope to test set() method
#XObj$set(M)
# redo some tests

