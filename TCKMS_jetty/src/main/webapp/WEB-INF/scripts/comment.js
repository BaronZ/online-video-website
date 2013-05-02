/**
 * @author TheRealBo
 */
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
function studyAjax() {
	createXMLHttpRequest();
	var url = "comment.action";
	var title = document.getElementById("title").value;
	var content = document.getElementById("content").value;
	var param = "title=" + title + "&content=" + content;// 传参数，vid,mid,nickname,time,content
	XMLHttpReq.onreadystatechange = ajaxstudy;// 调用ajaxstudy
	XMLHttpReq.open("POST", url, true);
	XMLHttpReq.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	XMLHttpReq.send(param);
}
function ajaxstudy() {
	if (XMLHttpReq.readyState == 4) {
		if (XMLHttpReq.status == 200) {
			var board = document.getElementById("msgBoard");// 获得div 显示部分
			var data = XMLHttpReq.responseText;
			board.innerHTML = data;// 讲TEXT显示在DIV部分
			alert("留言成功");
		}
	}
}