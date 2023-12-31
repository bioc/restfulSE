% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/isbCgc.R
\name{isbCgcTables}
\alias{isbCgcTables}
\title{List the tables in a selected dataset}
\usage{
isbCgcTables(
  dataset = "TCGA_hg19_data_v0",
  billing = Sys.getenv("CGC_BILLING")
)
}
\arguments{
\item{dataset}{character string identifying a table in "isb-cgc"}

\item{billing}{Google BigQuery billing code, which can be set in an environment variable \code{CGC_BILLING}}
}
\value{
character vector
}
\description{
List the tables in a selected dataset
}
\examples{
if (interactive()) {
 # be sure that .cgcBilling is set
 code = Sys.getenv("CGC_BILLING")
 if (!(nchar(code)==0)) {
  isbCgcTables()
  }
}
}
