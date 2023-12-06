# Football

#### 1. Intro
해외 축구 경기 일정을 각 리그 마다 볼 수 있는 웹 사이트입니다.

#### 2. Tech Stack
<img src="https://img.shields.io/badge/Sping%20Boot-6DB33F?style=flat&logo=Spring%20Boot&logoColor=555"/>&nbsp;
<img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=555"/>&nbsp;
<img src="https://img.shields.io/badge/Mysql-4479A1?style=flat&logo=Mysql&logoColor=555">&nbsp;
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=555">


- Java 1.8
- Spring Boot
- Mysql
- Bootstrap
- AWS Ubuntu Server 20.04 LTS (HVM)
- Football-data.org Free API 사용

## :computer: Function

#### :pushpin: 경기 일정 조회

1. 페이지 진입 시 Ajax로 경기 일정 메소드 호출(Parameter: 리그 키값, 날짜) <br>
2. DB 해당 하는 데이터 있는지 조회 <br>
3. 존재하면 데이터 가져와서 return <br>
4. 존재하지 않으면 Football-data.org API 호출 후 응답 return <br>

- 경기 일정 화면
  * 리그는 메뉴바에서 선택 가능
  * 경기 정보는 Scheduled, Live, End로 구분하여 화면에 표시
  * 상단 날짜 선택 시 해당 날짜로 조회
 
<img width="1710" alt="main1" src="https://github.com/hwiseo-cho/Football/assets/57250330/31c5e3a2-8795-477d-958b-bf1d1657791f">
<img width="1118" alt="main_cd1" src="https://github.com/hwiseo-cho/Football/assets/57250330/2fa008e8-179d-4ddf-a014-58aa30defb55">
<img width="1068" alt="main_cd2" src="https://github.com/hwiseo-cho/Football/assets/57250330/4f909199-79b5-4413-85e5-c92a943d41b2">
<img width="925" alt="main_cd3" src="https://github.com/hwiseo-cho/Football/assets/57250330/cd1c17d3-a2e1-4807-b472-bdf932235a98">
<br><br>

#### :pushpin: 리그 순위 및 개인 득점 순위 조회

1. 페이지 진입 시 Ajax로 리그 순위 메소드 호출(Parameter: 리그 키값) <br>
2. DB 해당 하는 데이터 있는지 조회 <br>
3. 존재하면 데이터 가져와서 return <br>
4. 존재하지 않으면 Football-data.org API 호출 후 응답 return <br>

- 리그 및 개인 득점 순위 화면
  * 리그는 selectBox에서 선택 가능
  * 팀 순위, 득점 순위는 selectbox에서 선택 가능
  * 각 selectBox 값 변경 마다 조회

<img width="1710" alt="standing1" src="https://github.com/hwiseo-cho/Football/assets/57250330/f0f5204f-6a5c-45cf-befd-fa12c29885bc">
<img width="1710" alt="standing2" src="https://github.com/hwiseo-cho/Football/assets/57250330/06d9a5ed-dbb4-4f8d-8336-270cc2519d18">
<br><br>

#### :pushpin: API 조회 결과 데이터 관리 배치

1. Football-data.org Free 버전은 1분당 총 12회까지 호출할 수 있어 이를 최소화 하기위해 값을 DB에 저장하고 경기 일정은 1분, 순위는 1시간 마다 데이터 삭제 배치 생성
2. 경기 일정은 Live가 있기 때문에 1분으로 설정

<img width="551" alt="batch1" src="https://github.com/hwiseo-cho/Football/assets/57250330/a95dda1a-04ad-48a6-a297-5b62cca9635a">
<br><br>
