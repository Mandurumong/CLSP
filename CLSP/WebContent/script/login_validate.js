function login_validate(){
	var frmLogin = document.frmLogin;
	var user_id = frmLogin.user_id.value;
	var user_pw = frmLogin.user_pw.value;
	
	if(user_id == null || user_id.length == 0 || user_id == ""){
		alert("아이디를 입력해 주세요.")
	} else {
		alert("비밀번호를 입력해 주세요.")
	}
		
	}