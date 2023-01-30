function fn_check(){
	var pwReConfirm = document.pwReConfirm;
	var user_pw = pwReConfirm.user_pw.value;
	
	if(user_pw.length == 0 || user_pw == ""){
		alert("비밀번호를 입력해주세요");
	}
	else{
		pwReConfirm.method="post";
		pwReConfirm.action="adminInfo.do";
		pwReConfirm.submit();
		alert("확인 되었습니다.")
		
	}
}