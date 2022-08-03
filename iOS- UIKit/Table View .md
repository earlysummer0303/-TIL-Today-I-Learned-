# UIKit - 테이블 뷰 

### 에그밋 프로젝트 이전, 테이블 뷰를 활용한 귀여운 강아지 쏨이의 앨범 앱을 만들었었다. 

### 공부 내용은 대략적으로 다음 순서와 같다.

- 테이블뷰의 프로토콜 및 기본적인 테이블 뷰 만들기

- Custom cell 만들기 

- Segue

- 테이블 뷰 앱을 MVVM 패턴으로 리팩토링 하기

- 테이블 뷰 앱을 Collection View를 사용하여 확장하기

  

나는 프로젝트에 앞서 급하게 공부하여서 MVVM 패턴으로 리팩토링 하기 까지 진행했지만, MVVM에 대한 이해도를 충분히 가져가진 못했고, 막상 프로젝트에서도 일반적인 테이블 뷰가 아닌 static table view 만을 활용했고, 클론코딩하며 배운 내용을 따로 정리해두지 않았기 때문에, 일반적인 테이블 뷰의 사용에 익숙해 지지 못한 상태이다. 따라서 다시 한번 테이블뷰 어플리케이션을 만들어보며 테이블 뷰 사용을 되짚어보고 확실히 숙지해보자.



## UITableView의 기본적인 컨셉

: 'cell'을 활용해 여러 item 들을 여러 행에 걸쳐 리스트로 보여주는 뷰 요소

테이블뷰와 테이블뷰를 이루는 셀

<img src="/Users/earlysummer/Library/Application Support/typora-user-images/스크린샷 2022-01-31 오전 12.11.09.png" alt="스크린샷 2022-01-31 오전 12.11.09" style="zoom:25%;" />



이때 'cell' 은 화면에 보여지는 만큼 만들어져서 재사용되는 요소이다.

<img src="/Users/earlysummer/Library/Application Support/typora-user-images/스크린샷 2022-01-31 오전 12.09.45.png" alt="스크린샷 2022-01-31 오전 12.09.45" style="zoom:25%;" />

셀은 아래와 같이 직접 커스터마이징 해서 사용한다.

<img src="/Users/earlysummer/Library/Application Support/typora-user-images/스크린샷 2022-01-31 오전 12.12.15.png" alt="스크린샷 2022-01-31 오전 12.12.15" style="zoom:25%;" />





## 테이블 뷰, 테이블뷰 셀 삽입하기

<img src="/Users/earlysummer/Library/Application Support/typora-user-images/스크린샷 2022-01-31 오전 12.32.28.png" alt="스크린샷 2022-01-31 오전 12.32.28" style="zoom:25%;" />

- 스토리보드 화면 위에 table view 오브젝트를 삽입해준다.

<img src="/Users/earlysummer/Library/Application Support/typora-user-images/스크린샷 2022-01-31 오전 12.35.55.png" alt="스크린샷 2022-01-31 오전 12.35.55" style="zoom:25%;" />

- 다음으로 table view cell 오브젝트를 삽입 해준다.

<img src="/Users/earlysummer/Library/Application Support/typora-user-images/스크린샷 2022-01-31 오전 12.49.55.png" alt="스크린샷 2022-01-31 오전 12.49.55" style="zoom:33%;" />

- 스토리보드상에서 테이블 뷰 안에 cell 이 들어 가는것을 확인할 수 있다.



## TableView의 프로토콜 (Protocol)

### 필수적인 프로토콜

- UITableViewDataSource

  - 테이블 뷰에 셀을 몇개 넣어줄지

  - 테이블 뷰를 어떻게 보여줄지

    에 대해 응답해야한다.

    

### 부수적인 프로토콜 - UITableViewDelegate

- 테이블뷰의 셀을 누를 경우 어떻게 할 것인지 에 대해 응답한다. 

## <img src="/Users/earlysummer/Library/Application Support/typora-user-images/스크린샷 2022-01-31 오전 1.02.16.png" alt="스크린샷 2022-01-31 오전 1.02.16" style="zoom:25%;" />

<img src="/Users/earlysummer/Library/Application Support/typora-user-images/스크린샷 2022-01-31 오전 1.11.56.png" alt="스크린샷 2022-01-31 오전 1.11.56" style="zoom: 50%;" />







## 프로젝트

- 지우의 목표를 보여주는 테이블 뷰 어플리케이션 만들기

  - 지우의 목표를 커스텀 셀을 활용해 테이블 뷰로 보여주고, 

  - 각 셀을 클릭하면 해당하는 목표의 상세 내용 페이지가 나온다.

    