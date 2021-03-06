% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_popularity_bias.R
\name{get_ncitations_genes}
\alias{get_ncitations_genes}
\title{Get the number of times of gene is mentioned in the pubmed literature}
\usage{
get_ncitations_genes(file = "ftp://ftp.ncbi.nih.gov/gene/DATA/gene2pubmed.gz")
}
\arguments{
\item{file}{A file containing a data frame denoting the pubmed ids in which a particular gene entrez of a particulat species is mentioned (variables: taxid, entrez, pubmedid). Default = "ftp://ftp.ncbi.nih.gov/gene/DATA/gene2pubmed.gz"}
}
\value{
A data.frame with following variables: entrez, ncitations, symbol,entrez_mouse, symbol_mouse
}
\description{
\code{get_ncitations_genes}: Get the number of times of gene is mentioned in the pubmed literature
}
\examples{
\dontrun{
ncitations = get_ncitations_genes(file = "ftp://ftp.ncbi.nih.gov/gene/DATA/gene2pubmed.gz")
}

}
