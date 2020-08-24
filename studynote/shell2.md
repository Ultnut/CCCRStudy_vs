## 제어문

조건문 / 반복문 / 분기문

조건문
1) if
c언어
if (조건){	}
ex) if (a>100) { printf("a는 100보다 큽니다"); }

쉘 프로그래밍 if
if [조건식]
then
[if조건 만족시 실행할 내용]
fi
ex) 
if [ $a -lt 100 ]
then
	echo "a가 100보다 큽니다"
fi

2) if-else
if [ 조건식 ]
then
	[if가 참일 때 실행할 내용]
else
	[if가 거짓일 때 실행할 내용]
fi


3) if-else if- else
if [조건식1]
then
	[조건1이 참일때 실행할 내용]
elif [조건식2]
then
	[조건2가 참일때 실행할 내용]
else
	[모든 조건이 거짓일 때 실행할 내용]
fi

=========================================

조건식 - test command

- 조건식 평가에 사용됨
- 참/거짓에 따라 Exit Status(종료상태)가 변경됨 (0:참 / 1:거짓)
- 문자열/산술/파일 평가 가능
- test [조건식 비교]
- [ 조건식 ]
	ex) if [ $A -lt 100 ]

문자열 비교
문자열1 = 문자열2 : 문자열1과 문자열2가 같으면 참/ 다르면 거짓
문자열1 != 문자열2 : 문자열1과 문자열2가 다르면 참/ 같으면 거짓
문자열 : 문자열일 NULL이 아니면 참, NULL이면 거짓
-z 문자열 : 문자열의 길이가 0이면 참 / 아니면 거짓
-n 문자열 : 문자열의 길이가 0이 아니면 참 / 0이면 거짓

정수 비교
정수1 -eq 정수2 : 정수1과 정수2가 같으면 참 / 아니면 거짓 equal
정수1 -ne 정수2 : not equal, 같으면 거짓, 다르면 참
정수1 -lt 정수2 : less than, 정수1이 2보다 작으면 참 / 아니면 거짓
정수1 -le 정수2 : less or equal, 정수1이 2보다 작거나 같으면 참 / 아니면 거짓
정수1 -gt 정수2 : grater than, 정수1이 정수2보다 크면 참 / 아니면 거짓
정수1 -ge 정수2 : grater or equal, 정수1이 2보다 크거나 같으면 참 / 아니면 거짓

파일 비교
-b [파일이름] : 파일이 블록 장치 파일이면 참 / 아니면 거짓
-c [파일이름] : 파일이 캐릭터 장치 파일이면 참 / 아니면 거짓
-d [파일이름] : 파일이 디렉터리이면 참 / 아니면 거짓
-f [파일이름] : 파일이 일반파일이면 참 / 아니면 거짓
-s [파일이름] : 파일 크기가 0이면 참 / 아니면 거짓
-r [파일이름] : 파일에 읽기권한이 있으면 참 / 아니면 거짓
-w [파일이름] : 파일에 쓰기권한이 있으면 참 / 아니면 거짓
-x [파일이름] : 파일에 실행권한이 있으면 참 / 아니면 거짓
-u [파일이름] : SetUID 가 설정되어 있으면  참 / 아니면 거짓
-g [파일이름] : SetGID 가 설정되어 있으면 참 / 아니면 거짓
-k [파일이름] : StickBit가 설정되어 있으면 참 / 아니면 거짓

Null Command
: 
종료상태를 0으로 리턴
아무것도 하지 않음

==========================================

Korn Shell, Bash Shell에서 사용할 수 있는 조건식

문자열
[[ 문자열 = 패턴 ]] : 문자열이 패턴을 포함하면 참, 아니면 거짓
[[ 문자열 != 패턴 ]] : 문자열이 패턴을 포함하지 않으면 참
[[ 문자열1 > 문자열2 ]] : 문자열간의 ASCII값 대소 비교
[[ 문자열1 < 문자열2 ]] : 문자열간의 ASCII값 대소 비교

산술비교
(( $NUM > 10 )) : NUM변수의 값이 10보다 크면 참
(( $NUM < 10 ))
(( $NUM = $NUM + 10 ))
(( $NUM1 > 10 && $NUM2 > 20 )) : 논리곱
(( $NUM1 > 10 || $NUM2 > 20 )) : 논리합


========================================

Shell 프로그래밍 테스트

#!/bin/bash
echo -n "Input your fruit : "
read FRUIT

if [ $FRUIT = "orange" ]
then
	echo "Fruit is Orange"
fi



#!/bin/bash
echo -n "Input your fruit : "
read FRUIT

if [ $FRUIT = "orange" ]
then
	echo "Fruit is Orange"
elif [ $FRUIT = "mango" ]
then
	echo "Fruit is mango"
elif [ $FRUIT = "apple" ]
then
	echo "Fruit is apple"
elif [ $FRUIT = "banana" ]
then
	echo "Fruit is banana"
else
	echo "I don't know!"
fi

======================================

#!/bin/bash

echo -n "Enter Username : " 
read USERNAME

if grep $USERNAME /etc/passwd > /dev/null 2>&1
then
	echo "Exist!"
else
	echo "None!"
fi


참고) redirection
File Descripter 번호
0 : 표준 입력 stdin. 키보드입력
1 : 표준 출력 stdout. 모니터출력
2 : 표준 에러 stderr. 모니터출력

> : 표준 출력 방향재지정 = 1>
2> : 표준 에러 방향 재지정 
< : 표준 입력 방향 재지정

1> /dev/null 2>&1 : 표준 출력을 /dev/null로 보내서 삭제, 표준 에러도 표준 출력(1)과 같은 방향으로 전달하여 버림


========================================

프로그램 개요
- 파일명을 스크립트 실행시에 인자로 전달
- 입력받은 파일이 일반 파일인지 확인 : 일반 파일이면 File!
- 입력받은 파일이 디렉토리인지 확인 : 디렉토리이면 Dir!
- 둘다 아니다 : I don't know! 출력

#!/bin/bash

if [ -f $1 ]
then
	echo "File!"
elif [ -d $1 ]
then
	echo "Directory!"
else
	echo "I don't know!"
fi

======================================

수정판

#!/bin/bash

# 위치매개변수 개수체크
if [ $# -ne 1 ]
then
	echo "Usage : ./if.sh [filename]"
	exit 1
fi

# 파일 종류 검사
if [ -f $1 ]
then
	echo "File!"
elif [ -d $1 ]
then
	echo "Directory!"
else
	echo "I don't know!"
fi

========================================

case : 선택 실행

case 변수 in
값1)
	실행내용
	;;
값2)
	실행내용
	;;
값3)
	실행내용
	;;
*)	
	실행내용
	;;
esac


실습1
#!/bin/bash

echo "1) cal     2) date     3) uname -a"
echo -n "Select One : "
read NUM

case $NUM in
1)	cal ;;
2)	date ;;
3) 	uname -a ;;
*)	echo "Merong" ;;
esac

실습2
#!/bin/bash

echo -n "Select Color : "
read COLOR

case $COLOR in
red)	echo "RED" ;;
yellow)	echo "YELLOW" ;;
blue) 	echo "BLUE" ;;
*)	echo "Merong" ;;
esac

실습3

#!/bin/bash

echo -n "Select Color : "
read COLOR

case $COLOR in
red|RED)	echo "RED" ;;
yellow|YELLOW)	echo "YELLOW" ;;
blue|BLUE) 	echo "BLUE" ;;
*)	echo "Merong" ;;
esac


실습4
#!/bin/bash

echo -n "Yes or No? "
read ANS

case $ANS in
y*|Y*)	echo "YEEEES!!!!" ;;
n*|N*)	echo "NOOOOO!!!!" ;;
*)	echo "Merong" ;;
esac

=======================================

반복문

for
C언어 : 
for(초기식;비교식;증감식)
{
	실행내용
}

Shell 프로그래밍
for 변수 in [변수에 집어넣을 값의 목록]
do
	실행내용
done

while
C언어
while(조건)
{
	실행내용
}
Shell 프로그래밍
while [조건]
do
	실행내용
done

until [조건]
do
	실행내용
done


=======================================

for
- 일반적인 프로그래밍과 사용방법이 상이함
- 반복회수를 지정하여 반복하는 형태 사용이 어려움
  (bash Shell은 C스타일의 for문 사용가능)
- 인자를 전달받아 인자의 개수만큼 실행하는 형태로 사용

#!/bin/bash

for FRUIT in `cat fruits`
do
	echo $FRUIT
done

# cat fruits
banana
orange
apple


#!/bin/bash
for FN in `ls`
do
	echo "File Name :"$FN
done


=========================================

bash 에서 사용가능한 for 문의 사용방법
for (( VAR=0 ; VAR<10 ; VAR++))
do
	echo $VAR
done

for VAR in `seq 1 1 10` => for VAR in 1 2 3 4 5 6 7 8 9 10
do
	echo $VAR
done

#!/bin/bash
for VAR in "$@"
do
	echo $VAR
done

$* : 전체 위치매개변수, 각 공백을 인자의 구분자로 인식
$@ : 전체 위치매개변수, 각 공백을 인자의 구분자로 인식
"$*" : 전체 위치매개변수, 전체 위치매개변수를 한개의 인자로 인식
"$@" : 전체 위치매개변수, " "로 묶인 인자를 한개의 인자로 인식, 나머지 공백은 구분자로 인식

========================================

while
- 조건식이 참일 경우에 반복문 실행
- 초기값을 while 위에서 지정 후, while 조건에 값을 비교하고, while 내부에서 값을 변경하여 반복회수 지정
- 무한 반복(Loop)를 실행하며 지정 조건 만족시 탈출

while [조건]
do
	실행내용
done

실습1
#!/bin/bash
NUM=0
while [ $NUM -lt 5 ]
do
	echo "NUM="$NUM
	NUM=`expr $NUM + 1`
done

실습2 - bash 에서만 실행가능
#!/bin/bash

NUM=0

while [ $NUM -lt 5 ]
do
	echo "NUM="$NUM
	(( NUM=NUM+1 ))
done

실습3
#!/bin/bash
STR="test"
while [ $STR != "END" ]
do
	read STR
	echo "INPUT : "$STR
done

실습4
#!/bin/bash
while [ : ]
do
	read STR
	if [ $STR = "END" ]
	then
		echo "ByeBye~"
		exit 0
	fi
	echo "INPUT : "$STR	
done

분기문
exit : 스크립트를 즉시 종료. 종료상태를 지정
break : 반복문을 한 단계 탈출, break 2 - 두 반복문 탈출
continue : 반복문의 비교식 위치로 이동, continue 2 - 두 단계 위의 반복문 비교식 위치로 이동

========================================

실습5
#!/bin/bash
while sleep 1
do
	echo "Merong"
done

======================================

trap : 스크립트가 시그널을 처리하는 방법


========================================

Shell프로그래밍 site:kldp.org

Shell 프로그래밍의 기본 - KLDP Wiki
https://wiki.kldp.org/Translations/html/Shell_Programming-KLDP/

고급 Bash 스크립팅 가이드 - KLDP Wiki
https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/