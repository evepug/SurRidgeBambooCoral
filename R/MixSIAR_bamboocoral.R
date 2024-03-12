# MixSIAR------------------------------------------------------------------
library(MixSIAR)
#.libPaths()

# create output directory if doesn't exist already
if (!dir.exists("output")){dir.create("output")}

# Load mix data
mix <- load_mix_data(filename="datasets/surridge_bamboocoral_consumer.csv",
                     iso_names=c("d15N_alaphe","d15N_thrphe"),
                     factors=NULL,
                     fac_random=NULL,
                     fac_nested=NULL,
                     cont_effects=NULL)

# Load source data
source <- load_source_data(filename="datasets/Doherty_source_endmembers.csv",
                           source_factors=NULL,
                           conc_dep=FALSE,
                           data_type="raw",
                           mix)

# Load discrimination/TDF data
discr <- load_discr_data(filename="datasets/bamboocoral_discrimination.csv", mix)

# Make isospace plot
plot_data(filename="output/isospace_plot",
          plot_save_pdf=TRUE,
          plot_save_png=FALSE,
          mix,source,discr)

# Calculate standardized convex hull area
if(mix$n.iso==2) calc_area(source=source,mix=mix,discr=discr)

# Plot your prior
plot_prior(alpha.prior=1,source,filename="output/prior_plot")

# Define model structure and write JAGS model file
model_filename <- "output/MixSIAR_model.txt"
resid_err <- TRUE
process_err <- TRUE
write_JAGS_model(model_filename, resid_err, process_err, mix, source)

# Run the JAGS model ("test" first, then "normal")
jags.1 <- run_model(run="very long", mix, source, discr, model_filename, alpha.prior=1)
#jags.1 <- run_model(run="normal", mix, source, discr, model_filename,alpha.prior=1)

# decide what output to output
output_options <- list(summary_save = TRUE,                 
                       summary_name = "output/summary_statistics", 
                       sup_post = FALSE,                    
                       plot_post_save_pdf = FALSE,           
                       plot_post_name = "output/posterior_density",
                       sup_pairs = TRUE,             
                       plot_pairs_save_pdf = TRUE,    
                       plot_pairs_name = "output/pairs_plot",
                       sup_xy = TRUE,           
                       plot_xy_save_pdf = TRUE,
                       plot_xy_name = "output/xy_plot",
                       gelman = TRUE,
                       heidel = FALSE,  
                       geweke = TRUE,   
                       diag_save = TRUE,
                       diag_name = "output/diagnostics",
                       indiv_effect = TRUE,       
                       plot_post_save_png = FALSE, 
                       plot_pairs_save_png = FALSE,
                       plot_xy_save_png = FALSE,
                       diag_save_ggmcmc = FALSE,
                       return_obj = TRUE)

# Process diagnostics, summary stats, and posterior plots
output_JAGS(jags.1, mix, source)

library(R2jags)
attach.jags(jags.1)
mean(p.global[,1])

View(jags.1$BUGSoutput$sims.list$p.ind)
