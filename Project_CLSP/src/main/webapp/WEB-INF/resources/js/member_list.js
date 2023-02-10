function searchcheck() {
	var check =  document.getElementById("searchText").value.length;
	var el = document.getElementById('searchField');

	type = el.options[el.selectedIndex].value;
	keyword =  document.getElementById("searchText").value;
	
	if (check == 0) {
		alert("검색어를 입력해주세요.")
		return
	}
	else {
		location.href = '/memberList?type='+type+"&keyword="+keyword
	}
}

function go(p){
	if(keyword === undefined){
		keyword = ''
	}
	console.log("t", type)
	if(type === undefined){
		type = ''
	}
	console.log("1", keyword, "2",type)
	location.href="/memberList?page="+p+"&type="+type+"&keyword="+keyword
}

function selectedControl(){
	
	var queryString = window.location.search
	console.log("queryString: "+ queryString)
	
	var keywordIndex = queryString.indexOf('keyword')
	console.log("keywordIndex: "+ keywordIndex)
	if(keywordIndex > 0){
		keyword= ""+keyword
		keyword = queryString.substr(keywordIndex+8)
		if(keyword.includes('&')){
			keyword = keyword.substring(0,keyword.indexOf('&'))
		}
		console.log("keyword", keyword)
		if(type === undefined || type == ""){
			type = 'title'
		}
	}
	
	var selectIndex = queryString.indexOf('type')
	if(selectIndex > 0){
		type= ""+type
		type = queryString.substr(selectIndex+5)
		if(type.includes('&')){
			type = type.substring(0,type.indexOf('&'))
		}
		console.log("type", type)
	}  
}