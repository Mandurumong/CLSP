function deleteBtn(){
	var cf = window.confirm('삭제하시겠습니까?')
	if(cf){
		location.href="/board/delete?fbNum=${board.FB_NUM}"
	}
}


function replyModifyBtn(b){
	var e = document.getElementsByClassName('reply_content_'+b)
	var c = e[0].innerText
}