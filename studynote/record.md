### 문자열 자르기 
-   cut 명령어 사용
```
Lee     50      100     70
Park    50      60      90
kim     100     80      60

[root@docker testdir]# cut -c 1-4 list.txt 
kim
Lee
Park

```

### 문자열 정렬
-   sort 명령어 사용



## awk

-   awk 형식 : awk [option] '/pattern/' file 
    -   sed나 grep과 동일하게 라인 처리시 사용
    -   sed나 grep를 사용하는개 더 좋다..

```
# awk '/KIm/' list.txt

[root@docker testdir]# awk '/Lee/' list.txt 
Lee     50      100     70d

```

awk 

cut / sort / uniq

홍길동	30	2500
장동건	40	5000
선우용녀	50	10000

구분자 (Delimeter)

cut : 바이트 단위 / 필드 단위로 데이터 출력
-d : 구분자 지정
-f : 필드 지정
-c : 바이트 지정

sort : 데이터 정렬
-t : 구분자 지정
-k : 필드 지정
-n : 해당 필드가 숫자일 경우 숫자로 정렬 (기본값 : 문자열)
-r : 역순 정렬

uniq : 인접한 줄을 비교하여 중복일 경우 제거


========================================

awk

- awk : 전통적인 awk
- nawk : New awk 
- gawk : GNU awk

특징
- 데이터 조작, 리포트 생성 등을 지원하는 도구
- 내부적인 프로그래밍 기능 지원
- 레코드 단위 처리 (기본 레코드 구분자가 개행문자 - 라인단위처리)
- 필드 단위로 데이터 처리 가능
- 정규표현식 사용가능
- sed, grep 등과 사용법이 유사

용어정리
레코드 : 한번에 처리되는 데이터의 양. 기본값으로 라인
필드 : 필드 구분자로 분리된 레코드 내의 데이터
레코드구분자 : RS (Record Separator). 레코드와 레코드를 구분하는 구분기호
필드 구분자 : FS (Field Separator). 필드와 필드를 구분하는 구분기호
ORS : Output RS. 출력형태의 레코드 구분자
OFS : Output FS. 출력형태의 필드 구분자
NF : Number of Field. 현재 레코드의 필드 개수
NR : Number of Record. 현재 처리중인 레코드의 번호
$0 : 전체 레코드 
$n : 특정 레코드, $1, $2...

nawk 명령어 사용법
# nawk '/패턴/' [대상파일] : 특정 패턴을 찾고 출력 (= grep)
# nawk '{명령}' [대상파일] : 모든 레코드에 대하여 동일한 명령 수행
# nawk '/패턴/ {명령}' [대상파일] : 패턴을 찾고 찾은 패턴에 대하여 명령 수행

명령
print : 특정 필드 지정하여 출력, 사용자가 입력한 문자열 출력

Escape Sequence
\b : Backspace. 커서 위치를 한 칸씩 앞으로 이동
\r : Carriage Return. 커서를 현재 줄 맨 앞으로 이동
\n : New Line. 다음줄로 넘김
\t : Tab. 탭을 삽입
\a : Beep. Beep음 출력
=> " " 안에 입력

필드 구분자 지정
nawk -F [구분자] 
ex) nawk -F: ....
ex) nawk -F'[: ]' ....

패턴 검색 방법
1. nawk '/[패턴]/' [대상파일]

2. 특정 필드가 정규표현식을 만족하는지 비교 : match 연산자
# nawk '$1 ~ /Kim/' testfile

3. 특정 필드가 산술 비교를 만족하는지 비교
# nawk '$2 > 300' testfile


실습
$ nawk ‘/west/’ datafile	
$ nawk ‘/^north/’ datafile	
$ nawk ‘/^(no|so)/’ datafile	
$ nawk ‘ {print $3, $2}’ datafile	
$ nawk ‘ {print $3  $2}’ datafile	
$ nawk ‘print  $3, $2’ datafile	
$ nawk ‘{print $0}’ datafile	
$ nawk ‘{print “필드 수: ” NF}’ datafile	

$ nawk ‘/northeast/ {print $3, $2}’ datafile
$ nawk ‘/E/ {print NR, $1}’ datafile 
$ nawk ‘$6 ~/\.[7-9]+/ {print NR, $1, $6}’ datafile
$ nawk ‘$2 !~ /E/ {print  $1, $2}’ datafile
$ nawk ‘$3 ~ /^Sharon/ { print $3 “ is  a pretty girl.”} ’ datafile
$ nawk ‘$8 ~ /[0-9][0-9]$/ {print  $8}’ datafile
$ nawk ‘/May/ {print  $0}’ datafile

$ nawk ‘{print  $1}’	/etc/passwd
$ nawk -F: ‘{print  $1}’ /etc/passwd

$ nawk ‘{print  “Number of Fields : “ NF}’ /etc/passwd
$ nawk -F: ‘{print  “Number of Fields : “ NF}’ /etc/passwd

$ nawk -F”[  :]” ‘{print  $1, $2}’ /etc/passwd
$ nawk -F”[  :]” ‘{print  “Number of Fields : “ NF}’ /etc/passwd


=========================================

awk 명령어 프로그래밍 기능

산술연산자 사용
+ : '{print $5 +10}'
- : '{print $5 -10}'
* : '{print $5 *10}'
/ : '{print $5 / 10}'
% : '{print $5 % 10}'

관계연산자 사용 (범위지정)
== : '$5 == 100'
!= : '$5 != 100'
> : '$5 > 50'
< : '$5 < 50'
>= : '$5 >= 50'
<= : '$5 <= 50'

지정연산자 사용
= : 우측의 값을 좌측으로 대입
nawk '$1 ~ /정우성/ {$5 = 100; print $1, $5}'

조건연산자 사용
? :
nawk '{print ($5 >= 90 ?  $1 ": 수" : $1 ": 우")}' datafile

논리연산자 사용
논리합(OR) : '$3 >90 || $3 <10'
논리곱(AND) : '$3 > 70 && $3 < 80'
부정(NOT) : '$4 != 10' 는 '!($4==10)' 과 같다

=======================================

변수
- 변수 선언시 자동 초기화
- 숫자면 0, 문자열 ""

BEGIN / END 구조
nawk '{실행내용}' 파일명
기본적인 nawk의 실행내용은 레코드 개수 만큼, 또는 지정된 범위에 해당되는 레코드의 개수만큼 실행

BEGIN/END는 nawk 시작시, nawk 종료시 한번씩 만 수행
nawk 'BEGIN{ } { } END{ }' 파일이름
nawk 'BEGIN{ } { }{ }{ }{ }{ } END{ }' 파일이름

BEGIN에 들어가는 내용
- nawk 실행시 처음 1회 실행되는 부분
- FS, RS, OFS, ORS 등을 변경할 때 사용
ex1) nawk 'BEGIN{ FS=: }{ } END{ }' /etc/passwd
ex2) nawk -F: '{ }' /etc/passwd 	// ex2보다 ex1이 효율적
- 사용자 정의 변수를 선언 / 초기화
ex1) nawk 'BEGIN{ SUM=0 } { }' datafile
ex2) nawk 'BEGIN{ NUM=100 } { }' datafile
- 헤더/타이틀 출력에 사용

END
- nawk 명령어의 실행 결과 출력
- 문서 마지막 정리 양식

========================================

awk 스크립트
nawk 명령어의 ' ' 내부 내용을 스크립트 파일로 저장
nawk -f [스크립트파일] 로 실행

========================================

BEGIN{ FS=":"; OFS="\t\t"; count=0; sum=0
print "============================================="
print "Name\t\t\tArea\t\tSales"
print "============================================="
}
{ print $1,$3,$7 }
{ sum += $7 }
/north/{ count++ }
END{
print "============================================="
print "Total Sale : "sum
print "North Salesman count : "count
print "============================================="
}




========================================

조건문

# nawk -F: '{ if ($7>10) { print "Good Job!" } else { print $1" Are you crazy?" }}'


=======================================
