function fn_validate(){
	var admin_modify = document.admin_modify;
	var user_pw = admin_modify.user_pw.value;
	var user_email = admin_modify.user_email.value;
	
	var num = user_pw.search(/[0-9]/g);
	var eng = user_pw.search(/[a-z]/ig);
	var spe = user_pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(user_pw.length == 0 || user_pw == ""){
		alert("변경하실 비밀번호를 입력해주세요");
	}
	else if(user_pw.search(" ") != -1){
		alert("공백없이 입력해주세요");
	}
	else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){
		  alert("비밀번호는 영소문자, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	
	}
	else{
		admin_modify.method="post";
		admin_modify.action="adminModify.do";
		admin_modify.submit();
		alert("정보 수정이 완료 되었습니다.")
	}
}