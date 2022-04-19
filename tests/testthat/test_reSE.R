library(restfulSE)
library(rhdf5client)
library(restfulSEData)

context("connection")

#test_that("H5S_source completes", {
# hsds = H5S_source(URL_hsds())   # OBSOLETE!  VJC Apr 19 2022
# expect_true(is(hsds, "H5S_source"))
#})


context("indexing infrastructure")

test_that("sproc/isplit work", {
 expect_true(length(isplit(c(1,2,3,4,5,10,15,20,30:40)))==3)
 ii = isplit(c(1,2,3,4,5,10,15,20,30:40))
 ss = structure(c("0:5:1", "9:20:5", "29:40:1"), .Names = c("1", 
"2", "3"))
 expect_true(identical(ss, unlist(sproc(ii))))
 ii = isplit(c(1:10, seq(50,25,-5), seq(80,100,2)))
 ss = structure(c("0:10:1", "50:24:-5", "79:100:2"), 
                .Names = c("1", "2", "3"))
 expect_true(identical(ss, unlist(sproc(ii))))
})
