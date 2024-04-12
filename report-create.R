# Create skeleton report from clinDataReview package on CDISC example dataset
# 
# This report is available in the: https://medical-monitoring.openanalytics.io/ 
# website
#
# Author: Laure Cougnaud
###############################################################################

# 1) Get example data
source("data-import.R")

# 2) Create configuration files for the report
# This step should be re-run at each new version of the packages!

library(clinDataReview)

dir <- "."

# create the general config file
clinDataReview:::createMainConfigSkeleton(
	dir = file.path(dir, "config"), 
	dirData = "./data"
)

# copy example configuration files
tmp <- clinDataReview:::moveSkeletonFiles(dir = dir)

# 3) Run the report
clinDataReview::render_clinDataReviewReport()
