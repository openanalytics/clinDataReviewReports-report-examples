# Get CDISC example dataset and create dummy data of a previous/old batch
# 
# Author: Laure Cougnaud
###############################################################################

library(clinUtils)
library(haven)

# 1) Get public dataset, extracted from a git repository

# (to be executed in the Terminal)
# git clone https://github.com/phuse-org/phuse-scripts.git
# mkdir data && cp -R ./phuse-scripts/data/sdtm/cdiscpilot01/*.xpt ./data

# 2) Create dummy data of a previous batch

# Copy new data to a dummy old batch
pathDataNew <- "./data/"
pathDataOld <- "./data/comparisonData"
dir.create(pathDataOld)
sdtmFiles <- list.files(path = pathDataNew, pattern = "*.xpt", full.names = TRUE)
tmp <- file.copy(from = sdtmFiles, to = pathDataOld)

# Make some dummy modifications of the data
sdtmData <- clinUtils::loadDataADaMSDTM(files = sdtmFiles)
sdtmLabelVars <- attr(sdtmData, "labelVars")

# Adverse events:
dataAEOld <- sdtmData$AE
# Change AESER
idx <- which(dataAEOld$USUBJID %in% c("01-709-1424", "01-718-1170"))
dataAEOld[idx, "AESER"] <- "N"
dataAEOld[idx, "AESEV"] <- "MILD"
# Change AESEV
idx <- with(dataAEOld, which(
  USUBJID %in% c("01-701-1211", "01-703-1086", "01-703-1119", 
                 "01-708-1428", "01-710-1070") &
    AESEV == "SEVERE"
))
dataAEOld[idx, "AESEV"] <- "MODERATE"

# Change AESDTH
idx <- which(dataAEOld$USUBJID == "01-701-1211")
dataAEOld[idx, "AESDTH"] <- "N"

# Export the updated data
haven::write_xpt(data = dataAEOld, path = file.path(pathDataOld, "ae.xpt"))

# Subject discontinuation
dataDSOld <- sdtmData$DS

# new discontinuations
idx <- with(dataDSOld, which(DSDECOD == "WITHDRAWAL BY SUBJECT" & VISIT == "WEEK 24"))
dataDSOld <- dataDSOld[-idx, ]

# Change reason
idx <- with(dataDSOld, which(DSDECOD == "WITHDRAWAL BY SUBJECT" & USUBJID == "01-703-1197"))
dataDSOld[idx, "DSDECOD"] <- "PHYSICIAN DECISION"

# Export the updated data
haven::write_xpt(data = dataDSOld, path = file.path(pathDataOld, "ds.xpt"))
