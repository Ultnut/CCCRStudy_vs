11

## 가상화
--------------------------------
 -  물리 -> 논리
 -  스토리지 SDS -> (LVM/RAID, swift, cepth)
 -  시스템 가상화 
    -  서버 가상화
    -  클라우드 ( 오픈스택 )
    -  컨테이너 ( 도커, 쿠버네티스 )
  - 네트워크 
    - SDN : 장비 ( controll, data ) 
    - NFV ( network function vutualiztion) : 기능 

설명
yum.ova : 패키지 저장소 입니다.
	-> autofs 를 이용해서 nfs서버의 /share 디렉토리 및에 있는 
	doc,music,movie 디렉토리를 간접와일드카드맵으로 마운트하세요.

dns.ova : DNS 서버를 구성하세요.
10.0.2.10 -> yum.cccr.exam.com
10.0.2.20 -> dns.cccr.exam.com 
10.0.2.30 -> nfs.cccr.exam.com
10.0.2.40 -> web.cccr.exam.com
(10.0.2.40 -> web1 / 10.0.2.40 -> web2)

nfs.ova : NFS 서버를 구성하세요. (저장소설정 필요)
	/contents 디렉토리를 web서버에 공유 설정
	/share 디렉토리의 하위 디렉토리들을 해당 네트워크대역에 공유설정
	(/share/doc , /share/movie , /share/music 디렉토리는 직접 생성)
	
	iSCSI 의 target 설정을 합니다.
	논리볼륨을 만들어서 web.cccr.exam.com 시스템에 제공합니다.

web.ova : WEB 서버를 구성하세요. (저장소설정 필요)
	/var/www/html 디렉토리에 NFS 서버의 /contents 디렉토리를 마운트하세요.
	가상호스트 설정을 이용해서 
	web1 이라는 이름으로 접근 시 /var/www/html 의 파일을 제공합니다.
	web2 이라는 이름으로 접근 시 /srv/www/html 의 파일을 제공합니다.
	(web2 컨텐츠는 간단한 텍스트로 직접 생성하고 SELinux 는 꺼둡니다.)

	iSCSI 이니시에이터 설정을 합니다.
	제공받은 디스크를 파티셔닝해서 3G 파티션으로 /mnt 에 마운트설정
					1G 파티션은 swap 설정합니다.


