#  Medical Monitoring example report

This repository contains the source code to create the Medical Monitoring report, 
as available in the website:  
https://medical-monitoring.openanalytics.io/

## Pre-requisites

### Example dataset

The CDISC Pilot 01 SDTM data for the report are 
available in the [phuse-scripts](https://github.com/phuse-org/phuse-scripts/tree/master/data/sdtm/cdiscpilot01) GitHub repository.  
Please clone this repository and copy the content of the folder: 
_'data/sdtm/cdiscpilot01'_ in a folder: _'data'_.

### Software

A [Docker](https://www.docker.com/) reproducible environment to create the 
report can be created from the 
[Dockerfile](https://github.com/openanalytics/clinDataReview/blob/master/Dockerfile)
available in the `clinDataReview` GitHub repository.

In addition, the [`clinDataReview`](https://cran.r-project.org/package=clinDataReview) 
R package containing the report code can be installed from CRAN.

## Creation of the report

To create the report on the example dataset, please run the `report-create.R` 
script available in this repository.

## Extra material

For further information on how to create such report on your own data, please see
the vignettes of the [clinDataReview](https://cran.r-project.org/package=clinDataReview)
R package available in CRAN.
