<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="css/content.css" rel="stylesheet" type="text/css" />
<div class="content fl">
    <s:if test="#request.vlist.size==0&&#request.key==null">
    	<p>对不起，暂无该类别视频！</p>
    </s:if>
    <s:elseif test="#request.vlist.size==0&&#request.key!=null">
    	<p>对不起，找不到您需要的视频！</p>
        <p>
        	<a href="Home.action?vtid=0" style="color: blue;">
            	>>点击返回首
            </a>
		</p>
    </s:elseif>
    <s:else>
    	<div>
    		<c:forEach var="video" items="${requestScope.vlist}" >
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
        
	</s:else>
    
</div>

