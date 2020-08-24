## gcp 1주차 

---------------------------------
컴퓨트 엔진 -> vm인스턴스 생성
- vm1 : ubuntu - python 게시판 ( github에서 다운로드 )
- v1 - 개시글 저장로 /opt/dendongban -> localfile 형식 저장
- v2 - 게시글 저장소 gcp sql(mysql)에 proxy를 통해서 저장

- v3 - 파이썬 게시판 -> 글 저장 gcp sql 저장 
+ 추가로 사진 업로드 -> gcp storage


-------------------------------
compute engine -> 인스턴스 생성
- vm1 -> 웹서버(centos) + apache + php + wordprocess
- vm2 -> db서버(centos) + mariadb

gcp cloud sql
    dbserver ( 외부 ) ~ dbclient(mysql) 연동
- prxoy를 이용한 방법 2가지 
1) proxy tcp 3306 
2) proxy unix socket

----------------------------------

LOAD BALANCER

1) VM 인스턴스 생성(HTTP WEB SERVER)
2) 스냅샷 생성
3) 디스크 생성
4) 이미지 생성
5) 인스턴스 템플릿 생성 
6) 인스턴스 그룹 생성
7) 부하분산기 생성 ( backend , frontend 설정 )

+ 용어 정리 
-> autoscaling, 로드밸런싱 , 헬스체크 

