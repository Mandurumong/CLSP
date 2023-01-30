function fn_validate(){
	var signup = document.signup;
	var user_id = signup.user_id.value;
	var user_pw1 = signup.user_pw1.value;
	var user_pw2 = signup.user_pw2.value;
	
	 var num = user_pw1.search(/[0-9]/g);
	 var eng = user_pw1.search(/[a-z]/ig);
	 var spe = user_pw1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if(user_id.length == 0 || user_id == ""){
		alert("아이디를 입력해주세요.");
		
	}
	if(user_pw1.length == 0 || user_pw1 ==""){
		alert("비밀번호를 입력해주세요.")
	}
	else if(user_pw1 != user_pw2){
		alert("비밀번호가 일치하지 않습니다.")
	
	}
	else if(user_id.length < 4 || user_id.length > 16){
		alert("아이디는 4자리 이상 16자 이하로 해주세요.")
		
	}
	else if((user_id.search(" ") != -1) || (user_pw1.search(" ") != -1)){
		alert("공백없이 입력해주세요.")
		
	}
	else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){
		  alert("비밀번호는 영소문자, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	
	}
	else{
		signup.method="post";
		signup.action="insertMember.do";
		signup.submit();
		alert("회원가입이 완료되었습니다.")
	}
}

function checkId(){
    var user_id = $('#user_id').val(); //user_id값이 "user_id"인 입력란의 값을 저장
    
    $.ajax({
        url: './idCheck', //Controller에서 요청 받을 주소
        type: 'post', //POST 방식으로 전달
        data: {user_id: user_id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
            }
        },
        error:function(){
            alert("에러 발생");
        }
    });
    };