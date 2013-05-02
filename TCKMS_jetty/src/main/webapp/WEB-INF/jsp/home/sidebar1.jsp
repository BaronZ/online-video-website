<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="css/sidebar1.css" rel="stylesheet" type="text/css" />

<div class="fr rightSide">
	<div id="rank">
		<ol id="rank_ol">
			<h2>
            	排行榜&nbsp;<span id="top10">Top10</span>
            </h2>
            <c:forEach items="${requestScope.hotvlist}" begin="0" var="item">
            	<c:url value="playVideo.action" var="getVInfoUrl">
            		<c:param name="vid" value="${item.video_id}"/>
				</c:url>
            	<li class="ml50">
                	<a href="${getVInfoUrl}" target="_blank" title="${item.video_title}">
                    	${item.simple_video_title}
                    </a>
                </li>
            </c:forEach>
                
		</ol>
	</div>     
</div>