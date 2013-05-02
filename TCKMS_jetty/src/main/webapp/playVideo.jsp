<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>播放页面</title>
<!-- 播放器js代码 -->
<script type='text/javascript' src="${pageContext.request.contextPath }/jwplayer/jwplayer.js"></script>
<!-- 留言js代码 -->
<script type='text/javascript' src="${pageContext.request.contextPath }/js/comment.js"></script>
<!-- 收藏js代码 -->
<script type='text/javascript' src="${pageContext.request.contextPath }/js/favorites.js"></script>
<style type="text/css">
.container {
	width:1000px;
	height:1000px;
	margin:0 auto;
}
#mediaspace {
	position: absolute;
	margin-top:60px;
	width:650px;
	height:450px;
	float:left;
}

#play_times {
	position: absolute;
	margin-top:200px;
}
</style>
<style type="text/css">
#video_info_top {
	background:url(${pageContext.request.contextPath }/images/home/fade_away.png);
	opacity:0.9;
	height:35px;
	border-color:#6CF;
	border-width:1px;
	border-style:solid;
}
#video_info {
	height: 450px;
	width: 300px;
	margin: auto;
	background:url(${pageContext.request.contextPath }/images/home/fade02.jpg);
	float:right;
	position:absolute;
	margin-left:700px;
	margin-top:-260px;
}
#video_info_top h2 {
	position: absolute;
	margin-top:6px;
}
#video_info_top h1 {
	font-size: 36px;
}
#video_info div p {
	font-size: 24px;
}
</style>
<link href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/Search_box.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container">
	<div id='mediaspace'>This text will be replaced</div>
	<script type='text/javascript'>
		  jwplayer('mediaspace').setup({
		    'flashplayer': '<%=path %>/jwplayer/player.swf',
		    'file': '<%=path %>/${requestScope.video.video_link }',
		    'controlbar': 'bottom',
		    'width': '470',
		    'height': '320',
		    'plugins': {       
					'viral-2': {           
						'onpause': 'false',
						'callout': 'none'       
					}    
				}
		  });
		  /////////////

	</script>
	<!--jwplayer生成代码-->
    <div id="video_info">
    	<div style="height:50px">标题：${requestScope.video.video_title }</div>
    	<div id="video_info_top">
        	<h1>视频信息</h1>
        </div>
        <div>
        	<br/>
        	<p>上传者:${requestScope.video.nickname }</p>
           <p>发布时间:${requestScope.video.video_udate}</p> 
            <p>时长:${requestScope.video.video_duration }</p>
            <p>点击量:${requestScope.video.video_clicks }</p>
            <p>类型:${requestScope.video.video_type_name }</p>
            
            <a href="javascript:void(0)" id='favorites' onclick="favorites(this)" >收藏</a>
        </div>
    </div>
    <br style="clear:both;" />
</div>

<div id="msgBoard"></div>
	留言板
	<div>
		内容${vid }<textarea id="content" rows="5"></textarea><br/>
		<input type="hidden"  id="vid"   value="${vid }"/> 
		<button onclick="comment()">留言</button>
	</div>
	
</body>
</html>

