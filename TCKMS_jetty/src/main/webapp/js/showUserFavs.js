/**
 * 显示用户“收藏列表”
 * ＠author zzb
 * */
//document.write(" <script language=\"javascript\" src="\/com\/ Js_file02.js \" > <\/script>"); 
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
/**
 * 获取用户收藏列表
 */
function getPersonalInfo(o){
	//alert(o.innerHTML);
	createXMLHttpRequest();
	if(o.innerHTML == "我收藏的")
		var url = "ajax_showUserFavs.action";
	else
		var url = "ajax_showUserUpload.action";
	//alert(url);
	//获取用户id
	var uid = document.getElementById("uid").value;
	var param = "uid="+uid;
	
	XMLHttpReq.onreadystatechange = showPersonalInfo;// 调用showFavs
	XMLHttpReq.open("POST", url, true); 
	XMLHttpReq.setRequestHeader("Content-type", 
			"application/x-www-form-urlencoded");
	XMLHttpReq.send(param);
}

function showPersonalInfo() {
	if (XMLHttpReq.readyState == 4) {
		if (XMLHttpReq.status == 200) {
			var board = document.getElementById("myCollection");// 获得div 显示部分
			var data = XMLHttpReq.responseText;
			board.innerHTML = data;// 讲TEXT显示在DIV部分
		}
	}
}
