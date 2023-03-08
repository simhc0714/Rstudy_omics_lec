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

### rpy2 package 로 python에서 r 패키지 사용이 가능하다.
---
