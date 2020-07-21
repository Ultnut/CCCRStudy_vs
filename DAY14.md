비오는 월요일.. 

임소영 강사님 네트워크 수업 

윈도우 비밀번호 : qwer1234

https://drive.google.com/drive/folders/18QEGw_4igPHWuvFuQkdp8awuXVwIeeyR


## 네트워크 복습 

- 라우터는 3계층 장비
  


실습1)
1. subneting(design)
2. packet trace IP 할당
3. routing : RIP


+ 구글 드라이브 문서 있씀
------------------------------------------

routing : 패킷을 목적지에 전달하기 위해 경로 정보를 어느 노드애 전달하는지 각 노드들이 판단할 수 있고 그 경로정보에 따라 패킷을 전달하는 기능 


- 서브넷팅
- RIP
- OSPF
- static

### routing update
- router achcture 
- splite horizon
- link state update 
  

### RIP 특징
-   Dinstant route update 방식
-   루핑 방지 정책
-   여러가지 정책(기술)이 적응되어 있음
  - metric : hop count
  - classful : class - summary 

  1. maximam hop count
  2. split horizon
  3. route posioning
  4. posion reverse(route posiing 답장)
  5. trigger update(Ripv2) 


### Rip 단점 -> OSPF 

## RIP
metric : hop count
-> RIP은 속도와 상관없이 홉카운트만 따진다.
- Ddistance vetor update
- 30초 -> loop
- Rip v1 - classful
- Rip v2 - classless


## OSPF
metric : cost(BW계산)
- 링크변화 -> 즉시 업데이트
- link state update 
- pacekt 5
- classless

----------------------------------
Network ID와 HOST ID를 구분
SubnetMask : 네트워크 아이디를 1로 표기 호스트 아이디는 0으로 표기
  -> 사용처 : IP 할당시


WildcardMask : 네트워크 아이디를 0으로 표기 호스트 아이디는 1로 표기 
  -> 사용처 : 라우팅 네트워크 선언, ACL 정책 설정할떄 1이면 match , 0 이면 mismatch 

  /27 hostID 5bit = 2^5 = 32-1 = 31 0.0.0.31


https://www.inflearn.com/course/%EC%A0%9C%EC%A3%BC%EC%BD%94%EB%94%A9-%EC%9B%B9%EA%B0%9C%EB%B0%9C-30%EB%B6%84%EC%9A%94%EC%95%BD