# Shell script

- shell의 기능
  - user interface 사용자와 kernel
  - command interpreter 명령어 해석기
  - programing Language

- shell의 종류
  - Bourne (AT $ T)
  - Bash // 기본쉘
  - C
  - Korn
  - Z, TC ..

## Subshell - Child Porcess

![subshell](https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTMk0G2jNm6kGQ5a2mebmWxuV_yTnmoM1N2G1PlomNJDu5-wLcP_P1KPGtfNwzRSVjhKDvR8TJV3jlVLHhTZcFVdQ&usqp=CAU&ec=45690270)


- fork() 시스템 호출

## Shell script란?

- Definition
  - Unix command의 Batch Process
  - 유연성을 주기 위해 문법 적용
- 장점
  - 만들기 쉽다
  - 이식성이 좋다
  - compile 하지 않아도 된다.
- 단점
  - compile 된 코드애 속도가 느리다.

- 위치변수


## 소스코드

1. 일반적인 변수의 설정과 참조
```
[root@docker ~]# var=`date`
[root@docker ~]# echo $var
2020. 08. 18. (화) 12:14:48 KST
```
- 다른 프로그래밍 언어와 마찬가지로 = 를 사용
- = 앞뒤공백이 있으면 안된다
- 대소문자 구별 및 쉘 변수에 형태가 존재하지 않으므로 문자열이나 숫자의 구별없이 설정가능
- 값 설정시 이름앞에 $을 붙이지 않음
  
  2. 명령의 실행결과를 변수로 설정
```
[root@docker ~]# var=`date`
[root@docker ~]# echo $var
2020. 08. 18. (화) 12:14:48 KST
```
- 화면에 표시되는 명령의 실행결과(표준출력에 출력되는 문자열)을 모든 변수에 설정한다.
- 계산 결과 문자열의 편집 결과등 출력의 변수로 설정하려면 `` 사용

3. 변수의 값을 참조
- 형식 var=${command}
```
[root@docker ~]# num=1
[root@docker ~]# echo $num 
1
[root@docker ~]# num2=${num}
[root@docker ~]# echo $num2
1
```
- $()는 중첩가능
```
$ var=$(expr $(expr $(date '+%Y') + $(date '+%m')) + $(date '+%d'))
$ echo $var
2041
```

4. 연산
- exer : 정수 계산시 사용하는 명령어
- bc : exer 과 달리 실수까지 연산가능
```
echo '1+2' | bc
``` 



--------------------------

## 파이프 , 리다이렉션

### 1. 파이프

파이프는 command1 | command2와 같은 형태로 사용되고, command1의 표준 출력을 command2의 표준 입력으로 전달한다. &를 붙이면 표준 에러도 함께 전달한다.
```
$ command1 | command2
$ command1 |& commnad2
# file.txt의 내용을 읽어서, grep의 입력으로 전달 
$ cat file.txt | grep a
```
### 2. 리다이렉션

리다이렉션은 command > filename와 같은 형태로 사용되고, 파일을 읽어서 표준 입력으로 전달하거나, 표준출력을 파일로 저장합니다. 파일 대신 명령의 결과를 입력, 출력할 수도 있다. &를 붙이면 표준 에러도 함께 전달한다.

|리다이렉션|내용|
|------|---|
|<|파일읽기|
|>|파일쓰기(overwrite)|
|>>|파일쓰기(insert)|

```
# 파일 입력
$ command < infile

# 파일 출력 
$ command > outfile
$ command >> outfile
$ command >& outfile
$ command >>& outfile
```



----------------------------
## 정규표현식(Regular Expression)




------------------------------

## sed Process

sed (Stream Editor)

특징
- 입력받은 내용을 그대로 출력
- 패턴 검색 등을 통해 특정 라인에 편집 가능
- 비 대화형 편집기 (대화형 편집기 : vi)
- 파일 입력시 파일 내용이 변경되지 않음
- 라인 단위로 처리됨

패턴 스페이스
- 라인 단위로 처리할 때 패턴스페이스에 집어넣고 처리
- 패턴스페이스에서 처리한 후 표준 출력으로 내보냄
- 옵션을 사용해서 출력을 억제할 수 있음

홀딩 버퍼
- 패턴 스페이스에서 특정 라인을 지정하여 저장하는 버퍼
- G 옵션 사용으로 출력가능

어드레스
- 주소, 라인 수를 의미

=======================================

sed 명령어 형식
# sed [옵션] '[범위] [명령]' [대상파일]
# [명령어] | sed [옵션] '[범위] [명령]'

명령어
p : 해당 라인 표준 출력으로 내보냄.
d : 해당 라인 삭제
s : 교체(Substitute). 패턴을 찾고, 찾은 패턴을 변경
q : 패턴에 해당되는 라인에서 sed 종료
r : 파일에서 내용을 읽어온 후 스트림에 삽입
a\ : 새로운 라인을 추가 (아래) append
i\ : 새로운 라인을 추가 (위) insert
c\ : 해당 라인의 내용을 변경. change
w : 파일로 저장
! : not. 해당되지 않는 패턴 검색

옵션
-e : 다중 실행
-f : 스크립트를 불러와서 sed 실행
-n : 기본 출력 억제

교체플래그
g : s와 함께 사용. g플래그 미사용시 s명령어로 패턴 교체시 첫 번째 패턴만 교체되고 이후의 패턴은 건너뜀.
	ex) s/Mary/Jane/g

범위지정

1) n,m : n줄부터 m줄까지
	ex) 50,60 : 50번째 줄부터 60번째 줄 까지
	sed -n '50,60p' datafile
	sed '1,5d' datafile

2) 패턴검색 : /정규표현식/
	ex) sed -n '/a..e?/p' datafile

3) 패턴으로 범위지정 : /패턴1/,/패턴2/
	ex) sed -n '/3/,/5/p' line


========================================

Sed Print Command

sed '/north/p' datafile
=> 기본적으로 전체를 출력하면서 north 있는 패턴은 한번 더 출력
sed '1,5p' datafile
=> 기본적으로 전체를 출력하고 1~5줄을 한번 더 출력
sed -n '/north/p' datafile
=> 기본 출력을 억제하고 north 패턴이 있는 라인만 출력
sed -n '1,5p' datafile
=> 기본 출력을 억제하고 1~5줄만 출력
sed -n '/west/,/east/p' datafile
=> west 패턴부터 시작해서 east 패턴 찾을 때 까지 출력
sed -n '5,/^northeast/p' datafile
=> 5번째 줄부터 ^northeast 패턴 찾을때 까지 출력
sed '/north/!p' datafile	
=> 전체를 출력하며 north 패턴을 찾지 못한 라인을 한번 더 출력

참고) sed -n '1,5p' datafile = sed '5q' datafile



Sed Delete Command

sed '3d' datafile
=> 3번째 줄일 경우 지움
sed '/north/d' datafile
=> north 패턴을 찾을 경우 지움
sed '2,5d' datafile
=> 2~5줄에 해당할 경우 지움
sed '/north/,/south/d' datafile
=> north 패턴부터 south 패턴까지 지움


Sed Substitute command

sed 's/3/A/' datafile
=> 라인별로 3을 찾고 첫번째 3을 A로 변경 후 다름 라인 진행
sed 's/3/A/g' datafile
=> 라인별로 전체 3을 찾아서 A로 변경
sed 's/west/north/g' datafile
=> west를 north로 변경 
sed -n 's/^west/north/p' datafile
=> ^west를 찾아서 west를 north로 변경 후 변경한 라인 출력
sed 's/[0-9][0-9]$/&.5/' datafile
=> 숫자2자리로 끝나는 패턴 검색 후 해당 패턴 뒤에 .5 삽입
sed -n 's/Hemenway/Jones/gp' datafile
=> 기본출력을 억제하고 Hemenway를 찾아서 Jones로 바꾸고 바꾼 라인 출력
sed 's/[0-9]$//' datafile
=> 맨 끝자리가 숫자인 패턴을 검색하고 마지막 숫자를 삭제
sed 's/\<[0-9]\>//' datafile
=> 독립된 단어 형태의 숫자 한 글자를 삭제

a\ : 새로운 라인을 추가 (아래) append
# sed '10a\
10줄 아래에 추가됩니다' datafile

i\ : 새로운 라인을 추가 (위) insert
ex) # sed '1i\
제목입니다' datafile

c\ : 해당 라인의 내용을 변경. change
ex) # sed '/northeast/c\
northeast는 폐선입니다' datafile

=======================================


Sed File Input/Output

r : 파일의 내용을 읽어와서 찾은 부분에 삽입
ex) sed '/eastern/r message' datafile
message 파일의 내용을 eastern 패턴 아래에 삽입

w : 찾은 내용을 파일로 저장
ex) sed '/north/w northfile' datafile
= grep 'north' datafile > northfile
= sed -n '/north/p' datafile > northfile

=========================================

sed 다중 편집
sed -e '[작업1]' -e '[작업2]' [대상파일] 

# cat > fruits
orange
apple
banana

orange -> apple
apple -> banana

apple
banana
banana

#sed -e 's/apple/orange/' -e 's/orange/banana/' fruits
banana
banana
banana

다중 실행시 앞 명령의 실행결과가 뒤 명령에 영향을 줄 수 있으므로 영향을 파악하고 실행

======================================

sed 스크립트
- 복잡한 sed 실행내용을 별도의 파일로 저장하고 파일을 불러와서 실행

ex) 제목 붙이고, 꼬리말 붙이고, 중간에 sed 내용변경 등 동일한 작업 반복시 실행내용만 스크립트 파일에 저장해 놓고 재사용

ex) sedscript
# My First Script
/Yesterday/ i\
Yesterday - Beetles
/She/ i\
She's Gone - Steelheart
$a\
End

# cat song
Yesterday All my troubles seems so far away
She's Gone... Out of my life...

# sed -f sedscript song
Yesterday - Beetles
Yesterday All my troubles seems so far away
She's Gone - Steelheart
She's Gone... Out of my life...
End


========================================

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
