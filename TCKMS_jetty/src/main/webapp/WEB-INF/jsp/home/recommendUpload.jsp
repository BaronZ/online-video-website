<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="css/latestUpload.css" rel="stylesheet" type="text/css" />
<link href="css/content.css" rel="stylesheet" type="text/css" />
<style>
#recommend_title{
	background:url(images/recommend_bg.png) no-repeat;
	line-height:50px;
	text-indent:90px;
	height:60px;
}
</style>
<div id="latestUpload" class="fl">
	<a id="latestUpload_more" href="Home_VideoListRecommend.action?vtid=0" class="fr">更多&gt;&gt;</a>
	<h2 id="recommend_title">推荐视频</h2>
   <c:forEach var="video" items="${requestScope.vlist_recommend}" begin="0" end="3">
    			<div id="simpleInfo" class="fl m15">
        			<c:url value="playVideo.action" var="getVInfoUrl">
						<c:param name="vid" value="${video.video_id}"/>
					</c:url>
        			<a href="${ getVInfoUrl}" target="_blank">
        				<img id="videoShortImg" src="${video.video_img_url}" />
            		</a>
            		<dl id="videoShortInfo">
           			  	<dt id="videoShortInfo_title" class="f14">
                        	<a href="${ getVInfoUrl}" target="_blank" title="${video.video_title}">
                            	${video.simple_video_title}  
                            </a>
                        </dt>
                		<dd>作者：${video.nickname}</dd>
                		<dd>发布时间：${video.video_udate}</dd>
                		<dd>点击数：${video.video_clicks }</dd>
            		</dl>
        		</div>
	</c:forEach>
</div>
