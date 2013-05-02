/**
 * ajax评论
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

function comment() {
	createXMLHttpRequest();
	var url = "cfajax_comment.action";
	var content = document.getElementById("playVideo_comment_textarea").value;
	var vid = document.getElementById("vid").value;
	
	var param = "vid="+vid+"&content="+content;
	XMLHttpReq.onreadystatechange = showComment;// 调用showComment
	
	XMLHttpReq.open("POST", url, true); 
	XMLHttpReq.setRequestHeader("Content-type", 
			"application/x-www-form-urlencoded");
	XMLHttpReq.send(param);
}
function showComment() {
	
	if (XMLHttpReq.readyState == 4) {
		if (XMLHttpReq.status == 200) {
			var board = document.getElementById("comment_content");// 获得div 显示部分
			
			var data = XMLHttpReq.responseText;
			board.innerHTML = data;// 讲TEXT显示在DIV部分
			alert("留言成功");
		}
	}
}