/**
 * 收藏
 * ＠author zzb
 * */
var XMLHttpReq;
function createXMLHttpRequest() {
	
	if (window.XMLHttpRequest) { // Mozilla 浏览器
		XMLHttpReq = new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE浏览器
		try {
			XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
}
function favorites(o) {
	//alert(o.innerHTML);
	createXMLHttpRequest();
	if(o.innerHTML=="收藏")
		var url = "cfajax_fav.action";
	else
		var url = "cfajax_unFav.action";
	alert(url);
	var vid = document.getElementById("vid").value;
	var param = "vid="+vid;
	XMLHttpReq.onreadystatechange = note;// 调用
	XMLHttpReq.open("POST", url, true);
	XMLHttpReq.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	XMLHttpReq.send(param);
}

function note() {
	if (XMLHttpReq.readyState == 4) {
		if (XMLHttpReq.status == 200) {
			
			if(document.getElementById("favorites").innerHTML=="收藏"){
				//alert("收藏成功");
				document.getElementById("favorites").innerHTML = "取消收藏";
			}
			else{
				//alert("取消收藏成功");
				document.getElementById("favorites").innerHTML = "收藏";
			}
		}
	}
}
 
