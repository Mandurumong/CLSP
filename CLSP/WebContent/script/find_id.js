function fn_findId() {
	var findId = document.findId;
	var user_email = findId.user_email.value;
	var user_pw = findId.user_pw.value;
	var num = user_pw.search(/[0-9]/g);
	var eng = user_pw.search(/[a-z]/ig);
	var spe = user_pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(user_email.length == 0 || user_email == ""){
		alert("이메일을 입력해주세요.")
	}
	else if(user_pw.length == 0 || user_pw == ""){
		alert("비밀번호를 입력해주세요.")
	}
	else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){
		  alert("비밀번호는 영소문자, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");	
	}
	else{
		findId.method = "post";
		findId.action = "findId.do";
		findId.submit();
			
	}
}