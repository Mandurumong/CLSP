document.addEventListener("DOMContentLoaded", function(){
	selectedControl()
});

function selectedControl(){
	var category = '${board.FB_CATEGORY}'
	var el = document.getElementById('category');
	var len = el.options.length;

	for (let i=0; i<len; i++){  
	    if(el.options[i].value == category){
	    	el.options[i].selected = true;
	    }
	  }  
}