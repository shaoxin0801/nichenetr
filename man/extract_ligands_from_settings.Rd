% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluate_model_target_prediction.R
\name{extract_ligands_from_settings}
\alias{extract_ligands_from_settings}
\title{Extract ligands of interest from settings}
\usage{
extract_ligands_from_settings(settings,combination = TRUE)
}
\arguments{
\item{settings}{A list of lists for which each sub-list contains the information about (expression) datasets; with minimally the following elements: name of the setting ($name), ligands (possibly) active in the setting of interest ($from).}

\item{combination}{Indicate whether in case multiple ligands are possibly active ligand combinations should be extracted or only individual ligands. Default: TRUE.}
}
\value{
A list containing the ligands and ligands combinations for which a ligand-target matrix should be constructed. When for a particular dataset multiple ligands are possibly active (i.e. more than ligand in .$from slot of sublist of settings), then both the combination of these multiple ligands and each of these multiple ligands individually will be select for model construction.
}
\description{
\code{extract_ligands_from_settings} Extract ligands of interest from (expression) settings in correct to construct the ligand-target matrix.
}
\examples{
\dontrun{
ligands = extract_ligands_from_settings(expression_settings_validation)
}
}
