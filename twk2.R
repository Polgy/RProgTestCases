# credit: Roger Peng submit script for installing packages
# Author: Sergey Polgul

#usage example: test("WK01", "pollutant") to run all pluttant*.R tests

checkPkgs <- function() {
        pkg.inst <- installed.packages()
        pkgs <- c("testthat")
        have.pkg <- pkgs %in% rownames(pkg.inst)

        if(any(!have.pkg)) {
                cat("Some packages need to be installed\n")
                r <- readline("Install necessary packages [y/n]? ")
                if(tolower(r) == "y") {
                        need <- pkgs[!have.pkg]
                        message("installing packages ",
                                paste(need, collapse = ", "))
                        install.packages(need)
                }
        }
}

checkPkgs()


library(testthat)
 
test_dir('t/WK02', reporter = 'Summary')
