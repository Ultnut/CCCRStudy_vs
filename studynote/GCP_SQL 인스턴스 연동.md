GCP_SQL 인스턴스 연동



 : IAM 계정 생성 및 키(json파일) 생성 및 권한 부여 
-> 파일 복사 후 인스턴스의 사용자 홈 디렉토리에 json 확장자로 vim 파일 생성 


@db (cloud sql)  instance_name:dbtest, root:dkagh2.
$ gcloud sql connect dbtest --use r=root --quiet

Create database dbtest;
create user dbadmin@’%’ identified by ‘dkagh1.^^’;
grant all on dbtest.* to dbadmin@’%’;
flush privileges;
show grants for dbadmin@’%’;
접근 허용 네트워크 추가 (0.0.0.0/0 -> 특정서버IP)


@web (VM인스턴스)
sudo yum install mysql
mysql -u dbadmin -p -h [db_external_ip]34.68.60.207
exit

 proxy 사용하는 경우 : cloud sql API -library
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64

실행 권한 주기
IAM 서비스 계정 및 JSON 키 생성 

tcp 3306 포트 이용
$ ./cloud_sql_proxy.linux.amd64 -instances=[db연결이름]=tcp:3306  -credential_file=[/home/gmailaccount/key json파일]
$ ps -ef | grep cloud_sql
$ mysql -u root -p --host 127.0.0.1 

Unix socket이용
    $ mkdir /cloudsql
$ chmod 777 /cloudsql
$ ./cloud_sql_proxy.linux.amd64 -dir=/cloudsql -instances=[db연결이름] -credential_file=[key json파일]
$ ps -ef | grep cloud sql
$ mysql -u root -p -S /cloudsql/[소켓명]

![asd]()

