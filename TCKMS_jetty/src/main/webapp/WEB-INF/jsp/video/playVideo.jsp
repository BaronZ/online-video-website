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
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/playVideo.css" rel="stylesheet" type="text/css" />
<!-- 播放器js代码 -->
<script type='text/javascript' src="${pageContext.request.contextPath }/jwplayer/jwplayer.js"></script>

<!-- 收藏js代码 -->
<script type='text/javascript' src="${pageContext.request.contextPath }/js/favorites.js"></script>
<!-- 留言js代码 -->
<script type='text/javascript' src="${pageContext.request.contextPath }/js/comment.js"></script>

</head>

<body>
<div class="w1000 m0a">
	<div style="font-size: 20px;color:blue;padding-top: 15px;padding-bottom: 15px;font-style: inherit;">${requestScope.video.video_title }</div>
	<a href="Home_Init.action">返回首页</a><br/>
    <!--播放器代码-->
	<div id='mediaspace'>This text will be replaced</div>
    <script type='text/javascript'>
		  jwplayer('mediaspace').setup({
		    'flashplayer': '<%=path %>/jwplayer/player.swf',
		    'file': '<%=path %>/${requestScope.video.video_link }',
		    'controlbar': 'bottom',
		    'width': '1000',
		    'height': '563',
		    'plugins': {       
					'viral-2': {           
						'onpause': 'false',
						'callout': 'none'       
					}    
				}
		  });
		  /////////////

	</script>
    <!---->
    <!--评论块-->
    <div class="w600 fl">
    	<div id="comment_issue">
        	<div class="h50">
            	<h2>所有评论(8)</h2>
            </div>
            <div class="mt20" id="comment_add">
            	<div>
            		<img src="images/myIcon.gif" />
                    <div class="w500 fr">
                	<textarea id="playVideo_comment_textarea" class="fr cb"></textarea><br />
                    <input type="hidden"  id="vid"   value="${vid }"/>
                    <button class="fr mt5 " onclick="comment()">发表评论</button>
                   <!--  <input class="fr mt5 " type="button" onclick="comment()" value="发表评论" /> -->
                    <span class="fr mt5 mr10">你还可以输入140字</span>
                    <a class="fl mt5" href="#">表情</a>
                    </div>
                </div>
            </div>      
        </div>
        <div class="pt50 h1000 cb" id="comment_content">
            	<div>第1~7条，共7条</div>
                
                 <c:forEach var="cmt" items="${requestScope.cmts}" >
	                <div class='border-bottom mt20 clearfix' id='comment_userComment'>
	                	<img class='fl mr30' src='images/myIcon.gif' />
	                    <p class='fb'>${cmt.nickname }<span class='ml50 fn grey'>发表于：${cmt.time}来自广东</span></p>
	                    <div class='w600 mt20 mb10' id='comment_userComment_detail'>
	                    <span class="fl mt-50">
	                    	${cmt.content }
	                    </span>
	                    </div>
	                  
	                </div>
                </c:forEach>
        </div>
    </div>
    <!---->
    <!--视频信息块-->
    <div id="videoInfo" class="w400 fl">
    	<h2 class="f30 ml50 lh200">视频信息</h2>
        <ul>
        	<!--  
        	<li class="cb mt10">
            <span>标题:</span>
            <div class="fr cb w200">${requestScope.video.video_title }</div>
            </li>
            -->
            <li class="cb mt10">
            <span>上传者:</span>
            <div class="fr cb w200">${requestScope.video.nickname }</div>
            </li>
            
            <li class="cb mt10">
            <span>发布时间:</span>
            <div class="fr cb w200">${requestScope.video.video_udate}</div>
            </li>
            
            <li class="cb mt10">
            <span>时长:</span>
            <div class="fr cb w200">${requestScope.video.video_duration }</div>
            </li>
            
            <li class="cb mt10">
            <span>类型:</span>
            <div class="fr cb w200">${requestScope.video.video_type_name }</div>
            </li>
            
            <li class="cb mt10">
            <span>点击量:</span>
            <div class="fr cb w200">${requestScope.video.video_clicks }</div>
            </li>

        </ul>
		<a class="fr cb mr50" href="javascript:void(0)" id='favorites' onclick="favorites(this)">
			<c:if test="${requestScope.isFav=='true'}">取消收藏</c:if>
			<c:if test="${requestScope.isFav!='true'}">收藏</c:if>
		</a>
		
    </div>
    <!---->
    
    
</div>
</body>
</html>