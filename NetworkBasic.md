# 네트워크 용어정리

이더넷 헤더, 우채귝 아죠씨



-----------------------------------------



## OSI 7계층

![OSI7](https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2112683A54FA6D3509)

### L7) 

- 서비스 응용

### L6)

- 데이터 표현, 압축 암호화

### L5)

- 세션 확립&종류

### L4)

- 전송방식, 정확 TCP, 신속 UDP
- 포트를 사용해 통신
- L4 스위치 - 로드밸런싱 

### L3)

- 주소방식 -> 라우팅 치적의 경로를 찾기
- L3 스위치

### L2)

- 스위칭 ( LAN , WAN )
- L2 스위치는 IP를 몰름

### L1) 
- 물리적 케이블

## 네트워크 장비




1.  허브


2.  라우터
- 라우터는 3계층 장비. 
네트워크 계층에서는 하위 물리계층과 데이터링크 계층을 거친 정보들이 전달될수 있도록 '포워딩' '라우팅' 한다.


3.  스위치
    - 내트워크 스위치란 무엇인가? -> 사무실에서 컴퓨터 및 프린터 서버를 연결하기 위해 스위치를 사용함(Controller) 기능 수행
   -   처리 가능한 패킷의 숫자가 큰것으로 네트워크 단위 들을 연결하는 통신 장비로서 소규모 통신을 위한 허브보다 전송속도가 개선된것 
   -   L2 switch, L3 switch, L4 Switch, L7 Switch 로 구분된다.
   -   허브와 다르게 출발지와 목적지가 1:1로만 대이터를 주고받음
   -   MAC주소를 이용해 통신
   -   flooding, fowarding
   -   라우터와 스위치의 차이? 스위치는 네트워크들을 만들어내고 라우터는 네트워크를 연결함 
   - 

## 로드밸런싱

- 부하분산 또는 로드 밸런싱(load balancing)은 컴퓨터 네트워크 기술의 일종으로 둘 혹은 셋이상의 중앙처리장치 혹은 저장장치와 같은 컴퓨터 자원들에게 작업을 나누는 것을 의미, 
- 스위치가 로드밸런싱 역활을 한다.


## IP 

https://www.youtube.com/watch?v=nzCtXdESCzM

### 서브넷 마스크

### 와일드 카드 마스크


## 라우팅 테이블

- 라우팅 테이블은 경로를 지정하는 방식에 따라 테이블 및 라우팅 프로토콜이 분류된다.


- 출발지와 목적지에 대한 정보를 바탕으로, 패킷이 전달 될 경로를 지정하는 방식이 바로 라우팅 테이블이다

1) 정적 라우팅 테이블(Static Routing)
- 일정 주기마다 갱신하는 방식

2) 동적 라우팅 테이블(Dynamic Routing)
- 네트워크에 변동 사항이 발생하면 자동으로 갱신되는 방식

### 라우팅 프로토콜

1)  RIP(Routing Information Protocol)
 라우팅 정보 프로토콜
- 거리백터 라우팅 알고리즘 사용
- 최소 거리의 경로 우선시함
- RIP은 속도와 상관없이 홉카운트만 따진다.

2)  OSPF(Open Shortest Path First) 최단 경로 우선 프로토콜
- 링크상태 라우팅 알고리즘 사용
- 노드의 형태, 비용, 링크 동작상태를 감안하여 최소 경로 설정

3) BGP(Border Gateway Protocol) 경계 경로 프로토콜
- 경로벡터 라우팅 알고리즘 사용
- 도메인 간 라우팅에 유용

### VLAN

- Virtual Local Area Network 의 약자로 물리적 배치와 상관없는 가상의 논리적 LAN
- 스위치의 모든 인터페이스는 동일 브로드캐스트 도메인에 포함되어 있으나 VLAN을 적용할 경우 스위치 일부 인터페이스를 하나의 브로드 캐스트 도멘으로 구성하고 다른 인터페이스를 또다른 브로드캐스트 도메인으로 구성하여 여러개의 도메인을 만들 수 있다.
- 네트워크 리소스 보안을 높이고, 비용절감, 간편한 설정 및 불필요한 트래픽을 줄임

1) ACCESS PORT : 특정 vlan에 속하는 포트
2) trunk-port : 두개 이상의 vlan에 속하는 포트 , 각기 다른 vlan이 데이터를 주고 받을수 있게 한 라인으로 된 통로 
3) trunking : 각기 다른 vlan이 데이터를 주고 받을 수 있게 하는 한 라인으로 구성된 통로 서로 다른 스위치에 있는 vlan이 서로 통신하기 위해서는 vlan 정보를 주고 받아야 하는데 이떄 tagging을 하여 통신 할 수 있음
4) tagging : 트렁킹 프로토콜에서 vlan을 구별하는 용도로 사용함, vlan에 id를 붙여서 구분하는 방법을 프레임 태깅이라고 한다.

- 요약 : access 는 트렁킹 사용을 막고 항상 access 포트로 사용되게 한다. trunk는 항상 트렁킹 포트로 사용한다. 
+ valn 200번에 왜 디폴트 포트인 vlan 1번의 포트들을 넣는 이유 -> 트렁크 포트 사용 못하도록 하기 위해성!




### ACL
- Access List 
- 네트워크에 접근여부를 허용할지 말지를 결정하는 리스트(필터링)
- 보안을 위해 사용된다
- acl은 주로 standard와 extended로 구분핢
  1) Standard acl : source address만 참조해서 필터링 여부를 결정
  2) extended acl : source address 외에도 목적지 주소, 프로토콜, 포트 번호등 좀더 자세한 정보를 참조해서 필터링 여부를 결정함


## NAT

- 라우터에서 사설IP를 공인 IP로 변환 시켜서 다른 공인IP와 통신하는 주소 변환 기술
- 라우터, 서버, 방화벽, 유무선공유기에서도 가능함.
-  사설 IP를 지정하여 Intranet 내부에서만 임의의 ip를 사용할 수 있게 함
-  중복된 ip를 사용할 수 있으므로 사설 ip를 이용한 공용 네트워크를 구축 가능
-  인트라넷에서 공용 네트워크에 접근하기 위해 네트워크를 연결하는 라우터에서 사설ip를 공인ip로 변환시켜 내보낸다.

1. Static Nat
- 사설 IP (1) : 공인 IP (1)
2. Dynamic NAT
- 사설 IP (N) : 공인 IP (M) -> 동시에 통신 가능한 장비가 공인 IP 수로 제한 된다. 
3. NAT - PAT (Port address translation)
- 사설IP(N) : 공인IP(1) -> 하나의 공인 IP로 다수의 사설 IP를 이용한 통신이 지원됨 


-----------------------------------
참고링크
------------------------------------

https://onecellboy.tistory.com/278

https://jhnyang.tistory.com/194

-----------------------------------------

simplex, duplex 