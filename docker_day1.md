# DOCKER 1일차


![cloudplatform](https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile22.uf.tistory.com%2Fimage%2F9997B33E5D87252D1E1A5B)



![dockeromage](https://media.vlpt.us/post-images/kameals/bc8ff850-3837-11ea-ba70-85c443269637/1ovRuAuqPf4r2xpiWh71rUg.png)


- 클라우드 플랫폼과 가상화 

- 가상화 종류 (호스트 기반, 하이퍼 바이저 기반)
  - 하이퍼바이저의 역활

- 컨테이너란? ( vm vs containers )

- ![container](https://miro.medium.com/max/862/1*wOBkzBpi1Hl9Nr__Jszplg.png)

- ### 도커의 특징
  1.    서버를 코드 형태로 정의
  2.    이식성
  3.    상호운용성
   
- ### 도커의 구조
  1. 이미지
  2. 저장소
  3. 컨테이너

### 도커 명령어 정리
![dockercommand](https://kouzie.github.io/assets/2019/docker1.png)

```
-   docker search : 이미지 검색
-   docker pull : 이미지 다운로드 
-   docker images : 이미지 목록 나열
-   docker rmi : 도커 이미지 삭제
-   docker inspect : 이미지 정보 확인
-   docker load : 이미지 파일 불러오가
-   docker save : 이미지 파일 저장
-   docker ps : 컨테이너 목록 조회 
-   docker create : 컨테이너 생성
    -   -i : 연결 되지 않아도 표준입력 유지
    -   -t : 가상 터미널 지정
-   docker start : 중지되있거나 생성된 컨테이너 시작
-   docker container prune
-   docker stop
-   docker start 
-   docker run : create 와 start 없이 바로 컨테이너를 실행
    -   -d : 컨테이너 백그라운드 실행
    - docker restartdo
-   docker restart : 컨테이너 재시작
-   docker rm : 컨테이너 삭제 
-   docker attach : 컨테이너에 연결
-   docekr exec : 실행중인 컨테이너에 명렁어 실행
-   docker cp : 호스트의 파일을 컨테이너로 복사하거나 반대로 작업
-   docker diff : 컨테이너에서 파일의 변경상태를 체크
· docker container prune : 중지된 모든 컨테이너를 삭제한다.
· docker image prune : 이름 없는 모든 이미지를 삭제
· docker network prune : 사용되지 않는 도커 네트워크를 모두 삭제
· docker volume prune : 도커 컨테이너에서 사용하지 않는 모든 도커 볼륨을 삭제
· docker system prune -a :중지된 모든 컨테이너, 사용되지 않은 모든 네트워크, 하나 이상의 컨테이너에서 사용되지 않는 모든 이미지를 삭제한다. 따라서 남아있는 컨테이너 또는 이미지는 현재 실행 중인 컨테이너에서 필요함





```

## 도커에서 데이터 관리 

/var/lib/docker/overlay2

![DOCKERDATA](https://miro.medium.com/max/502/0*s0FGzALBYPez4hbP.png)

컨테이너에 생성되는 모든 파일은 컨테이너 레이너에 저장 된다.
이 데이터들은 컨테이너와 함께 삭제되는 런타임 데이터인데 이 데이터를 영구적으로 저장하려면 볼륨을 사용해야함.

1. Bind Mount 
  - 호스트의 특정 디렉토리와 컨테이너의 디렉토리를 연결
  - 도커에 의헤 관리되지 않기떄문에 관리가 힘듬
  - 호스트의 파일시스템에 대한 의존도 높음
  - 보안성 떨어짐
2. volume
   - 도커에 의해 관리되는 스토리지
   - 사용되지 않으면 한번에 제거가능 -> ocker volume prune
   - 다수의 실행중인 컨테이너 사이에 데이터를 공유할떄 유용
   - 컨테이너에서 호스트 구성을 분리할떄 사용





------------------------------------------------------
- json , yml 란?
  

