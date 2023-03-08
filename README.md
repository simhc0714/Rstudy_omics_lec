# README.md
## Base installation
* Python</br>
python 설치 (환경변수 설정) => IDE 설치 => package 설치

* R </br> 
R base => Rtools(맞는 버전으로) => R-studio

### Package installation and loading in Python
Example (cmd/shell) 환경변수 설정 필수
```bash
pip install pandas
pip install scipy, requests
```
### Package loading
```python
import pandas as pd
from scipy.stats import shapiro
```
### Package loading/attaching and listing in R </br>
Example
```r
if(!require("Biomanager", quietly = TRUE))
    install.packages("BioManager")
BioManager::install()
```
> lib 지정 오류</br>
대부분 관리자 권한으로 실행하면 해결된다.

## 무작정 따라하기: TCGA clinical patient data 불러오기
이 튜토리얼은 아래 링크에서 제공된다.</br>
<a>
https://bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/index.html</a></br>

1. 주요 패키지 설치
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
2. GDC(Genomic Data Common) Data Portal 에서 데이터 탐색하기
    ```r
    # import libraries
    library(TCGAbiolinks)
    library(dplyr)
    library(DT)
    ```
   1. Query, Download & Prepare</br>
   탐색을 건너뛰고 데이터 접근은 2.2. 에서.</br>
    ```r

    ```

   2. Clinical Data
    ```r

    ```



3. clinical data open
   > External links:</br>
   https://bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/index.html</br>
   > GDC Data Portal 에서 다운로드 받은 clinical data (BCR Biotab 포맷) 는 BioManager의 TCGAbiolinks 패키지를 사용하여 접근 할 수 있다.
    ```r
    query <-
    ```


## rpy2 package 로 python에서 r 패키지 사용이 가능하다.
