<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>视频教学网</title>
	<link href="css/index.css" rel="stylesheet" type="text/css" />
	<link href="css/Search_box.css" rel="stylesheet" type="text/css" />
	<link href="css/page_break.css" rel="stylesheet" type="text/css" />
	<link href="css/rank.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
	<script type="text/javascript" src="js/jquery.ellipsis.js"></script>
	
	</head>

	<body>
		<div class="container">
			<div class="header">
				<s:if test="#session.user==null">
				<div style="text-align: right;font-size: 18px;"><a href="${pageContext.request.contextPath }/login.jsp">登录</a></div>
				</s:if><s:else>
				<div style="text-align: right;font-size: 18px;">
				<a href="upload_toVedioAction.action">视频上传</a>
				<s:property value="#session.user.nickname"/>&nbsp;|&nbsp;<a href="l_logout.action">退出</a>
				</div>
				</s:else>
    			<div id="top">
    			<form action="Home.action" method="get" name="form">
        		<img src="${pageContext.request.contextPath }/images/home/LOGO.jpg" /> 
            	<input id="search_text" name="key" type="text" value="${requestScope.key}"/>
            	<input type="submit" class="btn31" value="Search" />
            	</form>          
        	</div>
        
        	<div id="menu">
        		<div class="menul">
            	<div class="menur">
        			<ul>
						<li>
							<a href="Home.action?vtid=0"><h3>首页</h3> </a>
						</li>
						
						<!-- 视频类别 -->
						<c:forEach items="${sessionScope.navbar}" begin="0" var="item">
						<li>
							<a href="Home.action?vtid=${item.video_type_id}" >${item.video_type_name}</a>
		    			</li>
    					</c:forEach>
    					<li>
    						<a href="Home.action?vtid=1"><h3>其它</h3> </a>
						</li>
						<!-- 视频类别 -->
					</ul>
            	</div>
            	</div>
        	</div>
    	</div>
    	<div style="height:20px; background:#FFF; text-align:left;padding-left: 5px;">
    	<s:if test="#request.vlist.size!=0&&#request.key!=null">共找到${requestScope.vcount}个结果</s:if></div> 
    	<div class="right_side">
    	<div id="rank">
        	<ol id="rank_ol">
            <p>排行榜&nbsp;<span id="top10">Top10</span></p>
            <c:forEach items="${requestScope.hotvlist}" begin="0" var="item">
            	<c:url value="playVideo.action" var="getVInfoUrl">
            		<c:param name="vid" value="${item.video_id}"/>
				</c:url>
            	<li ><a href="${getVInfoUrl}" class="hvlength" target="_blank" title="${item.video_title}">${item.simple_video_title}</a></li>
            </c:forEach>
                
            </ol>
        </div>
        
    </div>
    
    <div class="content">
    <s:if test="#request.vlist.size==0&&#request.key==null">
    	<div style="padding-top: 40px;text-align: center; font-size: 20px;">对不起，暂无该类别视频！</div>
    </s:if>
    <s:elseif test="#request.vlist.size==0&&#request.key!=null">
    	<div style="padding-top: 40px;text-align: center; font-size: 20px;">对不起，找不到您需要的视频！</div>
    	<div style="padding-left:200px;padding-top: 5px;text-align: center; font-size: 12px;">
    		<a href="Home.action?vtid=0" style="color: blue;">>>点击返回首页</a>
    	</div>
    </s:elseif>
    <s:else>
    <div style="height: 680px;">
    <c:forEach var="video" items="${requestScope.vlist}" >
    	<div id="simple_info" style=" width:150px;">
        	<c:url value="playVideo.action" var="getVInfoUrl">
					<c:param name="vid" value="${video.video_id}"/>
			</c:url>
        	<a href="${ getVInfoUrl}" target="_blank">
        	<img style=" width:150px; height:120px;" src="${video.video_img_url}" />
            </a>
            <div style="width:150px;height: 50px;">
            	<p class="vlength"><a href="${ getVInfoUrl}" target="_blank" title="${video.video_title}">${video.simple_video_title}</a></p>
                <p>作者：${video.nickname}</p>
                <p>发布时间：${video.video_udate}</p>
                <p>点击数：${video.video_clicks }</p>
            </div>
        </div>
        </c:forEach>
        </div>
        <div class="pagination">
			<ul>
			<s:if test="#request.pagecount!=1">
			<!-- 判断当前页是否为第一页 -->
			<s:if test="#request.curpage==1">
			<li class="disablepage">« previous</li>
			</s:if>
			<s:else>
			<li class="prepage">
			<a href="${requestScope.alink}&page=${requestScope.curpage-1}">« previous</a>
			</li>
			</s:else>
			
			<!-- 判断是否为当前页 -->
			<s:iterator value="#request.btmpage"  var="ipage" >
			<s:if test="#ipage==#request.curpage">
			<li class="currentpage"><s:property value="#ipage"/></li>
			</s:if>
			<s:else>
				<li><a href="${requestScope.alink}&page=${ipage}"><s:property value="#ipage"/></a></li>
			</s:else>
			</s:iterator>	
			
			<!-- 判断是否为最后一页 -->
			<s:if test="#request.curpage==#request.pagecount">
				<li class="disablepage">next »</li>
			</s:if>
			<s:else>
				<li class="nextpage"><a href="${requestScope.alink}&page=${requestScope.curpage+1}">next »</a></li>
			</s:else>
			</s:if>
			</ul>
		</div>
		</s:else>
       </div>
    <div class="footer">
    </div>
</div>
</body>
</html>
