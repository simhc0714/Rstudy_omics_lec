# Part_01_02-noname.R
library(TCGAbiolinks)
query <- GDCquery(
  project = "TCGA-PRAD",
  data.category = "Clinical",
  data.type = "Clinical Supplement",
  data.format = "BCR Biotab"
)
GDCdownload(query)
clinical.BCRtab.all <- GDCprepare(query)

# All available tables