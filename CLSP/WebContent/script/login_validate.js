
//아이디, 비밀번호 입력 확인 / 공백 체크
function login_validate(){
	var frmLogin = document.frmLogin;
	var user_id = frmLogin.user_id.value;
	var user_pw = frmLogin.user_pw.value;
	
	if(user_id == null || user_id.length == 0 || user_id == ""){
		alert("아이디를 입력해 주세요.");
		frmLogin.user_id.focus();
		return false;
		
	} 
	/*여기부터 지우기 가능*/
	
	//아이디 입력 문자 수를 4초과 16미만자로 제한
	else if(frmLogin.user_id.value.length < 4 || frmLogin.user_id.value.length > 16) {
		alert("아이디는 4~16자 이내로 입력해 주세요.");
		frmLogin.user_id.select();
		return false;
	}
	
	else if(user_pw == null || user_pw.length == 0 || user_pw == "") {
		alert("비밀번호를 입력해 주세요.");
		frmLogin.user_pw.focus();
		return false;
	} 
	else {
		frmLogin.method="post";
		frmLogin.action="login.do";
		frmLogin.submit();
	}
		
	}

	
