function deleteBtn(){
	var cf = window.confirm('삭제하시겠습니까?')
	if(cf){
		location.href="/board/delete?fbNum=${board.FB_NUM}"
	}
}