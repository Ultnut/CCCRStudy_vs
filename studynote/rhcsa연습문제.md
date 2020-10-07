https://docs.google.com/document/d/1CrngqEMkKpCmd_KKRcsnqV93r6Whsyx-LN_IFKhZITQ/edit

 ## selinux 포트 추가
: semanage port -a -p tcp -t http_port_t [pnum]
- 조회방법
: semanage port -l | grep http 


setfacl과 대문자 X link
setfacl로 권한을 지정할 때 실행 권한을 뜻하는 x 대신 X를 쓸 수도 있습니다. 이는 해당 대상이 디렉터리거나 이미 실행 권한이 있는 파일에만 퍼미션을 줍니다. 실행 권한을 과도하게 주지 않고 꼭 필요한 대상에게만 주기에 유용한 기능입니다11