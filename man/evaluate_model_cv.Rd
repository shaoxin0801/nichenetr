% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parameter_optimization.R
\name{evaluate_model_cv}
\alias{evaluate_model_cv}
\title{Construct and evaluate a ligand-target model given input parameters with the purpose of evaluating cross-validation models.}
\usage{
evaluate_model_cv(parameters_setting, lr_network, sig_network, gr_network, settings, secondary_targets = FALSE, remove_direct_links = "no",...)
}
\arguments{
\item{parameters_setting}{A list containing following elements: $model_name, $source_weights, $lr_sig_hub, $gr_hub, $ltf_cutoff, $algorithm, $damping_factor, $correct_topology. See \code{prepare_settings_leave_one_in_characterization} and \code{add_hyperparameters_parameter_settings}.}

\item{lr_network}{A data frame / tibble containing ligand-receptor interactions (required columns: from, to, source)}

\item{sig_network}{A data frame / tibble containing signaling interactions (required columns: from, to, source)}

\item{gr_network}{A data frame / tibble containing gene regulatory interactions (required columns: from, to, source)}

\item{settings}{A list of lists for which each sub-list contains the following elements: .$name: name of the setting; .$from: name(s) of the ligand(s) active in the setting of interest; .$response: named logical vector indicating whether a target is a TRUE target of the possibly active ligand(s) or a FALSE.}

\item{secondary_targets}{Indicate whether a ligand-target matrix should be returned that explicitly includes putative secondary targets of a ligand (by means of an additional matrix multiplication step considering primary targets as possible regulators). Default: FALSE}

\item{remove_direct_links}{Indicate whether direct ligand-target and receptor-target links in the gene regulatory network should be kept or not. "no": keep links; "ligand": remove direct ligand-target links; "ligand-receptor": remove both direct ligand-target and receptor-target links. Default: "no"}

\item{...}{Additional arguments to \code{make_discrete_ligand_target_matrix}.}
}
\value{
A list containing following elements: $performances_target_prediction, $importances_ligand_prediction.
}
\description{
\code{evaluate_model_cv} will take as input a setting of parameters (data source weights and hyperparameters) and layer-specific networks to construct a ligand-target matrix and calculate the model's performance in target gene prediction and feature importance scores for ligand prediction).
}
\examples{
\dontrun{
library(dplyr)
settings = lapply(expression_settings_validation[1:4], convert_expression_settings_evaluation)
weights_settings_loi = prepare_settings_leave_one_in_characterization(lr_network,sig_network, gr_network, source_weights_df)
weights_settings_loi = lapply(weights_settings_loi,add_hyperparameters_parameter_settings, lr_sig_hub = 0.25,gr_hub = 0.5,ltf_cutoff = 0,algorithm = "PPR",damping_factor = 0.8,correct_topology = TRUE)
doMC::registerDoMC(cores = 8)
output_characterization = parallel::mclapply(weights_settings_loi[1:3],evaluate_model_cv,lr_network,sig_network, gr_network,settings,calculate_popularity_bias_target_prediction = TRUE, calculate_popularity_bias_ligand_prediction = TRUE, ncitations, mc.cores = 3)
}

}
