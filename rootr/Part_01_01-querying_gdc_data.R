# Part_01_01-querying_gdc_data.R

library(TCGAbiolinks)
library(dplyr)
library(DT)

# query that match with GDC query (arguments)
query <- GDCquery(
  project = "TCGA-PRAD",
  data.category = "Clinical",
  data.type = "Clinical Supplement",
  data.format = "BCR Biotab",
  #file.type = "patient"
  file.type = "drug"
)
# GDCdownload function
# download matched query data in GDCdata folder in current dir
GDCdownload(query)

# Object named 'clincal.BCRtab.patient' override with query data
# using GDCprepare function
clinical.BCRtab.drug <- GDCprepare(query)
clinical.BCRtab.patient <- GDCprepare(query)

# ---

# Make Datatable(using DT library package) and also see on viewer
clinical.BCRtab.all$clinical_drug_prad %>%
  head %>%
  DT::datatable(options = list(scrollX = TRUE, keys = TRUE))

# All available tables in clinical.BCRtab.all object
# Function:names; get names of an object
names(clinical.BCRtab.all)

# column names from clinical_patient_prad
# tibble:: / import tibble packages
# tibble::tibble / construct a dataframe
# sort by colnames in clinical_patient_prad of clincal.BCRtab.all
# clinical_patient_prad file has 70 columns, sort in abc order
tibble::tibble(sort(colnames(clinical.BCRtab.all$clinical_patient_prad)))

# gleason-score count
# package(plyr): what sort of data structure they split up and return
plyr::count(clinical.BCRtab.all$clinical_patient_prad$gleason_score)


# gleason content table
# Every gleason- content in data
gls.cols <- grep("^gleason", colnames(clinical.BCRtab.all$clinical_patient_prad))
clinical.BCRtab.all$clinical_patient_prad[,c(2,gls.cols)] %>%
  DT::datatable(options = list(scrollX = TRUE))
#grep("pattern"); ^gleason; start with gleason-
# scrollX = TRUE; X-axis scroll is available

# All columns in data on DT first rows
clinical.BCRtab.all$clinical_patient_prad %>%
  head %>%
  DT::datatable(options = list(scrollX = TRUE, keys = TRUE))

# ---
# Clinical indexed data
clinical <- GDCquery_clinic(project = "TCGA-PRAD", type = "clinical")
clinical %>%
  head %>%
  DT::datatable(filter = 'top',
                options = list(scrollX = TRUE, keys = TRUE, pageLength = 5),
                rownames = FALSE)
# function:GDCquery_clinic; download all clincal info from the API
# pageLength; set limit of page row length


# ---
# Legacy Clincal data (Biotab Format)
query <- GDCquery(project = "TCGA-PRAD",
                  data.category = "Clinical",
                  data.type = "Clinical data",
                  legacy = TRUE, # legacy option FALSE: data.type "Clinical data" not exist.
                  file.type = "txt")
# DT, query that match 'cases'
query %>%
  getResults %>%
  select(-matches("cases")) %>%
  DT::datatable(options = list(scrollX = TRUE, keys = TRUE))

# function:GDCdownload; download gdc data using GDC API or GDC transfer tool
# function:GDCprepare; Read the downloaded and prepare it into an R object
# GDCdownload, GDCprepare must be use together
GDCdownload(query)
clinical.biotab <- GDCprepare(query)

# Get all names in data
names(clinical.biotab)

# DT
datatable(clinical.biotab$clinical_radiation_prad, options = list(scrollX = TRUE, keys = TRUE))


# ---
# rm(Data_name): remove 'Data_name'

# ---
# What i did today (2023,03.08.)
# install r-base, tools and library to access GDC data
# basic manipulation(query, download, and indexing)
# using 'DT' and 'plyr' packages, showing datatable on viewer and sort column names in data by abc order.
