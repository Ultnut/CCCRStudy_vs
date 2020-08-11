# 도커 네트워크

### 1.  bridge
- 컨테이너가 사용하는 프라이빗 네트워크
- 같은 bridge에 연결되어 있으면 컨테이너의 IP주소로 통신 가능
- 외부와 통신할떄 NAPT 통신 사용, 
- 외부에서 bridge로 통신하려면 포트포워딩 필요
### 2.  host
-   호스트에서 컨테이너의 격리를 해제하여 호스트의 네트워크 정보를 공유해서 사용하는 방법
-   호스트 입장에서 하나의 프로세스이기 떄문에 가상머신과 다르게 네트워크 정보를 공유가능
-   컨테이너와 호스트가 사용하는 포트가 충돌되면 안된다.
### 3.  none
-   null 드라이버는 컨테이너의 네트워크 기능을 사용하지 않음


## 포트포워딩
-   브릿지 네트워크를 사용하는 모든 컨테이너는 외부에서 접근할 떄 포트포워딩을 해야함
```
$ docker run -d --name web5 -p 8080:80 httpd:latest
```

## 태그

-   이미지의 이름을 변경하는게 아니라 이미지를 가르키는 이름을 하나 추가하는 형태임
```
$ docker tag centos:latest mycentos:latest
```

## PUSH, COMMIT

### 1) push
-   이미지를 도커허브에 업로드 
-   먼저 docker login 명령어로 도커허브에 로그인해야됨
### 2) commit
-   생성된 컨테이너에서 이미지를 생성
-   컨테이너의 파일 시스템을 추출하여 이미지를 생성
### 3) export, import
-   export 명령어로 컨테이너 파일시스템을 추출하여 아카이브로 파일 생성
    ```
    $ docker export -o export.tar os7
    ```
-   import 명령어로 추출된 아카이브 파일을 이미지화 
    ```
    $ docker import export.tar nobreak/docker:import
    ```


