function withdrawal(){
	var cf = window.confirm('회원탈퇴시 작성한 글이 모두 삭제됩니다. \n 탈퇴하시겠습니까?')
	if(cf){
		location.href = '/mypage/withdrawal';
	}
}
