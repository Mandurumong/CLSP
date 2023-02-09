var category;
var keyword;
var type;

// 해당 페이지 들어오면 바로 실행 
document.addEventListener("DOMContentLoaded", function(){
	console.log("1")
	selectedControl()
});

function go(p){
	if(category === undefined){
		category = 'all'
	}
	if(keyword === undefined){
		keyword = ''
	}
	console.log("t", type)
	if(type === undefined){
		type = ''
	}
	console.log("1", keyword, "2",type, "3",category)
	location.href="/board/list?category="+category+"&page="+p+"&type="+type+"&keyword="+keyword
}

// 카테고리 옵션값에 따라 보드 검색  
function selectOption(e){
	category = e.options[e.selectedIndex].value
	location.href = '/board/list?category='+category
}

// href 페이지 이동을 통해 얻어진 쿼리스트링 값으로 옵션 선택
function selectedControl(){
	
	var queryString = window.location.search
	console.log("queryString: "+ queryString)
	
	var categoryIndex = queryString.indexOf('category')
	console.log("categoryIndex: "+ categoryIndex)
	if(categoryIndex > 0){
		category= ""+category
		category = queryString.substr(categoryIndex+9)
		console.log("category: "+ category)
		if(category.includes('&')){
			category = category.substring(0,category.indexOf('&'))
		}
		console.log("category", category)
	}
	

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
	
	var el = document.getElementById('category');
	
	var len = el.options.length;

	for (let i=0; i<len; i++){  
	    if(el.options[i].value == category){
	    	el.options[i].selected = true;
	    }
	  }  
}

// 검색
function searchcheck() {
	var check =  document.getElementById("searchText").value.length;
	var el = document.getElementById('searchField');

	type = el.options[el.selectedIndex].value;
	keyword =  document.getElementById("searchText").value;
	
	if (check == 0) {
		alert("검색어를 입력해주세요.")
		return
	}
	else if (check >100) {
		alert("검색어는 100자 미만으로해주세요.")
		return
	}
	else {
		if(category == undefined || category.length < 1){
			category = 'all'
		}
		location.href = '/board/list?type='+type+"&keyword="+keyword+"&category="+category
	}
}