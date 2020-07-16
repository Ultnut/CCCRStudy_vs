# 4주차 시험 준비 

## 권한 설정

  1) 로그인 쉘 변경

  - useradd -s 사용자 /sbin/nogin
- 패스워드 쉽게 변경 echo test | passwd -stdin user01 
- 보조그룹 변경 -> useradd or usermod -G 
- 주그룹 변경 -g

2) 공유폴더 

- 폴더 or 디렉토리 소유자 또는 그룹 변경 
-> chwon 소유자:소유그룹
- 디렉토리 생성시 -p 옵션은 상위 경로도 함께 생성하는 거
- 디렉토리에 파일 생성시 소유그룹은 디렉토리 소유자로 g+s (setgid)
- uid 변경 useradd -u 
- 파일에 대한 새로운 사용자 및 그룹 추가 
  setfacl -m ugo:유저명 or 그룹명:rwx 
  
  하위디렉토리 default ACL 권한 설정 
: setfacl d:[u,g,o]:[file,dir]:[rwx] [파일,디렉토리]

ACL 재귀적 사용(디렉토리를 포함한 하위 파일 ACL 적용)
EX) stfacl -R -m Entry:NAME:PERMS File-name

## cron

분 시 일 월 요 명령어 
-> cron은 and 조건임~

-  매분 , 매시, 매일, 매월, 매주 
/: 주기 ex) */5 -> 5분마다, 5시간마다, 5일마다
-: 
- ex) 1-3 : 오전 1시부터 오전 3시까지 해당 시간이
, -: 범위를 지정할수 없을떄 
- ex) 8,17 : 오전 8시와 7시에 

 - crontab -e 로 편집 

- 기억이 잘 안날떙 vim cat /etc/crontab 



  


