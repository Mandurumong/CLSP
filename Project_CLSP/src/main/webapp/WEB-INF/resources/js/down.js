function fn_mdown(){
	if(confirm("Excel 파일로 다운로드 됩니다.") == true){
		location.href = "/MemberDown.do";
	}else{
		return false;
	}
}

function fn_Bdown(){
	if(confirm("Excel 파일로 다운로드 됩니다.") == true){
		location.href = "/BoardDown.do";
	}else{
		return false;
	}
}