<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="css/announcement.css" rel="stylesheet" type="text/css" />
<div class="fl w700" id="announcement">
	<dl>
    	<a  href="news_init.action" class="fr mt20">更多&gt;&gt;</a>
    	<dt id="announcement_title">最新公告</dt>
        <s:iterator value="#request.newsList"  var="news" >
        	<dd><a href="news_detail.action?news_id=${news.news_id}"><s:property value="#news.news_title"/></a></dd>
        </s:iterator>
    </dl>
</div>

<script type="text/javascript">
$("#announcement dd").mouseover(
	function(){	
		$(this).css("background","#CCC");	
	}
);
$("#announcement dd").mouseleave(
	function(){	
		$(this).css("background","#fff");	
	}
);
</script>