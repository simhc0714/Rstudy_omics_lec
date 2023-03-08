# overall.md

## JustDoit: Load TCGA clinical patient data
이 튜토리얼은 아래 링크에서 제공된다.</br>
<a>
https://bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/index.html</a></br>

본 문서에서 사용되는 데이터 목록들</br>
<a>https://portal.gdc.cancer.gov/cases/da5b0169-e4f4-4674-b348-220af03ff4b5</a>
* Project : TCGA-PRAD
* Case ID : TCGA-HC-8258
* TSV Format; Transcriptome profiling data: RNAseq-based (open access)
* BCR Biotab Format; Clinical data: patient

R studio 에서 코드의 실행
-  Ctrl + Enter : Line 실행. Block 지정시, block 실행
-  Ctrl + Shift + S : 소스 코드 전체 실행

* 주요 패키지 설치
 1. Biomanager 설치
     ```bash
     if (!require("BiocManager", quietly = TRUE))
         install.packages("BiocManager")
     BiocManager::install()
     ```
 2. TCGAbiolinks 설치
     ```bash
     BioManager::install("TCGAbiolinks")
     ```
 3. 그 외 필요한 패키지들
     ```bash
     install.packages('DT')
     ```
 4. 설치된 패키지 확인
     ```bash
     packageVersion("TCGAbiolinks")
     ```
---
1. GDC(Genomic Data Common) Data Portal 에서 데이터 탐색하기</br>
   <u>Part_01_01-querying_gdc_data.R</u></br>
    </br>디렉터리 확인 및 변경
    ```r
    getwd()
    # [1] "C:/Users/User/Documents"
    setwd("./GitHub/Rstudy_omics_lec/rootr")
    getwd()
    # [1] "C:/Users/User/Documents/GitHub/Rstudy_omics_lec/rootr"
    ```
    </br>탐색을 위해 다음의 라이브러리들이 필요하다.
    ```r
    # import libraries
    library(TCGAbiolinks)
    library(dplyr)
    library(DT)
    ```
    ### Query, Download & Prepare</br>
    ```r
    # 탐색을 위한 argument 는 아래에서 볼 수 있다.
    # https://bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/query.html
    
    # Example.
    # File Name: nationwidechilderens.org_clinical_patient_prad.txt
    # Good query rules
    query <- GDCquery(
        project = "TCGA-PRAD",
        data.category = "Clinical",
        data.type = "Clinical Supplement", # GDC Portal에서 좌측 필터 참고
        data.format = "BCR Biotab",
        file.type = "patient"
    )
    # function: GDCdownload(query)
    # download match query data in online GDC portal, and stored at GDCdata folder in current working directory
    GDCdownload(query)

    # function: GDCprepare(query)
    # override query data on object named 'clinical.BCRtab.patient'
    clinical.BCRtab.patient <- GDCprepare(query)
    ```
    
    에러 상황을 가정해보자.
    ```r
    query <- GDCquery(
        project = "TCGA-PRAD",
        data.category = "Clinical",
        data.type = "Clinical Supplements",
        data.format = "BCR Biotab",
        file.type = "patient"
    )
    
    # --------------------------------------
    # o GDCquery: Searching in GDC database
    # --------------------------------------
    # Genome of reference: hg38
    # |sort(harmonized.data.type)          |
    # |:-----------------------------------|
    # |Aggregated Somatic Mutation         |
    # |Aligned Reads                       |
    # |Allele-specific Copy Number Segment |
    # |Annotated Somatic Mutation          |
    # |Biospecimen Supplement              |
    # |Clinical Supplement                 |
    # |Copy Number Segment                 |
    # |Differential Gene Expression        |
    # |Gene Expression Quantification      |
    # |Gene Level Copy Number              |
    # |Gene Level Copy Number Scores       |
    # |Isoform Expression Quantification   |
    # |Masked Copy Number Segment          |
    # |Masked Intensities                  |
    # |Masked Somatic Mutation             |
    # |Masked Somatic Mutation             |
    # |Methylation Beta Value              |
    # |miRNA Expression Quantification     |
    # |Protein Expression Quantification   |
    # |Protein Expression Quantification   |
    # |Raw CGI Variant                     |
    # |Raw Simple Somatic Mutation         |
    # |Single Cell Analysis                |
    # |Slide Image                         |
    # |Splice Junction Quantification      |

    # Error in checkDataTypeInput(legacy = legacy, data.type = data.type) :
    #   Please set a data.type argument from the column harmonized.type above
    ```
    data.type = "Clinical Supplements" 로 기입했는데, 올바른 구문은 s 가 제외되어야 한다. 에러 메세지를 읽어보는 것이 중요하다. 어떻게 해결해야 할지 친절하게 설명해준다. 에러 메시지 출력과 함께 harmonized.type 테이블이 출력되었는데 여기서 'Clinical Supplement' 가 보인다.


2. GDC(Genomic Data Common) Data Portal 에서 데이터 탐색하기</br>
<u>Part_01_02-noname.R</u></br>
 </br>contents






