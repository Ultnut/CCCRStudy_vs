## 과제 문서제출있쑴
------------------------


application
----------------
middleware
---------------
OS
----------------
HW, Network

## 1. 클라우드 종류 : 
 - laas 
 - paas 
 - saas
## 2. 클라우드 이용모델 : 
- 퍼블릭 클라우드
- 프라이빗 클라우드 : 클라우드 기반 소프트웨어 이용, 자사 전용 클라우드 환경을 구축해서 운영하는 형태, 자체적인 보안 정책에 따른 강력한 보안 환경을 구축해서 운용함.
- 호스티드 프라이빗 클라우드 : 클라우드 사업자가 기업 사용자별로 클라우드 환경을 제공함, 단기간에 전용 클라우드 환경을 구축하고, 월 비용을 지불하여 사용 
- 커뮤니티 클라우드 
- 하이브리드 클라우드

## 3. 대표적인 클라우드 서비스 
   - AWS
   - GCP
   - AZURE
  

## 4. 웹 서비스
 #### 웹 어플리케이션 : 
 
 - 브라우저에서 애플리케이션에 접속하면 네트워크에 있는 웹서버에서 처리가 이루어진 다음에 처리 결과가 웹브라우저에 표시됨. 네트워크가 가능한 환경이라면 브라우저가 이용할 수 있는 단말기에서 플랫폼을 가리지 않고 이용 가능

-  네이티브 애플리케이션 : 휴대전화나 게임기에서도 실행되는 애플리케이션. 애플리케이션을 설치한 단말기나 컴퓨터에서 처리를 수행함. 애플리케이션 구현은 실행하는 하드웨어나 OS에 의존함. 같은 기능을 가진 애플리케이션이라도 플랫폼마다 다르게 개발해야함. 개발의 자유도가 높고 속도가 빠름.

- URL  :Uniform Resource Locator)

-  scheme://[user]:[password]@[host]:[port]/[url-path]?[searchpart]

scheme 스키마. 통신에 사용하는 프로토콜 지정
ftp 파일 전송, http/https 웹서버 접근, mailto 이메일 수신처 , file 파일에 접근
 url-path 문서 경로(document path) : 생략한 경우 index.html로 접근
 searchpart 검색 파라미터 : 서버에 물어볼 때 사용할 파라미터를 지정. 
	key=value
	key1=value1&key2=value2



	{web clinet]				{web server}
	웹브라우저				apache 등
	---------------------HTTP Request------------->
	<--------------------HTTP Response-------------(html, javarscript, 그림 등)
	해석


HTTP 프로토콜	1991년 HTTP/0.9
		HTTP/1.0
		HTTP/1.1
		2015년02월 HTTP/2.0

 ### HTTP Request Method 요청방식 (가장많이 사용하는 method는 get,post)
 
 -  GET 리소스 취득을 요청. 웹사이트를 열람할 때에 페이지나 그림 취득 등에 사용
 -  POST 폼에 입력한 데이터를 서버에 접송
 -  PUT 리소스 갱신을 요구
 -  DELETE 리소스 삭제를 교구
 -  HEAD : HTTP 헤더 정보만만을 요구
 -  CONNECT : 프록시 서버를 경유해서 SSL 통신을 하는 경우 등에 사용
 -  OPTIONS 서버가 지원하는 메소드나 옵션을 조사
 -  Trace : HTTP 동작을 트레이스

### HTTP Response Code
	100 번대  - 정보
	200 번대  - OK 성공
	300 번대  - 리다이렉트 (302 영구이동, 304 갱신안됨, 305 프록시 사용)
	400 번대  - 클라이언트 에러 (400 올바르지 않은 요청, 401 인증 에러, 403 접근금지, 404 없는 파일, 408 타임아웃)
	500 번대  - 서버 에러 (500 서버 내부 에러, 501 구현되지 않음, 502 게이트웨이에러, 503 과부하)