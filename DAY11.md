https://tariat.tistory.com/656 // 쥬피터 노트북 단축키

파이썬 알고리즘 백준 풀기

정처기 필기 준비
--------------------------------------------------

OPenStack 맛보기

야자떄 단어정리 하기..



Nova -> vm

controller : 전반적인 관리 

compute : vm 실행 

network : 

storage : 

중요노드 c9,P0

Nova, Neutron, keystone, glance, swift, cinder

### 클라우드 컴퓨팅 : 클라우드(인터넷)을 통해 가상화된 컴퓨터의 리소스를 제공해주는것 


서비스 모델 - 클라우드 분류 

IaaS(Infrastructure as a service) - HOST : 서비스로서 인프라 자원을 제공하여 사용자가 인프라 자원을 사용하는 것, 서버, 스토리지, 네트워크를 가상으로 만들어 사용자가 필요한 자원을 사용할 수 있게 함. 대부분 퍼블릭 클라우드가 IaaS에 속함 

![IaaS](https://wodonggun.github.io/img/2018-07-13-IaaS,%20PaaS,%20SaaS/5.jpg)
 
PaaS(Platform as a service) - BUILD :서비스로서 플랫폼 소프트웨어를 제공하고 사용자는 제공된 플랫폼을 사용하는것 PaaS는 SaaS의 개념을 개발 플랫폼으로 확장한 방식

PaaS를 통해 개발을 위한 플랫폼(OS)를 웹에서 쉽게 빌려 사용할 수있음 

![PaaP](https://wodonggun.github.io/img/2018-07-13-IaaS,%20PaaS,%20SaaS/6.jpg)

SaaS(Software as a service) - CONSUME 
: 서비스로서 소프트웨어 어플리케이션을 제공, 사용자는 제공된 소프트웨어를 사용하는 것
보통 laaS 와 PaaS 위에 올라가는 소프트웨어, 중앙에서 호스팅되고 있는 소프트웨어를 웹 브라우저같은 애플레케이션을
통해 사용

![SaaS](https://wodonggun.github.io/img/2018-07-13-IaaS,%20PaaS,%20SaaS/6.jpg)

## 가상화 : 
컴퓨터에서 컴퓨터 리소스의 추상화를 일컫는말

기존 온프레미스 환경에서는 서비스 하나당 서버를 한개씩 운용하여 CPU이 남아돌았음 하지만 가상화를 통해 여러 서비스를 별도 분리하지 않고 한대의 서버로도 다양한 서비스를 운용할수 있다.

컴퓨터 시스템이 가진 자원을 분활해주는 걸 "서버 가상화" 라고 한다.

## 하이퍼바이저
: 하드웨어를 소프트웨어 파티셔닝을 통해 가상머신에게 제공하는 소프트웨어 가상 머신 모니터라 부르기도하고 주요기능은 모니터링, 시스템자원관리, 가상머신의 독립성 유지

즉 호스트컴퓨터에서 다수의 운영체제를 동시에 실행하기 위한 논리적 플랫폼을 말한다.

네이티브 방식과 호스트 방식으로 나뉨 

호스트 방식 : 이미 사용자가 사용하고 있는 OS위에 하이퍼바이저를 설치 
장점: 간편하게 설치가능 (KVM, VMWARE)

네이티브 방식 : 하드웨어 위에 바로 하이퍼바이저 전용 운영체제를 설치해서 가상머신을 관리

장점은 호스트 운영체제가 없기떄문엥 리소스 확보에 유리 하지만 네이티브 하이퍼바이저를 유지하는 엔진이 없다면 가상머신 생성 불가능

## 가상화와 컨테이너의 차이점?

컨테이너 방식은 호스트위 (커널) 에서 유저 공간을 여러개로 누나어 고립된 공간을 만들어줌 
-> 도커 엔진 