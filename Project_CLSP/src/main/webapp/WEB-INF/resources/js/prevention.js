function callApi(){
	 $.ajax({
           url:'/clsp/api/call',
           dataType:'text',
           success:function(data){
           	console.log(data)
           }
       })
}
