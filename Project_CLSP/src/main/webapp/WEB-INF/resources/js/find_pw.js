function fn_findPw() {
	var findPw = document.findPw;
	var user_email = findPw.user_email.value;
	var user_id = findPw.user_id.value;
	
	if(user_email.length == 0 || user_email == ""){
		alert("이메일을 입력해주세요.")
	}
	else if(user_id.length == 0 || user_id == ""){
		alert("아이디를 입력해주세요.")
	}
	else{
		findPw.method = "post";
		findPw.action = "findPw.do";
		findPw.submit();
			
	}
}