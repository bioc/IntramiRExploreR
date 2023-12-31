% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.r
\docType{data}
\name{miRNA_ID_to_Function}
\alias{miRNA_ID_to_Function}
\title{Contains the miRNA function information from Flybase database.}
\format{
A data frame with 66 rows and 4 variables:
\describe{
  \item{miRNA}{miRNA name, miRNA symbol}
  \item{FBGN}{target gene name, gene symbol}
  \item{miRNAFunction}{miRNA function, from Flybase}
}
}
\source{
\url{http://flybase.org/}
}
\usage{
miRNA_ID_to_Function
}
\description{
A dataset containing the function for the intragenic miRNA.
}
\keyword{datasets}
