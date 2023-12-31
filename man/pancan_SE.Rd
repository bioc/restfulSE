% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pancan_SE.R
\name{pancan_SE}
\alias{pancan_SE}
\title{illustrate DelayedArray assay from BigQuery backend in SummarizedExperiment}
\usage{
pancan_SE(
  bqcon,
  colDataTableName = "clinical_PANCAN_patient_with_followup",
  clinVars = basic_clinvars(),
  colDSubjectIdName = "bcr_patient_barcode",
  colDFilterField = "acronym",
  colDFilterValue = "BRCA",
  assayDataTableName =
    "pancanMiRs_EBadjOnProtocolPlatformWithoutRepsWithUnCorrectMiRs_08_04_16_annot",
  assayFeatureName = "ID",
  assaySampleTypeCode = "TP",
  subjectIDName = "ParticipantBarcode",
  tumorFieldName = "Study",
  tumorFieldValue = "BRCA",
  assayValueFieldName = "miRNAexpr"
)
}
\arguments{
\item{bqcon}{a BigQueryConnection instance}

\item{colDataTableName}{character(1) defaulting to "clinical_PANCAN_patient_with_followup"}

\item{clinVars}{character() vector of variables to be retained from the table named by 'colDataTableName', defaults to vector returned by clinVars()}

\item{colDSubjectIdName}{character(1) defaulting to "bcr_patient_barcode"}

\item{colDFilterField}{character(1) defaulting to "acronym"}

\item{colDFilterValue}{character(1) defaulting to "BRCA"; a vector may be
used, in which case multiple tumor types will be 
represented -- must agree with tumorFieldValue, as clinical
and assay data are collected separately}

\item{assayDataTableName}{character(1) defaulting to "pancanMiRs_EBadjOnProtocolPlatformWithoutRepsWithUnCorrectMiRs_08_04_16_annot"}

\item{assayFeatureName}{character(1) defaulting to "ID"}

\item{assaySampleTypeCode}{character(1) defaulting to "TP"}

\item{subjectIDName}{character(1) defaulting to "ParticipantBarcode"}

\item{tumorFieldName}{character(1) defaulting to "Study"}

\item{tumorFieldValue}{character() defaulting to "BRCA"; a vector may be used in which case multiple tumor types will be represented -- must agree with colDFilterValue}

\item{assayValueFieldName}{character(1) defaulting to "miRNAexpr"}
}
\value{
an instance of SummarizedExperiment
}
\description{
illustrate DelayedArray assay from BigQuery backend in SummarizedExperiment
}
\note{
The parameters need different assignments for different tables.
Field names are not standardized across tables as of August 2018.  AUTHENTICATION CONCERNS:
You must have a valid BigQuery project identifier in the environment variable
CGC_BILLING, or pass such as 'billing' when using DBI::dbConnect(bigquery::bigrquery(), ...).
To get such a project identifier, you need to have a Google identity and you must
have created a BigQuery project with that identity.  Notes at 
\url{https://isb-cancer-genomics-cloud.readthedocs.io/en/latest/sections/progapi/bigqueryGUI/WalkthroughOfGoogleBigQuery.html} provide details.
Another approach that can be used involves the Google Cloud SDK.  Assuming you have
a Google identity and have installed a recent SDK instance, you can use (in the shell)
\code{gcloud auth login} to pick the identity that has a project with id
\code{PROJECT_ID}.  Use that project id as the billing code for bigrquery dbConnect,
or set CGC_BILLING in the environment to evaluate to that project id.
}
\examples{
if (interactive() & requireNamespace("DBI") & 
   requireNamespace("bigrquery")) {
     billco = Sys.getenv("CGC_BILLING")
     if (nchar(billco)==0) 
          stop("need CGC_BILLING set to your BigQuery project ID, see note in ?pancan_SE")
     bqcon = DBI::dbConnect(bigrquery::bigquery(), project = "pancancer-atlas", 
           dataset = "Annotated", billing = billco)
     brca_mirSE = pancan_SE(bqcon)
     brca_mirSE
     }
}
