# idus-test-iOS-Aizen
라이징테스트 4기 아이디어스 B


## To-do List

✅  **Done** <br>
❌  **Not Done** <br>
♾️  **Permanently** <br>



  
<hr><br>


### 2022/03/19 (토)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|           기획서 제출                 |                                                                                  |      ✅     |
|           프로젝트 생성                 |                                                                                  |      ✅     |
|           Git First Commit                 |                                                                             |      ✅     |


<br>

<hr><br>


### 2022/03/20 (일)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          로그인 화면                |          UI구성                                                            |      ✅     |
|          회원가입 화면               |           UI구성 및 유효성 검사 적용                                              |      ✅     |
|                          |                                                                             |          |
<br>
<details>
  <summary>개발 현황</summary>
  <div markdown="1">
    <img width="392" alt="스크린샷 2022-03-20 오후 11 52 36" src="https://user-images.githubusercontent.com/68258365/159168426-b42d6750-4af0-4f61-bb5f-fa121ec14deb.png">
<img width="387" alt="스크린샷 2022-03-20 오후 11 52 44" src="https://user-images.githubusercontent.com/68258365/159168431-e489a38b-2669-469e-a2ba-d04f130500e7.png">
<img width="390" alt="스크린샷 2022-03-20 오후 11 52 54" src="https://user-images.githubusercontent.com/68258365/159168435-a9063ba5-a75c-4137-8ffd-887c0dd6b254.png">
<img width="393" alt="스크린샷 2022-03-20 오후 11 53 02" src="https://user-images.githubusercontent.com/68258365/159168437-e9caee88-443d-4ffc-b6d3-0ee7714d17b6.png">
<img width="394" alt="스크린샷 2022-03-20 오후 11 53 52" src="https://user-images.githubusercontent.com/68258365/159168439-cecafa53-2f7b-41f1-9382-037c5d61510e.png">
    <img width="394" alt="스크린샷 2022-03-20 오후 11 53 09" src="https://user-images.githubusercontent.com/68258365/159168442-5dc62d9d-5dbd-4f1a-984c-a04465594c41.png">


    
  </div>
</details>

<hr><br>


### 2022/03/21 (월)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          탭바 컨트롤러                |          UI구성                                                            |      20 %    |
|          내정보 화면            |           xib를 활용한 커스텀 셀 적용.     , 섹션과 빈 헤더를 이용하여 셀 간격 적용.                              |      ✅     |
|                          |                                                                             |          |
<br>

<details>
  <summary>개발 현황</summary>
  <div markdown="1">
   
<img width="383" alt="스크린샷 2022-03-21 오후 11 21 22" src="https://user-images.githubusercontent.com/68258365/159281421-ab20a294-e888-466e-8522-8d04ec280c90.png">
<img width="387" alt="스크린샷 2022-03-21 오후 11 21 44" src="https://user-images.githubusercontent.com/68258365/159281434-6aa1bc8c-8d0d-4924-8b5b-d51ea81d4efa.png">


    
  </div>
</details>


## 1차 피드백

- 전반적으로 기획서 1차 피드백 전까지 할 부분은 잘 하였다고 해주셨습니다.


### 어려웠던 점

- 6주간의 교육동안 레이아웃 하나하나 세세하게 똑같이 구현하는 것에 소홀했던 것이 많이 후회되는 계기가 됨.
- 누끼를 따서 에셋을 만드는 과정이 생각보다 쉽지 않았음.
- 작업속도 자체가 너무 느린 것 같아서 심리적으로 더 압박이 심해짐.
  
  멘토님의 조언 : 
  1. https://www.remove.bg/ko 이 사이트에서 누끼따기 쉬움.
  2. 지금까지 한 것과 같이 ui와 데이터랑 가능하면 분리하면서 작업
  3. 약관 동의 모두 해제하기 기능 구현할 때 AllSatisfy 메소드를 참고하면 좋을 것 같다.
  4. 로그인 성공 여부 -> 어렵다면 싱글톤으로 
  5. api의 첫 작업을 할 때 수요일 까지는 회원가입 로그인을 끝낸다는 생각으로 임하는 게 좋을 것
  6. 돌아보게 되면 심리적으로 쫓기는 느낌이 첫번째로 들고 두번째로 생산이 누적됨. 완벽하게 끝내고 다음 태스크로 넘어가야하는데 누적되면서 생산성이 안 나오는 상황 발생하므로 일정을 정하고 다음으로 넘어가기.
  7. 빈 뷰를 레이아웃짠다는 느낌으로 먼저 넣고 작업하기(테이블 뷰를 넣을 공간 파란색 빈 뷰를 넣어둠.)
- 


### 2차 피드백 전까지 목표
- 홈화면에서 임의의 아이템을 선택 후 구매하기 과정까지 성공을 목표로함. (앱의 메인 기능)
- 대략 레이아웃 화면 12개 이상 만들어보기
- 

### 2022/03/22 (화)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          탭바                |          탭바, 버튼과 필요한 뷰컨트롤러 및 스토리보드 레이아웃 배치                              |    ✅      |


#### 특이사항 : 학교 과제 및 아르바이트로 인하여 22일은 충분한 시간 투자를 못하였습니다. 내일 못한 만큼의 작업을 하여 만회해보겠습니다.

<br>

<details>
  <summary>개발 현황</summary>
  <div markdown="1">
   
<img width="403" alt="스크린샷 2022-03-22 오후 11 48 49" src="https://user-images.githubusercontent.com/68258365/159511314-4ad440fb-46b1-4ce5-83b9-fa7a4bd0667e.png">


    
  </div>
</details>

### 2022/03/23 (수)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          New탭               |         상단 탭바 구현, 검색창 및 로고 툴바 구현, 컬렉션 뷰 구현중                             |    80%      |


#### 특이사항 : 상단 탭바 구현중 XLPagerTabStrip의 BarButtonView를 연결하지 못하는 이슈가 생겨 해결하는데 4시간을 소요함.
아래와 같은 방법으로 해결함. outlet연결을 안 해주었던 것이 원인
<img width="571" alt="스크린샷 2022-03-23 오후 11 34 18" src="https://user-images.githubusercontent.com/68258365/159723964-04f10884-ad4d-4c6a-b3cc-52a854c722ed.png">


<br>

<details>
  <summary>개발 현황</summary>
  <div markdown="1">
   
<img width="391" alt="스크린샷 2022-03-23 오후 11 28 21" src="https://user-images.githubusercontent.com/68258365/159723734-f127f33d-cd0a-4d24-870d-8187b5011c82.png">



    
  </div>
</details>

### 2022/03/24 (목)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          작품 상세 화면               |         네비게이션 바, 작품 사진 넘기기 기능 구현, 미리보기 사진 컬렉션뷰 구현, 커스텀 셀 구현중                |    80%      |
|          클래스 화면              |         상단 탭바 구현                             |    20%      |


<br>

<hr><br>


### 2022/03/25 (금)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          작품 상세 화면                |     미완성 된 커스템 셀 완성 및 테이블 뷰, 컬렉션뷰 관련 디버깅(크기 불일치, 빈화면, )                                       |      ✅     |

<br>
<details>
  <summary>개발 현황</summary>
  <div markdown="1">
    ![image](https://user-images.githubusercontent.com/68258365/160146032-6a95caf8-dc0d-4299-8365-a314c2322b07.png)
<img width="392" alt="스크린샷 2022-03-25 오후 11 53 33" src="https://user-images.githubusercontent.com/68258365/160146041-f925fbef-d744-48de-9ace-44547df8d735.png">



    
  </div>
</details>

<hr><br>

<hr><br>


### 2022/03/26 (토)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          회원가입 api요청 클라이언트 반영                |      POST                                          |      ✅     |
|          로그인 api요청 클라이언트 반영              |             POST                                   |      ✅     |
|          유저 프로필 조회 api요청 클라이언트 반영                |       GET                                         |      ✅     |

<br>
<hr><br>

<hr><br>


### 2022/03/27 (일)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          유저 프로필 수정 API 클라이언트 반영               |      Patch                                          |      ✅     |
|         New탭 작품 리스트 조회 API 클라이언트 반영             |             GET                                |      ✅     |
|          NeW탭 리스트 보기 옵션(이미지만 보기) 적용.                 |                                               |      ✅     |
|          작품 상세 정보 요청 API 클라이언트 구현 중             |        GET                                       |      80%     |

<br>

### 2022/03/28 (월)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          구매하기 레이아웃 구현              |                                          |      80%    |
|          자동로그인 & 로그아웃 기능 추가                 |          keyChain에 저장된 토큰을 통해 api호출하여 자동 로그인 처리.          |      ✅     |

<br>
<details>
  <summary>개발 현황</summary>
  <div markdown="1">
   
<img width="390" alt="스크린샷 2022-03-28 오후 11 00 50" src="https://user-images.githubusercontent.com/68258365/160415075-229ee819-8208-47c1-9b8c-12e041a8ed98.png">


<img width="397" alt="스크린샷 2022-03-28 오후 11 00 57" src="https://user-images.githubusercontent.com/68258365/160415027-4a2290ad-2eaf-4ee5-b0d2-ef35a014ee7f.png">

<img width="405" alt="스크린샷 2022-03-28 오후 11 01 03" src="https://user-images.githubusercontent.com/68258365/160415043-0ee73022-e243-4b2e-9fb4-b62a52376472.png">


    
  </div>
</details>

## 2차 피드백

- 기능 자체적으로는 충분히 구현을 하고 있는 것 같다고 해주셨습니다.
- 레이아웃이 조금 크게 달라보이는 부분은 다듬을 필요가 있어보인다고 하셨습니다.


### 어려웠던 점

- 본격적으로 API 명세서를 보고 클라이언트에 반영하는 작업을 수행도중 파라미터값이나 반환 엔티티가 오타가 많이 발생해서 시간을 많이 잡아먹음.
- 작품 상세화면이나 구매화면, 내정보화면 등 거의 모든 구현하고자 하는 화면에서 커스텀 셀을 여러개 만들다보니 번거로움. 딜리게이트 패턴을 너무 난무해서 사용한 것 같아서 추후 공부하면서 생각하는 시간을 조금 더 가지고 프로토콜을 만드는 작업을 연습해봐야할 것 같다고 느낌.
- 지난주와 마찬가지로 작업속도 자체가 너무 느린 것 같아서 심리적으로 더 압박이 심해짐.
  
  멘토님의 조언 : 
  1. 결론적으로 최종 마감날에 20장정도의 레이아웃을 만든다라는 느낌으로 진행. API를 20개정도 엮는다 목표.
  2. 전반적으로 UI의 개선이 필요.
  3. 비회원일 때 로그인일때 화면이 다르다 이러한 것을 영상에서 설명.
  4. 싱글톤으로 데이터를 넘기거나 각각 셀안에 프로필 넣고 섹션나누고 이러한 과정을 실제 현업에서는 컴포저블 컬렉션 뷰를 사용하므로 참고. 컴포저블 레이아웃 컬렉션 뷰라고 검색.
  5. API같은 경우에도 지금 템플릿은 datamanager를 통해서 소통하고 다른 방법으로는 라우터 패턴이 있으므로 참고. enum 열거형을 사용해서 활용하는 방법도 있다 정도로 인지하고 나중에 공부 필요.
  6. 현재 로그인 정보를 keyChain을 사용해서 저장하였는데 이부분도 영상에서 적극적으로 어필.
  7. 지금은 키체인을 구현해서 사용했는데 keychanAccess라는 라이브러리를 사용해도 괜찮음.
  


### 최종 까지 목표
- UI다듬기


<hr><br>

### 2022/03/29 (화)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          찜하기 API 요청 클라이언트 반영              |                                          |     ✅     |
|          상세화면 디버깅                 |          테이블 뷰 안에 컬렉션뷰에 데이터가 전달되지않는 버그 수정          |      ✅     |


<hr><br>

### 2022/03/30 (수)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          상세화면 작품 페이지넘기기 화면 보완              |                     Observer패턴과 Delegate패턴을 이용하여 두 컬렉션뷰 앨법을 페이지 동기화                     |     ✅     |
|          댓글 달기 기능(API 클라이언트 반영)              |          POST       |      ✅     |

<<<<<<< HEAD

<details>
  <summary>개발 현황</summary>
  <div markdown="1">
   

<img width="395" alt="스크린샷 2022-04-01 오후 3 42 18" src="https://user-images.githubusercontent.com/68258365/161209827-da2c745b-0592-403b-999a-73776e0f82ef.png">

<img width="403" alt="스크린샷 2022-04-01 오후 3 43 51" src="https://user-images.githubusercontent.com/68258365/161209839-e2592532-0ff7-4df1-a7a6-0ea33fdc11bd.png">

<img width="391" alt="스크린샷 2022-04-01 오후 3 43 33" src="https://user-images.githubusercontent.com/68258365/161209860-15c28981-484f-4dfc-ae27-f88034a61f73.png">

    
<img width="395" alt="스크린샷 2022-04-01 오후 3 41 39" src="https://user-images.githubusercontent.com/68258365/161209887-fbfffb17-b3ad-47b1-aba2-179f58cc6bb6.png">

    

    
  </div>
</details>

## 마감하고나서

- 하고자 했던 작업들이 생각보다 양이 많아서 결국 완벽하게 구현하지 못해 아쉬웠습니다.
- 후기 작성 가능 여부를 보여주는 경고창, 구매가 되었음을 알려주는 알림창, 프로그레스바, 상세화면의 네비게이션바 사라지는 효과 등등 욕심을 부리다가 애매하게 틀만 만들어둔 것 같아서 아쉬웠던 프로젝트였습니다.
- 로그인과 비로그인일때 각 아이템을 불러오는 api를 미리 생각하고 백엔드 분과 상의하였다면 더 원활하게 작업이 진행되었을 것 같아서 앞으로는 이러한 사용자가 앱을 사용할 때 필요한 시퀀스를 미리 생각해보고 그러한 부분은 미리미리 백엔드 분과 상의해야겠다고 느꼈습니다.
<<<<<<< HEAD
=======
<hr><br>

### 2022/03/30 (수)
|                           내용                           |                             비고                             |  완료 여부 |
| :-------------------------------------------------------: | :----------------------------------------------------------: | :-------: |
|          후기남기기API 클라이언트 반영            |                    POST                     |     ✅     |
|                 구매하기 API 클라이언트 반영       |          POST       |      ✅     |







https://user-images.githubusercontent.com/68258365/162218846-bfa0ada2-fb6c-4660-b812-784472bc4f08.mov





