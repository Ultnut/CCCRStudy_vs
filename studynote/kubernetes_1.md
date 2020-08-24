# Kubernetes

![kubernetes](https://image.zdnet.co.kr/2020/01/22/firstblood_1QHoYHQjX.jpg)


### 사전 지식
1. 컨테이너 : 운영체제에서 사용되는 프로세스를 격리하여 별도으 실행환경을 제공 해당 프로세스는 운영체제상에서 실행되는 유일한 프로세스인 것처럼 동작됨
즉 운영체제에서 실행되는 여러 프로세스는 컨테이너라는 개념으로 격리되어 별도의 운영체제 환경을 제공하는 기술

2. 컨테이너 아키텍쳐 : 리눅스 시스템에서 컨테이너를 이용해서 격리 구조를 만드는 기법은, 격리를 담당하는 name space와 리소스를 제어하는 control Group(cgroup)을 사용하여 격리되는 컨테이너 환경을 제공, 네
- 네임 스페이스는 기본적으로 단일 네임스페이스를 사용하여 격리된 환경 제공
- 네임스페이스의 종류 : 마운트 포인트, 프로세스, 네트워크 - IPC , UTS, 사용자
- 제어그룹은 프로세스 또는 컨테이너가 사용할 수 있는 리소스양을 제한 가능
- 제어그룹이 제한 할 수 있는  리소스 : CPU, 메모리, 네트워크 대역폭, 디스크 입출력

3. 도커 주요 개념
   - 이미지 : 실행할 애플리케이션과 라이브러리 및 환경을 하나의 패키지로 묶은것
   - 레지스트리 : 이미지를 저장하고 공유할 수 있는 스토리지
   - 도커허브 같은 퍼블릭 스토리지와 사설 레지스트리 같은 프라이버시 스토리지가 있다
   - 컨테이너 : 이미지를 실행할 컨테이너
  
  1. 가상머신과 컨테이너 차이 : 가상머신은 애플리케이션을 동작시키기 위해서 애플리케이션이 사용하는 리소스만 사용하는게 아니라 운영체제가 동작하기 위한 리소스가 추가로 필요함 하지만 컨테이너는 애플리케이션이 돚악하기 위한 리소스만 사용한다.



## 쿠버네티스란(k8s)

![kubeinfra](https://t1.daumcdn.net/cfile/tistory/994E433E5AFEF4A222)

-  컨테이너 기반컴퓨팅 및 스토리지 인프라를 오케스트레이션 한다.
-  Iaas 의 유연함을 더해주고 Paas 를 제공 
-  제공하는 기능 : 컨테이너 플랫폼, 마이크로 서비스 플랫폼, 이식성 있는 클라우드 플랫폼
-  쿠버네티스는 하드웨어 레벨이 아니라 컨테이너 레벨에서 운영된다
-  일반적인 Paas 기능을 모드 제공하는게 아님 -> 미들웨어, 데이터베이스, 클러스터 스토리지 등 애플리케이션 서비스

## 구성 요소
- 쿠버네티스 클러스터는 마스터와 노드 구성요소가 있고 추가 요소가 있음 구성요소들과 API를 통해 메세지를 주고받음
![kubenode](https://t1.daumcdn.net/cfile/tistory/99172C485B02D9C82A)
- 클러스터의 구조 
  - 클러스터를 관리하는 컨트롤러인 마스터
  - 컨테이너가 배포되는 머신(가상머신 or 물리적인 서버머신)인 노드
- 오브젝트 : 가장 기본적인 구성단위가 되는 기본 오브젝트(Basic object)와 오브젝트를 생성 및 관리하는 controller로 이루어져 있음
- 기본 오브젝트
  - Pod : 가장 기본적인 배포단위, 컨테이너를 포함한 단위인데 쿠버네티스는 컨테이너를 개별적으로 배포하는게 아니라 Pod 단위로 배포하는데 pod는 하나이상의 컨테이너를 포함한다.
    ```
    apiVersion: v1
    kind: Pod
    metadata:
     name: nginx
    spec:
      containers:
    - name: nginx
      image: nginx:1.7.9
    ports:
    - containerPort: 8090
    ```
    - apiVersion : 스크립트를 실행하기 위한 쿠버네티스 API 버전 보통 v1 사용
    - kind : 리소스 종류 정의 pod, service ,,
    - metadata : 이 리로스의 종류를 정의 pod를 정의하려고 할떄 pod를 씀, 라벨이나 리소스의 이름등 각종 매타데이터를 넣음
    - spec : 리소스에 대한 상세한 스펙, container 정의 및 도커이미지, 컨테이너 포트 등


### Pod
-  Pod 내의 컨테이너는 IP와 Port 공유
-  두개의 컨테이너가 하나의 Pod를 통해 배포되었을대 localhost를 통해서 통신이 가능
-  Pod내의 배포된 컨테이너간에 디스크 볼륨 공유 가능
### volume
- Pod가 기동될떄 디폴트로 컨테이너마다 로컬 디스크를 통해 기동되는데 이 로컬디스크는 영구적이지 못함 -> 컨테이너 리스타트 또는 배포될떄마다 로컬디스크는 Pod설정에 따라서 새롭게 정의되서 배포되어 디스크의 기록된 내용 유실 
- 데이터 베이스와 같이 영구적으로 파일을 저장해야되는 경우 컨테이너 리스트에 상관없이 파일을 영속적으로 저장해야 하는데 이러한 형태의 스토리지를 볼륨이라고 한다.
- 쿠버네티스의 볼륨은 Pod내 컨테이너간 공유 가능



###  ** 볼륨사용 시나리오 **
![volume](https://t1.daumcdn.net/cfile/tistory/99FC343C5B02D9C810)
    -   웹서버를 배포하는 Pod가 있을떄 웹서비스를 서비스하는 Web server 컨테이너, 컨텐츠의 내용 (/htdocs)를 업데이트하고 관리하는 Content mgmt 컨테이너, 그리고 로그를 관리하는 Logger 컨테이너
  ![volume2](https://t1.daumcdn.net/cfile/tistory/997CE9435B02D9C824)
    - htdocs와 log 볼륨 각각 생성후 htdocs는 webserver와 contents management 컨테이너에 마운트해서 공유하고 log 볼륨은 Looger와 webserver 컨테이너와 공유하도록 하기  


### Service 
- Pod와 볼륨을 이용하여 컨테이너를 정의한 후 Pod를 서비스로 제공할떄 일반적인 분산환경에서 하나의 Pod로 서비스 하는 경우는 드물다, 
- 여러개의 Pod를 서비스하면서 이를 로드배런서를 이용해서 하나의 IP와 포트로 묶어 서비스 제공
- Pod의 경우 동적으로 생성, 장애 발생시 자동으로 리스타트 되기떄문에 로드밸런서에 ip주소를 이용하는건 어렵다. 그래서 라벨(label)과 라벨 셀렉터(label selector) 사용
- 서비스 정의할떄 어떤 pod를 서비스로 묶을지 정의하는데 이걸 label selector라고 하는데 각 메타데이터 정보부분에 정의할수 있음
- 서비스는 라벨 셀렉터에서 특정 라벨을 가지고 있는 pod만 선택하여 서비스에 묶음
  ![service](https://t1.daumcdn.net/cfile/tistory/99B11D475B02D9C802)
    ```
    kind: Service
      apiVersion: v1
  metadata:
  name: my-service
  spec:
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376
    ```
    -  리소스의 종류 Service -> kind: Service, api버전 v1 -> apiVersion: v1, 메타데이터 서비스의 이름을 my-service로 지정, spec 부분에서 서비스에 대한 스펙 정의 selector에서 app:myapp인 Pod만 선택해 서비스 제공, 포트는 80번 tcp를 사용하되 80번포트의 요청을 컨테이너 9376 포트로 연결해서  서비스를 제공

### Name space
- 네임 스페이스는 한 쿠버네티스 클러스터내의 논리적인 분리단위
- Pod, Service 등의 네임 스페이스 별로 생성이나 관리 될 수 있고 사용자 권한 역시 네임스페이스별로 나눠서 부여할 수 있다.
- 즉 하나의 클러스터내에 개발/운영/테스트 환경이 있을떄 클러스터를 개발/운영/테스트 3개의 네임 스페이스로 나눠서 운영할 수 있다. 
- 네임스페이스로 할수 있는것
  - 사용자별로 네임스페이스별 ACL 운영
  - 네임스페이스 별로 리소스 할당량 지정 가능
  - 네임스페이스 별로 리소스(Pod, Service) 관리 가능
- 주의! 네임스페이스는 논리적 분리단위이므로 물리적이나 기타 장치를 통 환경을 분리한게 아니라서 다른 네임 스페이스간 Pod 라도 서로 통신 가능(물론 네트워크 정책을 통해 통신을 막을수 있다)
- 높은 수준의 분리정책을 원할땐 쿠버네티스 클러스터 자체를 분리해야한다.
![NameSpace](https://t1.daumcdn.net/cfile/tistory/999A364D5B02D9C834)

### 라벨
- 라벨은 쿠버네티스 리소스를 선택하는데 사용됨 각 리소스는 라벨을 가질수 있고 라벨 검색 조건에 따라 특정 라벨을 가질수 있는 리소스 선택 가능
- 이렇게 라벨을 선택하여 특정 리소스에 배포하거나 업데이트 가능 
- 라벨로 선택된 특정 리소스만 Service에 연결하거나 네트워크 접근권한 부여등 가능
```
    kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376
```
## 컨트롤러
- 4개의 기본 오브젝트로, 어플리케이션을 설정하고 배포할떄 이를 좀더 편리하게 관리하기 위함
- 컨트롤러는 Replication Controller, Replicaion Set, DeamonSet, Job, StatefulSet, Deployment 등이 있음

1. Replication  Controller
- Pod를 관리해주는 역활을 하는데 저장된 숫자로 Pod를 기동시키고 관리하는 역활 


## 명령어

![보노보노](/home/student/다운로드/bonono.jpeg)


