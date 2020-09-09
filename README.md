# JSP를 이용한 회원들끼리 맛집을 공유하는 게시판

## 0. 목차

[1. 개요](#1-개요)

[2. 기술](#2-기술)

[3. database EER Diagram](#3-database-eer-diagram)

[4. 사이트 맵](#4-사이트-맵)

[5. 기능](#5-기능)

[6. 구현한 기능](#6-구현한-기능)

[7. 게시물 실행 영상](#7-게시물-실행-영상)

## 1. 개요


![image](https://user-images.githubusercontent.com/58822916/92582061-739a5b00-f2cb-11ea-8472-a0733c73b0d1.png)

jsp을 사용한 회원들과 자유롭게 맛집을 공유할 수 있는 사이트입니다.
맛집을 공유할 수 있는 맛집 게시판과 자유게시판이 있습니다.

맛집 게시판은 주소api를 사용해 위치를 첨부할 수 있고, 읽는 사람은 주소를 클릭하여 위치를 확인할 수 있습니다.

## 2. 기술
1. Web Front : `HTML5` , `CSS`, `JavaScript`, `Bootstrap`
2. Web Server :  `Java`, `ApacheTomcat`
3. DBMS : `MySQL`
4. 개발환경 : `Eclipse`


## 3. database EER Diagram
![캡처](https://user-images.githubusercontent.com/58822916/86928061-05240a00-c16f-11ea-88e4-3fa6daacfa23.JPG)


## 4. 사이트맵
![image](https://user-images.githubusercontent.com/58822916/92581770-0be41000-f2cb-11ea-94e0-26a28f921475.png)


## 5. 기능
1. 회원가입/로그인
2. 게시물 CRUD
3. 댓글 CRUD
4. 페이징
5. 맛집 게시판 찜하기/평가하기
6. 주소api를 사용해서 주소 검색
7. 게시판 검색


## 6. 구현한 기능
제가 구현한 기능입니다.

1. 게시판 - 맛집게시판/자유게시판 2개로 나누기 https://blog.naver.com/2ejhi/222018115144
2. 게시판 - 사진 올리기 https://blog.naver.com/2ejhi/222018153891
3. 댓글 기능 https://blog.naver.com/2ejhi/222018209920
4. 맛집 게시판 평가 기능 https://blog.naver.com/2ejhi/222018230829
5. 페이징 https://blog.naver.com/2ejhi/222025797828
6. 찜, 찜목록  https://blog.naver.com/2ejhi/222025824297
7. 도로명주소 api https://blog.naver.com/2ejhi/222025860991
8. 검색기능 https://blog.naver.com/2ejhi/222019196350


## 7. 게시물 실행 영상
https://www.youtube.com/watch?v=bn91sRhUtxg&feature=youtu.be

