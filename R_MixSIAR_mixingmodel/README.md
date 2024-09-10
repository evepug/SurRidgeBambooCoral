All R code and datasets required to reproduce our endmember mixing model analysis in R using MixSIAR are provided in this directory. 

Instructions for downloading the MixSIAR package and dependencies can be found here: https://cran.r-project.org/web/packages/MixSIAR/readme/README.html

Our endmember mixing model approach is modeled after the approach developed by Doherty et al., 2021. The code to perform this analysis was modeled after worked examples provided in the MixSIAR User Manual and distributed with the MixSIAR package (Stock and Semmens, 2016). 

To reproduce our results estimating bamboo coral dietary contributions from zooplankton, phytoplankton, microbially degraded organic matter and fecal pellet endmembers, download the datasets folder and MixSIAR_bamboocoral.R file into a new directory designated for this analysis. In R or RStudio, set the working directory to your new folder that the datasets folder and .R file are saved in. Then run the MixSIAR_bamboocoral.R file. Doing so will generate all relevant output, including model diagnostics, summary statistics, and plots needed to recreate the results described in our manuscript. This output will be saved in the working directory.  

In this repository, the output we obtained from running this code is available in the 'final results' folder. 

## MixSIAR references:
Stock BC, Jackson AL, Ward EJ, Parnell AC, Phillips DL, Semmens BX (2018). “Analyzing mixing systems using a new generation of Bayesian tracer mixing models.” PeerJ, 6, e5096. https://doi.org/10.7717/peerj.5096.
Stock BC, Semmens BX (2016). “MixSIAR GUI User Manual.” doi:10.5281/zenodo.1209993, Version 3.1, https://github.com/brianstock/MixSIAR.

## information about the files in the 'datasets' folder: 

### bamboocoral_discrimination.csv: 
This file with discrimination factors allows MixSIAR to correct for offsets between bamboo coral diet and skeleton, and account for uncertainties in these discrimination factors. See supplementary Table S1 of our manuscript for a description of how these discrimination values were determined. 
<br>References:<br>
McMahon, K. W., and M. D. McCarthy. 2016. Embracing variability in amino acid δ 15 N fractionation: mechanisms, implications, and applications for trophic ecology. Ecosphere 7: e01511. doi:10.1002/ecs2.1511
<br>
McMahon, K. W., B. Williams, T. P. Guilderson, D. S. Glynn, and M. D. McCarthy. 2018. Calibrating amino acid δ13C and δ15N offsets between polyp and protein skeleton to develop proteinaceous deep-sea corals as paleoceanographic archives. Geochimica et Cosmochimica Acta 220: 261–275. doi:10.1016/j.gca.2017.09.048

### Doherty_source_endmembers.csv: 
d15N Thr-Phe and d15N Ala-Phe for 4 major organic matter endmembers. This dataset was developed by Doherty et al., 2021 and reported in their Supplementary Table 4. More details about this dataset are provided in the main text and supplementary information of Doherty et al., 2021.
<br>Reference:<br>
Doherty S. C., Maas A. E., Steinberg D. K., Popp B. N. and Close H. G. (2021) Distinguishing zooplankton fecal pellets as a component of the biological pump using compound-specific isotope analysis of amino acids. Limnology and Oceanography 66, 2827–2841.

### surridge_bamboocoral_consumer.csv:
d15N Ala minus d15N Phe, and d15N Thr minus d15N Phe, for each bamboo coral sample we completed amino acid nitrogen isotope analysis on. 
