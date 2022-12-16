function fn_modify(){
	var pw_modify = document.password_modify;
	var user_pw = pw_modify.user_pw.value;
	var user_pw2 = pw_modify.user_pw2.value;
	var num = user_pw.search(/[0-9]/g);
	var eng = user_pw.search(/[a-z]/ig);
	var spe = user_pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(user_pw.length == 0 || user_pw == ""){
		alert("변경하실 비밀번호를 입력해주세요");
	}
	else if(user_pw2.length == 0 || user_pw2 == ""){
		alert("비밀번호 확인을 입력해주세요")
	}
	else if(user_pw2 != user_pw){
		alert("비밀번호가 일치하지 않습니다.")
	}
	else if(user_pw1.search(" ") != -1){
		alert("공백없이 입력해주세요.")
	}
	else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){
		alert("비밀번호는 영소문자, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	}
	else{
		password_modify.method="post";
		password_modify.action="";
		password_nodify.submit();
		alert("비밀번호 변경이 완료되었습니다.")
	}
}