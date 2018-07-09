var input = document.querySelector('input');
var el = {
	value:'',
	caption:'',
	name:input.name,
}
input.addEventListener('click', function(){

	if(this.checked){
		el.value = 1;
		el.caption = "ON";
	}else{
		el.value = 0;
		el.caption = "OFF"
	}
	ajaxJs(el);
	this.parentElement.previousElementSibling.innerText = el.name + " has changed to " + el.caption
	console.log('input_val:' , el)
})

function ajaxJs(data){
	console.log('ajaxJs', data)
	var http = new XMLHttpRequest();
	var url = "../html/api/check_data.php";
	var data = 'value='+data.value+'&caption='+data.caption+'&name='+data.name

	http.open('POST', url, true);
	http.setRequestHeader('Content-type','application/x-www-form-urlencoded');

	http.onreadystatechange = function(){
		if(http.readyState === 4 && http.status == 200){
			var res = JSON.parse(http.responseText);
			console.log(res);
			var messageArea = document.querySelector('.message');
			messageArea.innerText = res.message;
			messageArea.classList.add(res.cssClass);

		}
	}
	http.send(data);
}