# semiProject
 
# ANIMAL INFO
> 공공데이터를 활용한 유기동물 조회 및 정보 제공하는 웹 사이트

## Information
반려동물을 가족 구성원으로 받아들이는 가구가 늘어났습니다.
가족 구성원으로 반려동물을 고려하는 불특정 다수를 대상으로 
"사지말고 입양하자"라는 슬로건으로 입양 목적으로 유기동물 정보와 
보호소 위치 정보등을 제공함에 목적을 두고 있습니다.


## Goal
1. MVC Project 숙련도 향상
2. 기능 단위 분배로 협업하는 과정을 경험
3. Front & Back 통합 구현으로 FullStack 간접 체험

## Implementation function
```
시작페이지
1. 회원가입
(1) SNS계정 연동을 통한 가입 : KaKao Login API
(2) 사이트 자체 회원 가입을 위한 기능
이메일로 임의 인증키 발급 메일 전송 및 인증키 일치 시 이메일 인증 

2. 로그인 
(1) 일반 사용자 로그인 
(2) 관리자 로그인
(3) 보호자 로그인 
```

```
메인페이지(로그인 후 사용가능)
1) 유실동물공고
 - 동물보호관리시스템 오픈 API 를 활용하여 
   유기동물 조회 및 정보, 동물보호센터 정보 제공

2) 유기동물 제보 
(1) SMTP 메일 보내기
- 구글 Gmail을 이용하여 유기동물 제보 

3) 후원
(1) 정기후원 메뉴 
- iamport 결제 API

4) 보호소 위치 
(1) 현재 내 위치 기반으로 권역 내 보호소 위치 출력 
- Google Map API
- IP Geolocation API

5) 쇼핑 플랫폼
(1) 동물관련 물품 판매 사이트 연동 

6) 커뮤니티
- 임보자(보호소)와 입양희망자 1:1 쪽지 또는 채팅
```

```
마이페이지
1) 일정관리
- 구글 캘린더 API를 이용한 일정 관리 

2) 후원 내역 관리 

3) 내 정보 수정/ 탈퇴
```

## Environment
- OS : Window 10
- DBMS : Oracle DB 
- Server : Apache Tomcat 9.0.52
- Language : Java, JSP/Servlet, JavaScript, HTML/CSS
- Kakao Payment API, Kakao Login API, Google Calendar API
- 동물보호 관리시스템 Open API - 유기동물 정보 조회
- 동물보호센터 정보 Open API - 동물보호센터 정보 제공

## Notion Link
```
https://golden-caution-c8a.notion.site/4357b34fa8f94ab9a22d8df58b11e483
```
