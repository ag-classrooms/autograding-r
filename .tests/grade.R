knitr::opts_chunk$set(purl=FALSE, quiet = TRUE)
knitr::purl("assignment.Rmd",output=".tests/testthat/solutions.R")
testthat::test_dir('.tests/testthat/')
